import 'package:flutter_ics_homescreen/export.dart';

Future<void> initializeSettings(ProviderContainer container) async {
  await container.read(usersProvider.notifier).loadSettingsUsers();
  await container.read(unitStateProvider.notifier).loadSettingsUnits();
  // Initialize other settings or providers if needed.
}

Future<void> initializeSettingsUser(Ref ref) async {
  await ref.read(unitStateProvider.notifier).loadSettingsUnits();
  // Initialize other settings or providers if needed.
}
