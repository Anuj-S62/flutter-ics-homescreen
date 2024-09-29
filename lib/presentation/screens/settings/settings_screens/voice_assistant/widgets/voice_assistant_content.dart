import 'package:flutter_ics_homescreen/export.dart';

import 'package:flutter_ics_homescreen/export.dart';
import 'package:flutter_ics_homescreen/presentation/screens/settings/settings_screens/voice_assistant/widgets/voice_assistant_tile.dart';

import '../../../../../../core/utils/helpers.dart';
import '../../../../../../data/models/voice_assistant_state.dart';

@immutable
class VoiceAssistantContent extends ConsumerWidget {
  VoiceAssistantContent({Key? key}) : super(key: key);
  bool isWakeWordMode = false;
  bool isVoiceAssistantOverlay = false;
  bool isOnlineMode = false;
  SttModel sttModel = SttModel.whisper;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    isWakeWordMode =
        ref.watch(voiceAssistantStateProvider.select((value) => value.isWakeWordMode));
    isVoiceAssistantOverlay =
        ref.watch(voiceAssistantStateProvider.select((value) => value.voiceAssistantOverlay));
    isOnlineMode =
        ref.watch(voiceAssistantStateProvider.select((value) => value.isOnlineMode));
    sttModel =
        ref.watch(voiceAssistantStateProvider.select((value) => value.sttModel));

    final wakeWordCallback = () {
      bool status = ref.read(voiceAssistantStateProvider.notifier).toggleWakeWordMode();
      if(status){
        var voiceAgentClient = ref.read(voiceAgentClientProvider);
        voiceAgentClient.startWakeWordDetection();
      }
    };

    final voiceAssistantOverlayCallback = () {
      ref.read(voiceAssistantStateProvider.notifier).toggleVoiceAssistantOverlay();
    };

    final onlineModeCallback = () {
      ref.read(voiceAssistantStateProvider.notifier).toggleOnlineMode();
    };


    return Column(
      children: [
        Expanded(
          child: ListView(
            padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 144),
            children: [
              VoiceAssistantTile(
                  icon: Icons.insert_comment_outlined,
                  title: "Voice Assistant Overlay",
                  hasSwitch: true,
                  voidCallback: voiceAssistantOverlayCallback,
                  isSwitchOn: isVoiceAssistantOverlay
              ),
              if(ref.watch(voiceAssistantStateProvider.select((value) => value.isOnlineModeAvailable)))
              VoiceAssistantTile(
                  icon: Icons.cloud_circle,
                  title: "Online Mode",
                  hasSwitch: true,
                  voidCallback: onlineModeCallback,
                  isSwitchOn: isOnlineMode
              ),
              VoiceAssistantTile(
                  icon: Icons.mic_none_outlined,
                  title: "Wake Word Mode",
                  hasSwitch: true,
                  voidCallback: wakeWordCallback,
                  isSwitchOn: isWakeWordMode
              ),
              if(ref.watch(voiceAssistantStateProvider.select((value) => value.isWakeWordMode)))
              WakeWordTile(),
              SttTile(
                  title: " Speech To Text",
                  sttName: sttModel==SttModel.whisper ? "Whisper AI" : "Vosk",
                  hasSwich: true,
                  voidCallback: () async {
                    context
                        .flow<AppState>()
                        .update((next) => AppState.sttModel);
                  }),
            ],
          )
        ),
      ],
    );
  }
}

class SttTile extends ConsumerStatefulWidget {
  final IconData? icon;
  final String title;
  final String sttName;
  final bool hasSwich;
  final VoidCallback voidCallback;
  final String? image;
  const SttTile({
    Key? key,
    this.icon,
    required this.title,
    required this.sttName,
    required this.hasSwich,
    required this.voidCallback,
    this.image,
  }) : super(key: key);

  @override
  SttTileState createState() => SttTileState();
}

class SttTileState extends ConsumerState<SttTile> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 8),
          padding: const EdgeInsets.symmetric(vertical: 15),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                stops: [0.3, 1],
                colors: <Color>[Colors.black, Colors.black12]),
          ),
          //color: Color(0xFF0D113F),
          child: ListTile(
            contentPadding:
            const EdgeInsets.symmetric(vertical: 17, horizontal: 24),
            leading: Icon(
              Icons.transcribe_outlined,
              color: AGLDemoColors.periwinkleColor,
              size: 48,
            ),
            title: Text(
              widget.title,
              style: TextStyle(
                  color: AGLDemoColors.periwinkleColor,
                  shadows: [
                    Helpers.dropShadowRegular,
                  ],
                  fontSize: 40),
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  widget.sttName,
                  style: TextStyle(
                    color: AGLDemoColors.periwinkleColor,
                    shadows: [
                      Helpers.dropShadowRegular,
                    ],
                    fontSize: 40,
                  ),
                ),
                const SizedBox(
                  width: 24,
                ),
                const Icon(
                  Icons.arrow_forward_ios,
                  color: AGLDemoColors.periwinkleColor,
                  size: 48,
                ),
              ],
            ),
            onTap: widget.voidCallback,
          ),
        ),
        const SizedBox(
          height: 8,
        )
      ],
    );
  }
}



class WakeWordTile extends ConsumerStatefulWidget {
  const WakeWordTile({Key? key}) : super(key: key);

  @override
  WakeWordTileState createState() => WakeWordTileState();
}

class WakeWordTileState extends ConsumerState<WakeWordTile> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 8),
          padding: const EdgeInsets.symmetric(vertical: 15),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                stops: [0.3, 1],
                colors: <Color>[Colors.black, Colors.black12]),
          ),
          //color: Color(0xFF0D113F),
          child: ListTile(
            contentPadding:
            const EdgeInsets.symmetric(vertical: 17, horizontal: 24),
            leading: Icon(
              Icons.mic_none_outlined,
              color: AGLDemoColors.periwinkleColor,
              size: 48,
            ),
            title: Text(
              "Wake Word",
              style: TextStyle(
                  color: AGLDemoColors.periwinkleColor,
                  shadows: [
                    Helpers.dropShadowRegular,
                  ],
                  fontSize: 40),
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  ref.watch(voiceAssistantStateProvider.select((value) => value.wakeWord)) ?? "Not Set",
                  style: TextStyle(
                    color: AGLDemoColors.periwinkleColor,
                    shadows: [
                      Helpers.dropShadowRegular,
                    ],
                    fontSize: 40,
                  ),
                ),
                const SizedBox(
                  width: 50,
                ),

              ],
            ),
          ),
        ),
        const SizedBox(
          height: 8,
        )
      ],
    );
  }
}
