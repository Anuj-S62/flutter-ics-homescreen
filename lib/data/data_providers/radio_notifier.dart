import 'package:flutter_ics_homescreen/export.dart';

class RadioStateNotifier extends Notifier<RadioState> {
  @override
  RadioState build() {
    return const RadioState.initial();
  }

  void updateBandParameters(
      {required int freqMin, required freqMax, required freqStep}) {
    state =
        state.copyWith(freqMin: freqMin, freqMax: freqMax, freqStep: freqStep);
  }

  void updateFrequency(int frequency) {
    state = state.copyWith(freqCurrent: frequency);
  }

  void setFrequency(int frequency) {
    state = state.copyWith(freqCurrent: frequency);
    ref.read(radioClientProvider).setFrequency(frequency);
  }

  void updatePlaying(bool playing) {
    state = state.copyWith(playing: playing);
  }

  void updateScanning(bool scanning) {
    state = state.copyWith(scanning: scanning);
  }
}
