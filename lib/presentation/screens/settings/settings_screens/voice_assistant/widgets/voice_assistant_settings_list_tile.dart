import 'package:flutter_ics_homescreen/export.dart';
import 'package:protos/val_api.dart';

class VoiceAssistantSettingsTile extends ConsumerStatefulWidget {
  final IconData icon;
  final String title;
  final bool hasSwich;
  final VoidCallback voidCallback;
  const VoiceAssistantSettingsTile({
    Key? key,
    required this.icon,
    required this.title,
    required this.hasSwich,
    required this.voidCallback,
  }) : super(key: key);

  @override
  VoiceAssistantSettingsTileState createState() => VoiceAssistantSettingsTileState();
}

class VoiceAssistantSettingsTileState extends ConsumerState<VoiceAssistantSettingsTile> {
  bool isSwitchOn = true;
  @override
  Widget build(BuildContext context) {
    isSwitchOn = ref.watch(voiceAssistantStateProvider.select((voiceAssistant) => voiceAssistant.isVoiceAssistantEnable));
    return Column(
      children: [
        GestureDetector(
          onTap: isSwitchOn ? widget.voidCallback : () {},
          child: Container(
              height: 130,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  stops: isSwitchOn ? [0.3, 1] : [0.8, 1],
                  colors: isSwitchOn
                      ? <Color>[Colors.black, Colors.black12]
                      : <Color>[
                    const Color.fromARGB(50, 0, 0, 0),
                    Colors.transparent
                  ],
                ),
              ),
              child: Card(
                color: Colors.transparent,
                elevation: 5,
                child: Padding(
                  padding:
                  const EdgeInsets.symmetric(vertical: 0, horizontal: 24),
                  child: Row(
                    children: [
                      Icon(
                        widget.icon,
                        color: AGLDemoColors.periwinkleColor,
                        size: 48,
                      ),
                      const SizedBox(width: 24),
                      Expanded(
                        child: Text(
                          widget.title,
                          style: const TextStyle(fontSize: 40),
                        ),
                      ),
                      widget.hasSwich
                          ? Container(
                        width: 126,
                        height: 80,
                        decoration: const ShapeDecoration(
                          color:
                          AGLDemoColors.gradientBackgroundDarkColor,
                          shape: StadiumBorder(
                              side: BorderSide(
                                color: Color(0xFF5477D4),
                                width: 4,
                              )),
                        ),
                        child: FittedBox(
                          fit: BoxFit.fill,
                          child: Switch(
                              value: isSwitchOn,
                              onChanged: (bool value) async {
                                var voiceAgentClient = ref.read(voiceAgentClientProvider);
                                ServiceStatus status = await voiceAgentClient.checkServiceStatus();
                                ref.read(voiceAssistantStateProvider.notifier).toggleVoiceAssistant(status);
                                setState(() {
                                  isSwitchOn = value;
                                });
                                // This is called when the user toggles the switch.
                              },
                              inactiveTrackColor: Colors.transparent,
                              activeTrackColor: Colors.transparent,
                              thumbColor:
                              MaterialStateProperty.all<Color>(
                                  AGLDemoColors.periwinkleColor)),
                        ),
                      )
                          : const SizedBox(),
                    ],
                  ),
                ),
              )
          ),
        ),
        const SizedBox(
          height: 8,
        )
      ],
    );
  }
}
