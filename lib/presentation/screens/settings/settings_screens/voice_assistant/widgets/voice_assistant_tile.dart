import 'package:flutter_ics_homescreen/export.dart';

class VoiceAssistantTile extends ConsumerStatefulWidget {
  final IconData icon;
  final String title;
  final bool hasSwitch;
  final VoidCallback voidCallback;
  final bool isSwitchOn;
  const VoiceAssistantTile({super.key, required this.icon, required this.title, required this.hasSwitch, required this.voidCallback,required this.isSwitchOn});

  @override
  ConsumerState<VoiceAssistantTile> createState() => _VoiceAssistantTileState();
}

class _VoiceAssistantTileState extends ConsumerState<VoiceAssistantTile> {
  bool isSwitchOn = true;
  @override
  Widget build(BuildContext context) {
    isSwitchOn = widget.isSwitchOn;
    return Column(
      children: [
        Container(
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
                    widget.hasSwitch
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
                            onChanged: (bool value) {
                              setState(() {
                                isSwitchOn = value;
                              });
                              widget.voidCallback();
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
        const SizedBox(
          height: 14,
        )
      ],
    );
  }
}


