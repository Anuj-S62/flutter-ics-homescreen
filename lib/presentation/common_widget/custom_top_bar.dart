import 'package:intl/intl.dart';

import '../../export.dart';

class CustomTopBar extends ConsumerStatefulWidget
    implements PreferredSizeWidget {
  const CustomTopBar({super.key});

  @override
  CustomTopBarState createState() => CustomTopBarState();

  @override
  Size get preferredSize => const Size.fromHeight(80);
}

class CustomTopBarState extends ConsumerState<CustomTopBar> {
  @override
  Widget build(BuildContext context) {
    final singnalsConnection =
        ref.watch(signalsProvider.select((sinals) => sinals));
    final user = ref.watch(usersProvider.select((user) => user));
    final time2 =
        ref.watch(dateTimeStateProvider.select((dateTime) => dateTime));

    DateFormat dateFormat = DateFormat('HH:mm');
    //var time = dateFormat.format(DateTime.now());
    var time = time2.time;

    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      //leadingWidth: 100,

      title: Stack(
        //mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Positioned.fill(
            child: Align(
              alignment: Alignment.centerLeft,
              child: Wrap(
                children: [
                  RichText(
                    text: TextSpan(
                      text: '$time ',
                      style: const TextStyle(color: Colors.white, fontSize: 26),
                      children: <InlineSpan>[
                        const WidgetSpan(
                          child: SizedBox(width: 16), // 16px space
                        ),
                        TextSpan(
                          text: user.selectedUser.name,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Image.asset(
              'assets/topBarLogo.png',
              width: 659,
              height: 56,
            ),
          ),
          Positioned.fill(
            child: Align(
              alignment: Alignment.centerRight,
              child: Wrap(
                children: [
                  Icon(
                    singnalsConnection.isBluetoothConnected
                        ? Icons.bluetooth
                        : Icons.bluetooth_disabled,
                    size: 24,
                  ),
                  const SizedBox(
                    width: 24,
                  ),
                  const Icon(
                    Icons.signal_cellular_4_bar_outlined,
                    size: 24,
                  ),
                  const SizedBox(
                    width: 24,
                  ),
                  Icon(
                    singnalsConnection.isWifiConnected
                        ? Icons.wifi
                        : Icons.wifi_off,
                    size: 24,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),

      // ),
    );
  }
}
