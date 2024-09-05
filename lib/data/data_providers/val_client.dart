import 'package:flutter_ics_homescreen/export.dart';
import 'package:protos/val_api.dart';

class ValClient {
  final KuksaConfig config;
  final Ref ref;
  late ClientChannel channel;
  late VALClient stub;
  late String authorization;

  ValClient({required this.config, required this.ref}) {
    debugPrint("Connecting to KUKSA.val at ${config.hostname}:${config.port}");
    ChannelCredentials creds;
    if (config.useTls && config.caCertificate.isNotEmpty) {
      print("Using TLS");
      if (config.tlsServerName.isNotEmpty) {
        creds = ChannelCredentials.secure(
            certificates: config.caCertificate,
            authority: config.tlsServerName);
      } else {
        creds = ChannelCredentials.secure(certificates: config.caCertificate);
      }
    } else {
      creds = const ChannelCredentials.insecure();
    }
    channel = ClientChannel(config.hostname,
        port: config.port, options: ChannelOptions(credentials: creds));
    stub = VALClient(channel);
  }

  void run() async {
    List<String> signals = VSSPath().getSignalsList();
    Map<String, String> metadata = {};
    if (config.authorization.isNotEmpty) {
      metadata = {'authorization': "Bearer ${config.authorization}"};
    }

    // Initialize signal states
    for (int i = 0; i < signals.length; i++) {
      get(signals[i]);
    }

    var request = SubscribeRequest();
    for (int i = 0; i < signals.length; i++) {
      var entry = SubscribeEntry();
      entry.path = signals[i];
      entry.fields.add(Field.FIELD_PATH);
      entry.fields.add(Field.FIELD_VALUE);
      request.entries.add(entry);
    }
    try {
      var responseStream =
          stub.subscribe(request, options: CallOptions(metadata: metadata));
      responseStream.listen((value) async {
        for (var update in value.updates) {
          if (!(update.hasEntry() && update.entry.hasPath())) continue;
          handleSignalUpdate(update.entry);
        }
      }, onError: (stacktrace, errorDescriptor) {
        debugPrint(stacktrace.toString());
      });
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  bool handleSignalUpdate(DataEntry entry) {
    if (ref.read(vehicleProvider.notifier).handleSignalUpdate(entry)) {
      return true;
    }
    if (ref.read(audioStateProvider.notifier).handleSignalUpdate(entry)) {
      return true;
    }
    return ref.read(unitStateProvider.notifier).handleSignalUpdate(entry);
  }

  void setUint32(String path, int value, [bool actuator = true]) async {
    var dp = Datapoint()..uint32 = value;
    set(path, dp, actuator);
  }

  void setInt32(String path, int value, [bool actuator = true]) async {
    var dp = Datapoint()..int32 = value;
    set(path, dp, actuator);
  }

  void setBool(String path, bool value, [bool actuator = true]) async {
    var dp = Datapoint()..bool_12 = value;
    set(path, dp, actuator);
  }

  void setString(String path, String value, [bool actuator = true]) async {
    var dp = Datapoint()..string = value;
    set(path, dp, actuator);
  }

  void setFloat(String path, double value, [bool actuator = true]) async {
    var dp = Datapoint()..float = value;
    set(path, dp, actuator);
  }

  void setDouble(String path, double value, [bool actuator = true]) async {
    var dp = Datapoint()..double_18 = value;
    set(path, dp, actuator);
  }

  void set(String path, Datapoint dp, bool actuator) async {
    var entry = DataEntry()..path = path;
    var update = EntryUpdate();
    if (actuator) {
      entry.actuatorTarget = dp;
      update.fields.add(Field.FIELD_ACTUATOR_TARGET);
    } else {
      entry.value = dp;
      update.fields.add(Field.FIELD_VALUE);
    }
    update.entry = entry;
    var request = SetRequest();
    request.updates.add(update);
    Map<String, String> metadata = {};
    if (config.authorization.isNotEmpty) {
      metadata = {'authorization': "Bearer ${config.authorization}"};
    }
    await stub.set(request, options: CallOptions(metadata: metadata));
  }

  void get(String path) async {
    var entry = EntryRequest()..path = path;
    entry.fields.add(Field.FIELD_VALUE);
    var request = GetRequest();
    request.entries.add(entry);
    Map<String, String> metadata = {};
    if (config.authorization.isNotEmpty) {
      metadata = {'authorization': "Bearer ${config.authorization}"};
    }
    debugPrint("Getting $path value");
    var response =
        await stub.get(request, options: CallOptions(metadata: metadata));
    if (response.hasError()) {
      debugPrint("Get request had error {response.error().reason}");
      return;
    }
    for (var entry in response.entries) {
      if (!entry.hasPath()) continue;
      handleSignalUpdate(entry);
    }
  }
}
