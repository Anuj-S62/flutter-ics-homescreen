import 'package:flutter_ics_homescreen/data/data_providers/datetime_notifier.dart';
import 'package:flutter_ics_homescreen/data/data_providers/hybrid_notifier.dart';
import 'package:flutter_ics_homescreen/data/data_providers/signal_notifier.dart';
import 'package:flutter_ics_homescreen/data/data_providers/units_notifier.dart';
import 'package:flutter_ics_homescreen/data/data_providers/audio_notifier.dart';
import 'package:flutter_ics_homescreen/data/data_providers/users_notifier.dart';
import 'package:flutter_ics_homescreen/data/models/date_time.dart';
import 'package:flutter_ics_homescreen/export.dart';

import '../models/users.dart';
import 'vehicle_notifier.dart';

enum AppState {
  home,
  dashboard,
  hvac,
  apps,
  mediaPlayer,
  settings,
  splash,
  dateTime,
  bluetooth,
  wifi,
  wired,
  audioSettings,
  profiles,
  newProfile,
  units,
  versionInfo,
  weather,
  distanceUnit,
  tempUnit,
  clock,
  date,
  time
}

final appProvider = StateProvider<AppState>((ref) => AppState.splash);
final vehicleProvider = StateNotifierProvider<VehicleNotifier, Vehicle>((ref) {
  return VehicleNotifier(const Vehicle.initial());
});
final signalsProvider = StateNotifierProvider<SignalNotifier, Signals>((ref) {
  return SignalNotifier(const Signals.initial());
});

final unitStateProvider = StateNotifierProvider<UnitsNotifier, Units>((ref) {
  return UnitsNotifier(const Units.initial());
});
final audioStateProvider = StateNotifierProvider<AudioNotifier, Audio>((ref) {
  return AudioNotifier(const Audio.initial());
});

final usersProvider = StateNotifierProvider<UsersNotifier, Users>((ref) {
  return UsersNotifier(Users.initial());
});

final dateTimeStateProvider =
    StateNotifierProvider<DateTimeNotifier, DateAndTime>((ref) {
  return DateTimeNotifier(DateAndTime.initial());
});
final hybridtateProvider = StateNotifierProvider<HybridNotifier, Hybrid>((ref) {
  return HybridNotifier(const Hybrid.initial());
});
