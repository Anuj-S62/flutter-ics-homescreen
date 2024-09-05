import 'package:flutter_ics_homescreen/export.dart';
import 'package:protos/applauncher_api.dart';
import 'package:protos/agl_shell_api.dart';

class AppLauncher {
  final Ref ref;

  late ClientChannel aglShellChannel;
  late AglShellManagerServiceClient aglShell;
  late ClientChannel appLauncherChannel;
  late AppLauncherClient appLauncher;

  List<String> appStack = ['homescreen'];

  AppLauncher({required this.ref}) {
    aglShellChannel = ClientChannel('localhost',
        port: 14005,
        options: const ChannelOptions(credentials: ChannelCredentials.insecure()));

    aglShell = AglShellManagerServiceClient(aglShellChannel);

    appLauncherChannel = ClientChannel('localhost',
        port: 50052,
        options: const ChannelOptions(credentials: ChannelCredentials.insecure()));
    appLauncher = AppLauncherClient(appLauncherChannel);
  }

  run() async {
    getAppList();

    try {
      var response = appLauncher.getStatusEvents(StatusRequest());
      await for (var event in response) {
        if (event.hasApp()) {
          AppStatus appStatus = event.app;
          debugPrint("Got app status:");
          debugPrint("$appStatus");
          if (appStatus.hasId() && appStatus.hasStatus()) {
            if (appStatus.status == "started") {
              activateApp(appStatus.id);
            } else if (appStatus.status == "terminated") {
              deactivateApp(appStatus.id);
            }
          }
        }
      }
    } catch (e) {
      print(e);
    }
  }

  getAppList() async {
    try {
      var response = await appLauncher.listApplications(ListRequest());
      List<AppLauncherInfo> apps = [];
      for (AppInfo info in response.apps) {
        debugPrint("Got app:");
        debugPrint("$info");
        // Existing icons are currently not usable, so leave blank for now
        apps.add(AppLauncherInfo(
            id: info.id, name: info.name, icon: "", internal: false));
      }
      apps.sort((a, b) => a.name.compareTo(b.name));

      // Add built-in app widgets
      apps.insert(
          0,
          AppLauncherInfo(
              id: "clock", name: "Clock", icon: "clock.svg", internal: true));
      apps.insert(
          0,
          AppLauncherInfo(
              id: "weather",
              name: "Weather",
              icon: "weather.svg",
              internal: true));

      ref.read(appLauncherListProvider.notifier).update(apps);
    } catch (e) {
      print(e);
    }
  }

  void startApp(String id) async {
    await appLauncher.startApplication(StartRequest(id: id));
  }

  addAppToStack(String id) {
    if (!appStack.contains(id)) {
      appStack.add(id);
    } else {
      int current = appStack.indexOf(id);
      if (current != (appStack.length - 1)) {
        appStack.removeAt(current);
        appStack.add(id);
      }
    }
  }

  activateApp(String id) async {
    if (appStack.last != id) {
      var req = ActivateRequest(appId: id);
      aglShell.activateApp(req);
      addAppToStack(id);
    }
  }

  deactivateApp(String id) async {
    if (appStack.contains(id)) {
      appStack.remove(id);
      if (appStack.isNotEmpty) {
        activateApp(appStack.last);
      }
    }
  }
}
