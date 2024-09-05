import 'package:flutter_ics_homescreen/export.dart';
import 'package:protos/val_api.dart';

class UnitsNotifier extends Notifier<Units> {
  @override
  Units build() {
    return const Units.initial();
  }

  bool handleSignalUpdate(DataEntry entry) {
    bool handled = true;
    switch (entry.path) {
      case VSSPath.vehicleHmiDistanceUnit:
        if (entry.value.hasString()) {
          String value = entry.value.string;
          DistanceUnit unit = DistanceUnit.kilometers;
          if (value != "KILOMETERS") unit = DistanceUnit.miles;
          state = state.copyWith(distanceUnit: unit);
        }
        break;
      case VSSPath.vehicleHmiTemperatureUnit:
        if (entry.value.hasString()) {
          String value = entry.value.string;
          TemperatureUnit unit = TemperatureUnit.celsius;
          if (value != "C") unit = TemperatureUnit.fahrenheit;
          state = state.copyWith(temperatureUnit: unit);
        }
        break;
      case VSSPath.vehicleHmiPressureUnit:
        if (entry.value.hasString()) {
          String value = entry.value.string;
          PressureUnit unit = PressureUnit.kilopascals;
          if (value != "KPA") unit = PressureUnit.psi;
          state = state.copyWith(pressureUnit: unit);
        }
        break;
      default:
        handled = false;
    }
    return handled;
  }

  void setDistanceUnit(DistanceUnit unit) {
    state = state.copyWith(distanceUnit: unit);
    var valClient = ref.read(valClientProvider);
    valClient.setString(
      VSSPath.vehicleHmiDistanceUnit,
      unit == DistanceUnit.kilometers ? "KILOMETERS" : "MILES",
      true,
    );
  }

  void setTemperatureUnit(TemperatureUnit unit) {
    state = state.copyWith(temperatureUnit: unit);
    var valClient = ref.read(valClientProvider);
    valClient.setString(
      VSSPath.vehicleHmiTemperatureUnit,
      unit == TemperatureUnit.celsius ? "C" : "F",
      true,
    );
  }

  void setPressureUnit(PressureUnit unit) {
    state = state.copyWith(pressureUnit: unit);
    var valClient = ref.read(valClientProvider);
    valClient.setString(
      VSSPath.vehicleHmiPressureUnit,
      unit == PressureUnit.kilopascals ? "KPA" : "PSI",
      true,
    );
  }
}
