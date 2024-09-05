import 'package:flutter_ics_homescreen/export.dart';

// Simple fixed pattern homescreen for AGL CI screenshot testing

class HomeScreenCI extends StatelessWidget {
  const HomeScreenCI({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Note that the colors are specified with hex in order to match
        // Qt's red/blue/green constants, which are different than Flutter's.
        Container(width: 1080, height: 216, color: const Color(0xFF0000FF)),
        Container(width: 1080, height: 1488, color: const Color(0xFFFF0000)),
        Container(width: 1080, height: 216, color: const Color(0xFF008000))
      ],
    );
  }
}
