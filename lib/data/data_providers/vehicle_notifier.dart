// ignore_for_file: unused_local_variable

import 'dart:async';

import 'package:flutter_ics_homescreen/export.dart';
import 'package:protos/val_api.dart';

class VehicleNotifier extends Notifier<Vehicle> {
  @override
  Vehicle build() {
    return const Vehicle.initial();
  }

  void updateSpeed(double newValue) {
    state = state.copyWith(speed: newValue);
  }

  bool handleSignalUpdate(DataEntry entry) {
    bool handled = true;
    switch (entry.path) {
      case VSSPath.vehicleSpeed:
        if (entry.value.hasFloat()) {
          state = state.copyWith(speed: entry.value.float);
        }
        break;
      case VSSPath.vehicleInsideTemperature:
        if (entry.value.hasFloat()) {
          state = state.copyWith(insideTemperature: entry.value.float);
        }
        break;
      case VSSPath.vehicleOutsideTemperature:
        if (entry.value.hasFloat()) {
          state = state.copyWith(outsideTemperature: entry.value.float);
        }
        break;
      case VSSPath.vehicleRange:
        if (entry.value.hasUint32()) {
          state = state.copyWith(range: entry.value.uint32);
        }
        break;
      case VSSPath.vehicleFuelLevel:
        if (entry.value.hasUint32()) {
          state = state.copyWith(fuelLevel: entry.value.uint32);
        }
        break;
      case VSSPath.vehicleIsChildLockActiveLeft:
        if (entry.value.hasBool_12()) {
          state = state.copyWith(isChildLockActiveLeft: entry.value.bool_12);
        }
        break;
      case VSSPath.vehicleIsChildLockActiveRight:
        if (entry.value.hasBool_12()) {
          state = state.copyWith(isChildLockActiveRight: entry.value.bool_12);
        }
        break;
      case VSSPath.vehicleEngineSpeed:
        if (entry.value.hasUint32()) {
          state = state.copyWith(engineSpeed: entry.value.uint32);
        }
        break;
      case VSSPath.vehicleFrontLeftTire:
        if (entry.value.hasUint32()) {
          state = state.copyWith(frontLeftTire: entry.value.uint32);
        }
        break;
      case VSSPath.vehicleFrontRightTire:
        if (entry.value.hasUint32()) {
          state = state.copyWith(frontRightTire: entry.value.uint32);
        }
        break;
      case VSSPath.vehicleRearLeftTire:
        if (entry.value.hasUint32()) {
          state = state.copyWith(rearLeftTire: entry.value.uint32);
        }
        break;
      case VSSPath.vehicleRearRightTire:
        if (entry.value.hasUint32()) {
          state = state.copyWith(rearRightTire: entry.value.uint32);
        }
        break;
      case VSSPath.vehicleIsAirConditioningActive:
        if (entry.value.hasBool_12()) {
          state = state.copyWith(isAirConditioningActive: entry.value.bool_12);
        }
        break;
      case VSSPath.vehicleIsFrontDefrosterActive:
        if (entry.value.hasBool_12()) {
          state = state.copyWith(isFrontDefrosterActive: entry.value.bool_12);
        }
        break;
      case VSSPath.vehicleIsRearDefrosterActive:
        if (entry.value.hasBool_12()) {
          state = state.copyWith(isRearDefrosterActive: entry.value.bool_12);
        }
        break;
      case VSSPath.vehicleIsRecirculationActive:
        if (entry.value.hasBool_12()) {
          state = state.copyWith(isRecirculationActive: entry.value.bool_12);
        }
        break;
      case VSSPath.vehicleFanSpeed:
        if (entry.value.hasUint32()) {
          // Convert 0-100 to local 0-3 setting
          var value = entry.value.uint32;
          var fanSpeed = 0;
          if (value > 66) {
            fanSpeed = 3;
          }
          else if (value > 33) {
            fanSpeed = 2;
          }
          else if (value > 0) { fanSpeed = 1; }
          state = state.copyWith(fanSpeed: fanSpeed);
        }
        break;
      case VSSPath.vehicleDriverTemperature:
        if (entry.value.hasInt32()) {
          state = state.copyWith(driverTemperature: entry.value.int32);
        }
        break;
      case VSSPath.vehiclePassengerTemperature:
        if (entry.value.hasInt32()) {
          state = state.copyWith(passengerTemperature: entry.value.int32);
        }
        break;
      default:
        handled = false;
    }
    return handled;
  }

  void setChildLock({required String side}) async {
    var valClient = ref.read(valClientProvider);
    try {
      switch (side) {
        case 'left':
          valClient.setBool(
            VSSPath.vehicleIsChildLockActiveLeft,
            !state.isChildLockActiveLeft,
            false,
          );
          state = state.copyWith(
              isChildLockActiveLeft: !state.isChildLockActiveLeft);
          break;
        case 'right':
          valClient.setBool(
            VSSPath.vehicleIsChildLockActiveRight,
            !state.isChildLockActiveRight,
            false,
          );
          state = state.copyWith(
              isChildLockActiveRight: !state.isChildLockActiveRight);
          break;
        default:
          debugPrint("ERROR: Unexpected side value ${side}");
          break;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void setTemperature({required Side side, required int value}) {
    var valClient = ref.read(valClientProvider);
    try {
      switch (side) {
        case Side.left:
          valClient.setInt32(
            VSSPath.vehicleDriverTemperature,
            value,
            true,
          );
          state = state.copyWith(driverTemperature: value);
          break;
        case Side.right:
          valClient.setInt32(
            VSSPath.vehiclePassengerTemperature,
            value,
            true,
          );
          state = state.copyWith(passengerTemperature: value);
          break;
        default:
          debugPrint("ERROR: Unexpected side value ${side}");
          break;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void setTemperatureSynced(bool newValue) {
    state = state.copyWith(temperatureSynced: newValue);
  }

  void updateFanSpeed(int newValue) {
    // Convert local 0-3 setting to the 0-100 the VSS signal expects
    var targetFanSpeed = 0;
    switch (newValue) {
      case 1:
        targetFanSpeed = 33;
        break;
      case 2:
        targetFanSpeed = 66;
        break;
      case 3:
        targetFanSpeed = 100;
      case 0:
      default:
        break;
    }
    var valClient = ref.read(valClientProvider);
    valClient.setUint32(
      VSSPath.vehicleFanSpeed,
      targetFanSpeed,
      true,
    );
    state = state.copyWith(fanSpeed: newValue);
  }

  void setHVACMode({required String mode}) {
    var valClient = ref.read(valClientProvider);
    try {
      switch (mode) {
        case 'airCondition':
          valClient.setBool(
            VSSPath.vehicleIsAirConditioningActive,
            !state.isAirConditioningActive,
            true,
          );
          state = state.copyWith(
              isAirConditioningActive: !state.isAirConditioningActive);
          break;
        case 'frontDefrost':
          valClient.setBool(
            VSSPath.vehicleIsFrontDefrosterActive,
            !state.isFrontDefrosterActive,
            true,
          );
          state = state.copyWith(
              isFrontDefrosterActive: !state.isFrontDefrosterActive);
          break;
        case 'rearDefrost':
          valClient.setBool(
            VSSPath.vehicleIsRearDefrosterActive,
            !state.isRearDefrosterActive,
            true,
          );
          state = state.copyWith(
              isRearDefrosterActive: !state.isRearDefrosterActive);
          break;
        case 'recirculation':
          valClient.setBool(
            VSSPath.vehicleIsRecirculationActive,
            !state.isRecirculationActive,
            true,
          );
          state = state.copyWith(
              isRecirculationActive: !state.isRecirculationActive);
          break;
        default:
          debugPrint("ERROR: Unexpected mode value ${mode}");
          break;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void setInitialState() {
    var speed = state.speed;
    var rpm = state.engineSpeed;
    var fuelLevel = state.fuelLevel;
    var insideTemp = state.insideTemperature;
    var outsideTemp = state.outsideTemperature;
    var range = state.range;
    var psi = state.frontLeftTire;
    var actualSpeed = 0.0;
    var actualRpm = 0;
    var actualFuelLevel = 0.0;
    var actualInsideTemp = 0.0;
    var actualOutsideTemp = 0.0;
    var actualRange = 0;
    var actualPsi = 0;

    state = const Vehicle.initial();
    Timer speedTimer =
        Timer.periodic(const Duration(milliseconds: 600), (timer) {
      actualSpeed = actualSpeed + 10;

      if (actualSpeed > speed) {
        actualSpeed = speed;

        timer.cancel();
      }
      state = state.copyWith(speed: actualSpeed);
    });
    Timer rpmTimer = Timer.periodic(const Duration(milliseconds: 400), (timer) {
      actualRpm = actualRpm + 150;

      if (actualRpm > rpm) {
        actualRpm = rpm;
        timer.cancel();
      }
      state = state.copyWith(engineSpeed: actualRpm);
    });
    Timer fuelLevelTimer =
        Timer.periodic(const Duration(milliseconds: 400), (timer) {
      actualFuelLevel = actualFuelLevel + 1;

      if (actualFuelLevel > fuelLevel) {
        actualFuelLevel = fuelLevel.toDouble();

        timer.cancel();
      }
      state = state.copyWith(fuelLevel: actualFuelLevel.toInt());
    });
    Timer outsideTemperatureTimer =
        Timer.periodic(const Duration(milliseconds: 300), (timer) {
      actualOutsideTemp = actualOutsideTemp + 0.5;

      if (actualOutsideTemp > outsideTemp) {
        actualOutsideTemp = outsideTemp;

        timer.cancel();
      }
      state = state.copyWith(outsideTemperature: actualOutsideTemp);
    });
    Timer insideTemperatureTimer =
        Timer.periodic(const Duration(milliseconds: 300), (timer) {
      actualInsideTemp = actualInsideTemp + 0.5;

      if (actualInsideTemp > insideTemp) {
        actualInsideTemp = insideTemp;

        timer.cancel();
      }
      state = state.copyWith(insideTemperature: actualInsideTemp);
    });
    Timer rangeTimer =
        Timer.periodic(const Duration(milliseconds: 300), (timer) {
      actualRange = actualRange + 5;

      if (actualRange > range) {
        actualRange = range;

        timer.cancel();
      }
      state = state.copyWith(range: actualRange);
    });
    Timer psiTimer =
        Timer.periodic(const Duration(milliseconds: 1200), (timer) {
      actualPsi = actualPsi + 5;

      if (actualPsi > psi) {
        actualPsi = psi;

        timer.cancel();
      }
      state = state.copyWith(
        frontLeftTire: actualPsi,
        rearLeftTire: actualPsi,
        frontRightTire: actualPsi,
        rearRightTire: actualPsi,
      );
    });
  }
}
