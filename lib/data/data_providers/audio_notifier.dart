import 'package:flutter_ics_homescreen/export.dart';
import 'package:protos/val_api.dart';

class AudioStateNotifier extends Notifier<AudioState> {
  @override
  AudioState build() {
    return const AudioState.initial();
  }

  void resetToDefaults() {
    state = state.copyWith(balance: 5.0, fade: 5.0, treble: 5.0, bass: 5.0);
    var valClient = ref.read(valClientProvider);
    int value = (state.balance * 20).toInt() - 100;
    valClient.setInt32(
      VSSPath.vehicleMediaBalance,
      value,
      true,
    );
    value = (state.fade * 20).toInt() - 100;
    valClient.setInt32(
      VSSPath.vehicleMediaFade,
      value,
      true,
    );
    value = (state.treble * 20).toInt() - 100;
    valClient.setInt32(
      VSSPath.vehicleMediaTreble,
      value,
      true,
    );
    value = (state.bass * 20).toInt() - 100;
    valClient.setInt32(
      VSSPath.vehicleMediaBass,
      value,
      true,
    );
  }

  bool handleSignalUpdate(DataEntry entry) {
    bool handled = true;
    switch (entry.path) {
      case VSSPath.vehicleMediaVolume:
        if (entry.value.hasUint32()) {
          double value = entry.value.uint32.toDouble();
          state = state.copyWith(volume: value);
        }
        break;
      case VSSPath.vehicleMediaBalance:
        if (entry.value.hasInt32()) {
          double value = (entry.value.int32 + 100) / 20.0;
          state = state.copyWith(balance: value);
        }
        break;
      case VSSPath.vehicleMediaFade:
        if (entry.value.hasInt32()) {
          double value = (entry.value.int32 + 100) / 20.0;
          state = state.copyWith(fade: value);
        }
        break;
      case VSSPath.vehicleMediaTreble:
        if (entry.value.hasInt32()) {
          double value = (entry.value.int32 + 100) / 20.0;
          state = state.copyWith(treble: value);
        }
        break;
      case VSSPath.vehicleMediaBass:
        if (entry.value.hasInt32()) {
          double value = (entry.value.int32 + 100) / 20.0;
          state = state.copyWith(bass: value);
        }
        break;
      default:
        handled = false;
    }
    return handled;
  }

  void setVolume(double newValue) {
    state = state.copyWith(volume: newValue);
    var valClient = ref.read(valClientProvider);
    valClient.setUint32(
      VSSPath.vehicleMediaVolume,
      newValue.toInt(),
      true,
    );
  }

  void setBalance(double newValue) {
    state = state.copyWith(balance: newValue);
    int value = (newValue * 20).toInt() - 100;
    var valClient = ref.read(valClientProvider);
    valClient.setInt32(
      VSSPath.vehicleMediaBalance,
      value,
      true,
    );
  }

  void setFade(double newValue) {
    state = state.copyWith(fade: newValue);
    int value = (newValue * 20).toInt() - 100;
    var valClient = ref.read(valClientProvider);
    valClient.setInt32(
      VSSPath.vehicleMediaFade,
      value,
      true,
    );
  }

  void setTreble(double newValue) {
    state = state.copyWith(treble: newValue);
    int value = (newValue * 20).toInt() - 100;
    var valClient = ref.read(valClientProvider);
    valClient.setInt32(
      VSSPath.vehicleMediaTreble,
      value,
      true,
    );
  }

  void setBass(double newValue) {
    state = state.copyWith(bass: newValue);
    int value = (newValue * 20).toInt() - 100;
    var valClient = ref.read(valClientProvider);
    valClient.setInt32(
      VSSPath.vehicleMediaBass,
      value,
      true,
    );
  }
}
