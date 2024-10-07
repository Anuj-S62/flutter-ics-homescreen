import 'package:flutter_ics_homescreen/export.dart';

class VersionInfoPage extends ConsumerWidget {
  static String aglVersionFilePath = '/etc/os-release';
  static String kernelVersionFilePath = '/proc/version';

  static String aglVersion() {
    try {
      final file = File(aglVersionFilePath);
      final data = file.readAsStringSync().split("\n");
      if (!data[1].contains('Automotive Grade Linux')) {
        throw 'Non-AGL distribution';
      }
      return "AGL: " + data[2].split('"')[1];
    } catch (_) {
      return '<AGL version not found>';
    }
  }

  static String kernelVersion() {
    try {
      final file = File(kernelVersionFilePath);
      final data = file.readAsStringSync().split(" ");
      return "Kernel: " + data[2];
    } catch (_) {
      return '<Kernel version not found>';
    }
  }

  const VersionInfoPage({super.key});

  static Page<void> page() =>
      const MaterialPage<void>(child: VersionInfoPage());
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CommonTitle(
            title: 'Version Information',
            hasBackButton: true,
            onPressed: () {
              context.flow<AppState>().update((state) => AppState.settings);
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 144),
            child: Column(
              children: [
                //Lottie.asset('animations/hybrid_model_yellow_arrow.json'),
                Lottie.asset(
                  'animations/Logo_JSON.json',
                  fit: BoxFit.cover,
                  repeat: false,
                ),
                const SizedBox(
                  height: 24,
                ),
                Container(
                  height: 140,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        stops: [0.1, 1],
                        colors: <Color>[Colors.black, Colors.black12]),
                  ),
                  child: ListTile(
                    contentPadding: const EdgeInsets.only(top: 50, left: 25),
                    leading: Text(
                      aglVersion(),
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Container(
                  height: 140,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        stops: [0.1, 1],
                        colors: <Color>[Colors.black, Colors.black12]),
                  ),
                  child: ListTile(
                    contentPadding: const EdgeInsets.only(top: 50, left: 25),

                    leading: Text(
                      kernelVersion(),
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 100,
          )
        ],
      ),
      
    );
  }
}
