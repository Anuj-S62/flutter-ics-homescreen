import 'package:flutter_ics_homescreen/export.dart';
import 'package:protos/val_api.dart';

import 'package:protos/storage-api.dart' as storage_api;
import 'initialize_settings.dart';

class UnitsNotifier extends Notifier<Units> {
  @override
  Units build() {
    return const Units.initial();
  }

  // Load Units state of the selected user from the storage API.
  Future<void> loadSettingsUnits() async {
    final storageClient = ref.read(storageClientProvider);
    final userClient = ref.read(usersProvider);

    try {
      // Read unit values from the selected user namespace.
      final distanceResponse = await storageClient.read(storage_api.Key(
          key: VSSPath.vehicleHmiDistanceUnit,
          namespace: userClient.selectedUser.id));
      final temperatureResponse = await storageClient.read(storage_api.Key(
          key: VSSPath.vehicleHmiTemperatureUnit,
          namespace: userClient.selectedUser.id));
      final pressureResponse = await storageClient.read(storage_api.Key(
          key: VSSPath.vehicleHmiPressureUnit,
          namespace: userClient.selectedUser.id));

      // Prepare state declaration and fall back to default values if the key is not present in the storage API.
      final distanceUnit = distanceResponse.result == 'MILES'
          ? DistanceUnit.miles
          : DistanceUnit.kilometers;

      final temperatureUnit = temperatureResponse.result == 'F'
          ? TemperatureUnit.fahrenheit
          : TemperatureUnit.celsius;

      final pressureUnit = pressureResponse.result == 'PSI'
          ? PressureUnit.psi
          : PressureUnit.kilopascals;

      state = Units(distanceUnit, temperatureUnit, pressureUnit);
    } catch (e) {
      // Fallback to initial defaults if error occurs.
      debugPrint('Error loading settings for units: $e');
      state = const Units.initial();
    }
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

  Future<void> setDistanceUnit(DistanceUnit unit) async {
    state = state.copyWith(distanceUnit: unit);

    var valClient = ref.read(valClientProvider);
    valClient.setDistanceUnit(unit);

    // Write to storage API (to selected user namespace).
    var storageClient = ref.read(storageClientProvider);
    final userClient = ref.read(usersProvider);
    try {
      await storageClient.write(storage_api.KeyValue(
          key: VSSPath.vehicleHmiDistanceUnit,
          value: unit == DistanceUnit.kilometers ? 'KILOMETERS' : 'MILES',
          namespace: userClient.selectedUser.id));
    } catch (e) {
      debugPrint('Error saving distance unit: $e');
    }
  }

  Future<void> setTemperatureUnit(TemperatureUnit unit) async {
    state = state.copyWith(temperatureUnit: unit);

    var valClient = ref.read(valClientProvider);
    valClient.setTemperatureUnit(unit);

    // Write to storage API (to selected user namespace).
    var storageClient = ref.read(storageClientProvider);
    final userClient = ref.read(usersProvider);
    try {
      await storageClient.write(storage_api.KeyValue(
          key: VSSPath.vehicleHmiTemperatureUnit,
          value: unit == TemperatureUnit.celsius ? "C" : "F",
          namespace: userClient.selectedUser.id));
    } catch (e) {
      debugPrint('Error saving distance unit: $e');
    }
  }

  Future<void> setPressureUnit(PressureUnit unit) async {
    state = state.copyWith(pressureUnit: unit);

    var valClient = ref.read(valClientProvider);
    valClient.setPressureUnit(unit);

    // Write to storage API (to selected user namespace).
    var storageClient = ref.read(storageClientProvider);
    final userClient = ref.read(usersProvider);
    try {
      await storageClient.write(storage_api.KeyValue(
          key: VSSPath.vehicleHmiPressureUnit,
          value: unit == PressureUnit.kilopascals ? "KPA" : "PSI",
          namespace: userClient.selectedUser.id));
    } catch (e) {
      debugPrint('Error saving pressure unit: $e');
    }
  }
}
