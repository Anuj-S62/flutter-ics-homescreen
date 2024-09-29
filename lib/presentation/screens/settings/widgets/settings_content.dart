import 'package:flutter_ics_homescreen/export.dart';

import '../../../custom_icons/custom_icons.dart';
import '../settings_screens/voice_assistant/widgets/voice_assistant_settings_list_tile.dart';

class Settings extends ConsumerWidget {
  const Settings({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      //crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const CommonTitle(
          title: 'Settings',
        ),
        Expanded(
          child: ListView(
            padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 144),
            children: [
              SettingsTile(
                  icon: Icons.calendar_month_outlined,
                  title: 'Date & Time',
                  hasSwich: false,
                  voidCallback: () async {
                    ref.read(appProvider.notifier).update(AppState.dateTime);
                  }),
              SettingsTile(
                  icon: Icons.bluetooth,
                  title: 'Bluetooth',
                  hasSwich: true,
                  voidCallback: () {
                    ref.read(appProvider.notifier).update(AppState.bluetooth);
                  }),
              SettingsTile(
                  icon: Icons.wifi,
                  title: 'Wifi',
                  hasSwich: true,
                  voidCallback: () {
                    ref.read(appProvider.notifier).update(AppState.wifi);
                  }),
              SettingsTile(
                  icon: CustomIcons.wiredicon,
                  title: 'Wired',
                  hasSwich: false,
                  voidCallback: () {
                    ref.read(appProvider.notifier).update(AppState.wired);
                  }),
              SettingsTile(
                  icon: Icons.tune,
                  title: 'Audio Settings',
                  hasSwich: false,
                  voidCallback: () {
                    ref.read(appProvider.notifier).update(AppState.audioSettings);
                  }),
              VoiceAssistantSettingsTile(
                  icon: Icons.keyboard_voice_outlined,
                  title: "Voice Assistant",
                  hasSwich: true,
                  voidCallback: (){
                    ref.read(appProvider.notifier).update(AppState.voiceAssistant);
                  }
              ),
              SettingsTile(
                  icon: Icons.person_2_outlined,
                  title: 'Profiles',
                  hasSwich: false,
                  voidCallback: () {
                    ref.read(appProvider.notifier).update(AppState.profiles);
                  }),
              SettingsTile(
                  icon: Icons.straighten,
                  title: 'Units',
                  hasSwich: false,
                  voidCallback: () {
                    ref.read(appProvider.notifier).update(AppState.units);
                  }),
              SettingsTile(
                  icon: Icons.help_sharp,
                  title: 'Version Info',
                  hasSwich: false,
                  voidCallback: () {
                    ref.read(appProvider.notifier).update(AppState.versionInfo);
                  }),
            ],
          ),
        ),
      ],
    );
  }
}
