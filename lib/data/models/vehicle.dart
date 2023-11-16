import 'dart:convert';

import '../../export.dart';

@immutable
class Vehicle {
  final double speed;
  final double insideTemperature;
  final double outsideTemperature;
  final int range;
  final int fuelLevel;
  final int mediaVolume;
  final bool isChildLockActiveLeft;
  final bool isChildLockActiveRight;
  final int engineSpeed;
  final int frontLeftTire;
  final int frontRightTire;
  final int rearLeftTire;
  final int rearRightTire;
  final bool isAirConditioningActive;
  final bool isFrontDefrosterActive;
  final bool isRearDefrosterActive;
  final bool isRecirculationActive;
  final int fanSpeed;

  const Vehicle(
      this.speed,
      this.insideTemperature,
      this.outsideTemperature,
      this.range,
      this.fuelLevel,
      this.mediaVolume,
      this.isChildLockActiveLeft,
      this.isChildLockActiveRight,
      this.engineSpeed,
      this.frontLeftTire,
      this.frontRightTire,
      this.rearLeftTire,
      this.rearRightTire,
      this.isAirConditioningActive,
      this.isFrontDefrosterActive,
      this.isRearDefrosterActive,
      this.isRecirculationActive,
      this.fanSpeed);

  const Vehicle.initial()
      : speed = 0,
        insideTemperature = 0,
        outsideTemperature = 0,
        range = 0,
        fuelLevel = 0,
        mediaVolume = 50,
        isChildLockActiveLeft = false,
        isChildLockActiveRight = true,
        engineSpeed = 0,
        frontLeftTire = 33,
        frontRightTire = 31,
        rearLeftTire = 31,
        rearRightTire = 32,
        isAirConditioningActive = false,
        isFrontDefrosterActive = false,
        isRearDefrosterActive = false,
        isRecirculationActive = false,
        fanSpeed = 0;

  const Vehicle.initialForDebug()
      : speed = 60,
        insideTemperature = 25,
        outsideTemperature = 32.0,
        range = 21,
        fuelLevel = 49,
        mediaVolume = 50,
        isChildLockActiveLeft = false,
        isChildLockActiveRight = true,
        engineSpeed = 6500,
        frontLeftTire = 33,
        frontRightTire = 31,
        rearLeftTire = 31,
        rearRightTire = 32,
        isAirConditioningActive = false,
        isFrontDefrosterActive = false,
        isRearDefrosterActive = false,
        isRecirculationActive = false,
        fanSpeed = 0;

  Vehicle copyWith(
      {double? speed,
      double? insideTemperature,
      double? outsideTemperature,
      int? range,
      int? fuelLevel,
      int? mediaVolume,
      bool? isChildLockActiveLeft,
      bool? isChildLockActiveRight,
      int? engineSpeed,
      int? frontLeftTire,
      int? frontRightTire,
      int? rearLeftTire,
      int? rearRightTire,
      bool? isAirConditioningActive,
      bool? isFrontDefrosterActive,
      bool? isRearDefrosterActive,
      bool? isRecirculationActive,
      int? fanSpeed}) {
    return Vehicle(
        speed ?? this.speed,
        insideTemperature ?? this.insideTemperature,
        outsideTemperature ?? this.outsideTemperature,
        range ?? this.range,
        fuelLevel ?? this.fuelLevel,
        mediaVolume ?? this.mediaVolume,
        isChildLockActiveLeft ?? this.isChildLockActiveLeft,
        isChildLockActiveRight ?? this.isChildLockActiveRight,
        engineSpeed ?? this.engineSpeed,
        frontLeftTire ?? this.frontLeftTire,
        frontRightTire ?? this.frontRightTire,
        rearLeftTire ?? this.rearLeftTire,
        rearRightTire ?? this.rearRightTire,
        isAirConditioningActive ?? this.isAirConditioningActive,
        isFrontDefrosterActive ?? this.isFrontDefrosterActive,
        isRearDefrosterActive ?? this.isRearDefrosterActive,
        isRecirculationActive ?? this.isRecirculationActive,
        fanSpeed ?? this.fanSpeed);
  }

  Map<String, dynamic> toMap() {
    return {
      'speed': speed,
      'insideTemperature': insideTemperature,
      'outsideTemperature': outsideTemperature,
      'range': range,
      'fuelLevel': fuelLevel,
      'mediaVolume': mediaVolume,
      'isChildLockActiveLeft': isChildLockActiveLeft,
      'isChildLockActiveRight': isChildLockActiveRight,
      'engineSpeed': engineSpeed,
      'frontLeftTire': frontLeftTire,
      'frontRightTire': frontRightTire,
      'rearLeftTire': rearLeftTire,
      'rearRightTire': rearRightTire,
      'isAirConditioningActive': isAirConditioningActive,
      'isFrontDefrosterActive': isFrontDefrosterActive,
      'isRearDefrosterActive': isRearDefrosterActive,
      'isRecirculationActive': isRecirculationActive,
      'fanSpeed': fanSpeed
    };
  }

  factory Vehicle.fromMap(Map<String, dynamic> map) {
    return Vehicle(
      map['speed']?.toDouble() ?? 0.0,
      map['insideTemperature']?.toDouble() ?? 0.0,
      map['outsideTemperature']?.toDouble() ?? 0.0,
      map['range']?.toInt() ?? 0,
      map['fuelLevel']?.toDouble() ?? 0.0,
      map['mediaVolume']?.toInt() ?? 0,
      map['isChildLockActiveLeft'] ?? false,
      map['isChildLockActiveRight'] ?? false,
      map['engineSpeed']?.toInt() ?? 0,
      map['frontLeftTire']?.toInt() ?? 0,
      map['frontRightTire']?.toInt() ?? 0,
      map['rearLeftTire']?.toInt() ?? 0,
      map['rearRightTire']?.toInt() ?? 0,
      map['isAirConditioningActive'] ?? false,
      map['isFrontDefrosterActive'] ?? false,
      map['isRearDefrosterActive'] ?? false,
      map['isRecirculationActive'] ?? false,
      map['fanSpeed'] ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Vehicle.fromJson(String source) =>
      Vehicle.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Vehicle(speed: $speed, insideTemperature: $insideTemperature, outsideTemperature: $outsideTemperature, range: $range, fuelLevel: $fuelLevel, mediaVolume: $mediaVolume, isChildLockActiveLeft: $isChildLockActiveLeft, isChildLockActiveRight: $isChildLockActiveRight, engineSpeed: $engineSpeed, frontLeftTire: $frontLeftTire, frontRightTire: $frontRightTire, rearLeftTire: $rearLeftTire, rearRightTire: $rearRightTire, isAirConditioningActive: $isAirConditioningActive, isFrontDefrosterActive: $isFrontDefrosterActive, isRearDefrosterActive: $isRearDefrosterActive, isRecirculationActive: $isRecirculationActive,fanSpeed:$fanSpeed)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Vehicle &&
        other.speed == speed &&
        other.insideTemperature == insideTemperature &&
        other.outsideTemperature == outsideTemperature &&
        other.range == range &&
        other.fuelLevel == fuelLevel &&
        other.mediaVolume == mediaVolume &&
        other.isChildLockActiveLeft == isChildLockActiveLeft &&
        other.isChildLockActiveRight == isChildLockActiveRight &&
        other.engineSpeed == engineSpeed &&
        other.frontLeftTire == frontLeftTire &&
        other.frontRightTire == frontRightTire &&
        other.rearLeftTire == rearLeftTire &&
        other.rearRightTire == rearRightTire &&
        other.isAirConditioningActive == isAirConditioningActive &&
        other.isFrontDefrosterActive == isFrontDefrosterActive &&
        other.isRearDefrosterActive == isRearDefrosterActive &&
        other.isRecirculationActive == isRecirculationActive &&
        other.fanSpeed == fanSpeed;
  }

  @override
  int get hashCode {
    return speed.hashCode ^
        insideTemperature.hashCode ^
        outsideTemperature.hashCode ^
        range.hashCode ^
        fuelLevel.hashCode ^
        mediaVolume.hashCode ^
        isChildLockActiveLeft.hashCode ^
        isChildLockActiveRight.hashCode ^
        engineSpeed.hashCode ^
        frontLeftTire.hashCode ^
        frontRightTire.hashCode ^
        rearLeftTire.hashCode ^
        rearRightTire.hashCode ^
        isAirConditioningActive.hashCode ^
        isFrontDefrosterActive.hashCode ^
        isRearDefrosterActive.hashCode ^
        isRecirculationActive.hashCode ^
        fanSpeed.hashCode;
  }
// }
// /  class VehicleNotifier extends StateNotifier<Vehicle> {
// //    VehicleNotifier() : super(Vehicle());

// //  }
}
