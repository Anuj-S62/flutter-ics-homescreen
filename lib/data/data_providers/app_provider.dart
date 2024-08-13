import 'package:flutter_ics_homescreen/data/data_providers/hybrid_notifier.dart';
import 'package:flutter_ics_homescreen/data/data_providers/signal_notifier.dart';
import 'package:flutter_ics_homescreen/data/data_providers/time_notifier.dart';
import 'package:flutter_ics_homescreen/data/data_providers/units_notifier.dart';
import 'package:flutter_ics_homescreen/data/data_providers/users_notifier.dart';
import 'package:flutter_ics_homescreen/data/data_providers/vehicle_notifier.dart';
import 'package:flutter_ics_homescreen/data/data_providers/audio_notifier.dart';
import 'package:flutter_ics_homescreen/data/data_providers/radio_notifier.dart';
import 'package:flutter_ics_homescreen/data/data_providers/mediaplayer_notifier.dart';
import 'package:flutter_ics_homescreen/data/data_providers/mediaplayer_position_notifier.dart';
import 'package:flutter_ics_homescreen/data/data_providers/playlist_notifier.dart';
import 'package:flutter_ics_homescreen/data/data_providers/playlist_art_notifier.dart';
import 'package:flutter_ics_homescreen/data/data_providers/val_client.dart';
import 'package:flutter_ics_homescreen/data/data_providers/app_launcher.dart';
import 'package:flutter_ics_homescreen/data/data_providers/radio_client.dart';
import 'package:flutter_ics_homescreen/data/data_providers/storage_client.dart';
import 'package:flutter_ics_homescreen/data/data_providers/mpd_client.dart';
import 'package:flutter_ics_homescreen/data/data_providers/play_controller.dart';
import 'package:flutter_ics_homescreen/export.dart';

import 'package:flutter_ics_homescreen/data/models/users.dart';

enum AppState {
  home,
  dashboard,
  hvac,
  apps,
  media,
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
  pressureUnit,
  clock,
  date,
  time,
  year
}

class AppStateNotifier extends Notifier<AppState> {
  AppState previous = AppState.home;

  @override
  AppState build() {
    return AppState.splash;
  }

  void update(AppState newState) {
    previous = state;
    state = newState;
  }

  void back() {
    state = previous;
  }
}

final appProvider =
    NotifierProvider<AppStateNotifier, AppState>(AppStateNotifier.new);

final valClientProvider = Provider((ref) {
  KuksaConfig config = ref.watch(appConfigProvider).kuksaConfig;
  return ValClient(config: config, ref: ref);
});

final appLauncherProvider = Provider((ref) {
  return AppLauncher(ref: ref);
});

final appLauncherListProvider =
    NotifierProvider<AppLauncherList, List<AppLauncherInfo>>(
        AppLauncherList.new);

final radioClientProvider = Provider((ref) {
  RadioConfig config = ref.watch(appConfigProvider).radioConfig;
  return RadioClient(config: config, ref: ref);
});


final storageClientProvider = Provider((ref) {
  StorageConfig config = ref.watch(appConfigProvider).storageConfig;
  return StorageClient(config: config, ref: ref);
});


final mpdClientProvider = Provider((ref) {
  MpdConfig config = ref.watch(appConfigProvider).mpdConfig;
  return MpdClient(config: config, ref: ref);
});

final vehicleProvider =
    NotifierProvider<VehicleNotifier, Vehicle>(VehicleNotifier.new);

final signalsProvider = StateNotifierProvider<SignalNotifier, Signals>((ref) {
  return SignalNotifier(const Signals.initial());
});

final unitStateProvider =
    NotifierProvider<UnitsNotifier, Units>(UnitsNotifier.new);

final audioStateProvider =
    NotifierProvider<AudioStateNotifier, AudioState>(AudioStateNotifier.new);

final radioStateProvider =
    NotifierProvider<RadioStateNotifier, RadioState>(RadioStateNotifier.new);

final mediaPlayerStateProvider =
    NotifierProvider<MediaPlayerStateNotifier, MediaPlayerState>(
        MediaPlayerStateNotifier.new);

final mediaPlayerPositionProvider =
    NotifierProvider<MediaPlayerPositionNotifier, Duration>(
        MediaPlayerPositionNotifier.new);

final playlistProvider =
    NotifierProvider<PlaylistNotifier, List<PlaylistEntry>>(
        PlaylistNotifier.new);

final playlistArtProvider =
    NotifierProvider<PlaylistArtNotifier, Map<int, Uint8List>>(
        PlaylistArtNotifier.new);

final playStateProvider = StateProvider<bool>((ref) {
  final mediaPlayState = ref.watch(
      mediaPlayerStateProvider.select((mediaplayer) => mediaplayer.playState));
  final radioPlaying =
      ref.watch(radioStateProvider.select((radio) => radio.playing));
  return (mediaPlayState == PlayState.playing || radioPlaying);
});

final playControllerProvider = Provider((ref) {
  return PlayController(ref: ref);
});

final usersProvider =
    NotifierProvider<UsersNotifier, Users>(UsersNotifier.new);

final hybridStateProvider =
    StateNotifierProvider<HybridNotifier, Hybrid>((ref) {
  return HybridNotifier(const Hybrid.initial());
});

final currentTimeProvider =
    StateNotifierProvider<CurrentTimeNotifier, DateTime>((ref) {
  return CurrentTimeNotifier();
});
