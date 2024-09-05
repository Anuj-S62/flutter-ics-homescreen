import 'package:flutter_ics_homescreen/export.dart';

class SettingsTile extends ConsumerStatefulWidget {
  final IconData icon;
  final String title;
  final bool hasSwich;
  final VoidCallback voidCallback;
  const SettingsTile({
    super.key,
    required this.icon,
    required this.title,
    required this.hasSwich,
    required this.voidCallback,
  });

  @override
  SettingsTileState createState() => SettingsTileState();
}

class SettingsTileState extends ConsumerState<SettingsTile> {
  bool isSwitchOn = true;
  @override
  Widget build(BuildContext context) {
    final signal = ref.watch(signalsProvider.select((signal) => signal));
    if (widget.title == 'Bluetooth') {
      isSwitchOn = signal.isBluetoothConnected;
    } else if (widget.title == 'Wifi') {
      isSwitchOn = signal.isWifiConnected;
    } else {
      // isSwitchOn = false;
    }
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
                // shape: RoundedRectangleBorder(
                //   borderRadius: BorderRadius.circular(12),
                // ),
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
                                    onChanged: (bool value) {
                                      switch (widget.title) {
                                        case 'Bluetooth':
                                          ref
                                              .read(signalsProvider.notifier)
                                              .toggleBluetooth();
                                          break;
                                        case 'Wifi':
                                          ref
                                              .read(signalsProvider.notifier)
                                              .toggleWifi();
                                          break;
                                        default:
                                      }
                                      setState(() {
                                        isSwitchOn = value;
                                      });
                                      // This is called when the user toggles the switch.
                                    },
                                    inactiveTrackColor: Colors.transparent,
                                    activeTrackColor: Colors.transparent,
                                    thumbColor:
                                        WidgetStateProperty.all<Color>(
                                            AGLDemoColors.periwinkleColor)),
                              ),
                            )
                          : const SizedBox(),
                    ],
                  ),
                ),
              )
              // ListTile(
              //   contentPadding:
              //       const EdgeInsets.symmetric(vertical: 41, horizontal: 24),
              //   minLeadingWidth: 55.0,
              //   minVerticalPadding: 0.0,
              //   leading: Icon(
              //     widget.icon,
              //     color: AGLDemoColors.periwinkleColor,
              //     size: 48,
              //   ),
              //   title: Text(
              //     widget.title,
              //     style: const TextStyle(fontSize: 40),
              //   ),
              //   enabled: isSwitchOn,
              //   trailing: widget.hasSwich
              //       ? Container(
              //           width: 126,
              //           height: 80,
              //           decoration: const ShapeDecoration(
              //             color: AGLDemoColors.gradientBackgroundDarkColor,
              //             shape: StadiumBorder(
              //                 side: BorderSide(
              //               color: Color(0xFF5477D4),
              //               //color: Colors.amber,

              //               width: 1.5,
              //             )),
              //           ),
              //           child: Switch(
              //               value: isSwitchOn,
              //               onChanged: (bool value) {
              //                 switch (widget.title) {
              //                   case 'Bluetooth':
              //                     ref
              //                         .read(signalsProvider.notifier)
              //                         .toggleBluetooth();
              //                     break;
              //                   case 'Wifi':
              //                     ref.read(signalsProvider.notifier).toggleWifi();
              //                     break;
              //                   default:
              //                 }
              //                 setState(() {
              //                   isSwitchOn = value;
              //                 });
              //                 // This is called when the user toggles the switch.
              //               },
              //               inactiveTrackColor: Colors.transparent,
              //               activeTrackColor: Colors.transparent,
              //               thumbColor: MaterialStateProperty.all<Color>(
              //                   AGLDemoColors.periwinkleColor)),
              //         )
              //       : const SizedBox(
              //           //Spacer
              //           height: 80,
              //         ),
              //   onTap: widget.voidCallback,

              // ),
              ),
        ),
        const SizedBox(
          height: 8,
        )
      ],
    );
  }
}

// List<SettingsTile> settingsList = [
//   SettingsTile(
//       icon: Icons.calendar_month_outlined,
//       title: 'Date & Time',
//       hasSwich: false,
//       voidCallback: () {}),
//   SettingsTile(
//       icon: Icons.bluetooth,
//       title: 'Bluetooth',
//       hasSwich: true,
//       voidCallback: () {}),
//   SettingsTile(
//     icon: Icons.wifi,
//       title: 'Wifi',
//       hasSwich: true,
//     voidCallback: () {},
//   ),
//   SettingsTile(
//       icon: Icons.settings,
//       title: 'Wired',
//       hasSwich: false,
//       voidCallback: () {}),
//   SettingsTile(
//       icon: Icons.tune,
//       title: 'Audio Settings',
//       hasSwich: false,
//       voidCallback: () {}),
//   SettingsTile(
//       icon: Icons.person_2_outlined,
//       title: 'Profiles',
//       hasSwich: false,
//       voidCallback: () {}),
//   SettingsTile(
//       icon: Icons.straighten,
//       title: 'Units',
//       hasSwich: false,
//       voidCallback: () {}),
//   SettingsTile(
//       icon: Icons.help_sharp,
//       title: 'Veriosn Info',
//       hasSwich: false,
//       voidCallback: () {}),
// ];
