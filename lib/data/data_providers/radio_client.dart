import 'package:flutter_ics_homescreen/export.dart';
import 'package:protos/radio_api.dart' as api;

class RadioClient {
  final RadioConfig config;
  final Ref ref;
  late api.ClientChannel channel;
  late api.RadioClient stub;

  RadioClient({required this.config, required this.ref}) {
    debugPrint(
        "Connecting to radio service at ${config.hostname}:${config.port}");
    api.ChannelCredentials creds = const api.ChannelCredentials.insecure();
    channel = api.ClientChannel(config.hostname,
        port: config.port, options: api.ChannelOptions(credentials: creds));
    stub = api.RadioClient(channel);
  }

  void run() async {
    getBandParameters();

    try {
      var responseStream = stub.getStatusEvents(api.StatusRequest());
      await for (var event in responseStream) {
        handleStatusEvent(event);
      }
    } catch (e) {
      print(e);
    }
  }

  void getBandParameters() async {
    try {
      var response = await stub.getBandParameters(
          api.GetBandParametersRequest(band: api.Band.BAND_FM));
      ref.read(radioStateProvider.notifier).updateBandParameters(
          freqMin: response.min,
          freqMax: response.max,
          freqStep: response.step);

      // Get initial frequency
      var freqResponse = await stub.getFrequency(api.GetFrequencyRequest());
      ref
          .read(radioStateProvider.notifier)
          .updateFrequency(freqResponse.frequency);
    } catch (e) {
      print(e);
    }
  }

  void handleStatusEvent(api.StatusResponse response) {
    switch (response.whichStatus()) {
      case api.StatusResponse_Status.frequency:
        var status = response.frequency;
        ref.read(radioStateProvider.notifier).updateFrequency(status.frequency);
        break;
      case api.StatusResponse_Status.play:
        var status = response.play;
        ref.read(radioStateProvider.notifier).updatePlaying(status.playing);
        break;
      case api.StatusResponse_Status.scan:
        var status = response.scan;
        if (status.stationFound) {
          ref.read(radioStateProvider.notifier).updateScanning(false);
        }
        break;
      default:
        break;
    }
  }

  void start() async {
    try {
      await stub.start(api.StartRequest());
    } catch (e) {
      print(e);
    }
  }

  void stop() async {
    try {
      await stub.stop(api.StopRequest());
    } catch (e) {
      print(e);
    }
  }

  void setFrequency(int frequency) async {
    var radioState = ref.read(radioStateProvider);
    if ((frequency < radioState.freqMin) ||
        (frequency > radioState.freqMax) ||
        ((frequency - radioState.freqMin) % radioState.freqStep) != 0) {
      debugPrint("setFrequency: invalid frequency $frequency!");
      return;
    }
    try {
      await stub
          .setFrequency(api.SetFrequencyRequest(frequency: frequency));
    } catch (e) {
      print(e);
    }
  }

  void tuneForward() async {
    var radioState = ref.read(radioStateProvider);
    if (radioState.freqCurrent < radioState.freqMax) {
      int frequency = radioState.freqCurrent + radioState.freqStep;
      if (frequency > radioState.freqMax) {
        frequency = radioState.freqMax;
      }
      try {
        await stub
            .setFrequency(api.SetFrequencyRequest(frequency: frequency));
      } catch (e) {
        print(e);
      }
    }
  }

  void tuneBackward() async {
    var radioState = ref.read(radioStateProvider);
    if (radioState.freqCurrent > radioState.freqMin) {
      int frequency = radioState.freqCurrent - radioState.freqStep;
      if (frequency < radioState.freqMin) {
        frequency = radioState.freqMin;
      }
      try {
        await stub
            .setFrequency(api.SetFrequencyRequest(frequency: frequency));
      } catch (e) {
        print(e);
      }
    }
  }

  void scanForward() async {
    try {
      await stub.scanStart(api.ScanStartRequest(
          direction: api.ScanDirection.SCAN_DIRECTION_FORWARD));
    } catch (e) {
      print(e);
    }
  }

  void scanBackward() async {
    try {
      await stub.scanStart(api.ScanStartRequest(
          direction: api.ScanDirection.SCAN_DIRECTION_BACKWARD));
    } catch (e) {
      print(e);
    }
  }

  void scanStop() async {
    try {
      await stub.scanStop(api.ScanStopRequest());
    } catch (e) {
      print(e);
    }
  }
}
