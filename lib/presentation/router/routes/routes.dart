import 'package:flutter_ics_homescreen/presentation/screens/settings/settings_screens/date_time/date/date_screen.dart';
import 'package:flutter_ics_homescreen/presentation/screens/settings/settings_screens/date_time/date/select_year.dart';
import 'package:flutter_ics_homescreen/presentation/screens/settings/settings_screens/date_time/time/time_screen.dart';

import '../../../../export.dart';

List<Page<dynamic>> onGenerateAppViewPages(
  AppState state,
  List<Page<dynamic>> pages,
) {
  switch (state) {
    case AppState.home:
      return [DasboardPage.page()];
    case AppState.dashboard:
      return [DasboardPage.page()];
    case AppState.hvac:
      return [HvacPage.page()];
    case AppState.apps:
      return [AppsPage.page()];
    case AppState.media:
      return [MediaPage.page()];
    case AppState.settings:
      return [SettingsPage.page()];
    case AppState.splash:
      return [SplashPage.page()];
    case AppState.dateTime:
      return [DateTimePage.page()];
    case AppState.bluetooth:
      return [BluetoothPage.page()];
    case AppState.wifi:
      return [WifiPage.page()];
    case AppState.wired:
      return [WiredPage.page()];
    case AppState.audioSettings:
      return [AudioSettingsPage.page()];
    case AppState.profiles:
      return [ProfilesPage.page()];
    case AppState.units:
      return [UnitsPage.page()];
    case AppState.versionInfo:
      return [VersionInfoPage.page()];
    case AppState.weather:
      return [WeatherPage.page()];
    case AppState.distanceUnit:
      return [DistanceUnitPage.page()];
    case AppState.tempUnit:
      return [TemperatureUnitPage.page()];
    case AppState.pressureUnit:
      return [PressureUnitPage.page()];
    case AppState.clock:
      return [ClockPage.page()];
    case AppState.newProfile:
      return [NewProfilePage.page()];
    case AppState.date:
      return [DatePage.page()];
    case AppState.time:
      return [TimePage.page()];
    case AppState.year:
      return [SelectYearPage.page()];
  }
}
