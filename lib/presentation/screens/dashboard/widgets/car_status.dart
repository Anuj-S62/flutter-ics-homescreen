// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:gradient_borders/gradient_borders.dart';

import '../../../../export.dart';

class CarStatus extends ConsumerWidget {
  const CarStatus({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 84),
      child: SizedBox(
        height: 440,
        width: 652,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const LeftCarStatus(),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 47.0), // Adding horizontal padding
              child: SvgPicture.asset(
                'assets/Car Illustration.svg',
                width: 625,
                height: 440,
                fit: BoxFit.fitHeight,
              ),
            ),
            const RightCarStatus(),
          ],
        ),
      ),
    );
  }
}

class LeftCarStatus extends ConsumerWidget {
  const LeftCarStatus({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final frontLeftTire =
        ref.watch(vehicleProvider.select((vehicle) => vehicle.frontLeftTire));
    final rearLeftTire =
        ref.watch(vehicleProvider.select((vehicle) => vehicle.rearLeftTire));
    final unit =
        ref.watch(unitStateProvider.select((unit) => unit.pressureUnit));

    String frontLeftTireString = "";
    String rearLeftTireString = "";
    if (unit == PressureUnit.psi) {
      frontLeftTireString = (frontLeftTire * 0.145038).toStringAsFixed(1);
      rearLeftTireString = (rearLeftTire * 0.145038).toStringAsFixed(1);
    } else {
      frontLeftTireString = frontLeftTire.toString();
      rearLeftTireString = rearLeftTire.toString();
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TirePressureProgressIndicator(value: frontLeftTire.toDouble()),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  frontLeftTireString,
                  style: GoogleFonts.brunoAce(
                    textStyle: TextStyle(color: Colors.white, fontSize: 44),
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                TirePressureUnitWidget(),
              ],
            ),
          ],
        ),
        ChildLockLeft(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TirePressureProgressIndicator(value: rearLeftTire.toDouble()),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  rearLeftTireString,
                  style: GoogleFonts.brunoAce(
                    textStyle: TextStyle(color: Colors.white, fontSize: 44),
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                TirePressureUnitWidget(),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

class RightCarStatus extends ConsumerWidget {
  const RightCarStatus({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final frontRightTire =
        ref.watch(vehicleProvider.select((vehicle) => vehicle.frontRightTire));
    final rearRightTire =
        ref.watch(vehicleProvider.select((vehicle) => vehicle.rearRightTire));
    final unit =
        ref.watch(unitStateProvider.select((unit) => unit.pressureUnit));

    String frontRightTireString = "";
    String rearRightTireString = "";
    if (unit == PressureUnit.psi) {
      frontRightTireString = (frontRightTire * 0.145038).toStringAsFixed(1);
      rearRightTireString = (rearRightTire * 0.145038).toStringAsFixed(1);
    } else {
      frontRightTireString = frontRightTire.toString();
      rearRightTireString = rearRightTire.toString();
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TirePressureProgressIndicator(value: frontRightTire.toDouble()),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  frontRightTireString,
                  style: GoogleFonts.brunoAce(
                    textStyle: TextStyle(color: Colors.white, fontSize: 44),
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                TirePressureUnitWidget(),
              ],
            ),
          ],
        ),
        const ChildLockRight(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TirePressureProgressIndicator(value: rearRightTire.toDouble()),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  rearRightTireString,
                  style: GoogleFonts.brunoAce(
                    textStyle: TextStyle(color: Colors.white, fontSize: 44),
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                TirePressureUnitWidget(),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

class TirePressureProgressIndicator extends StatelessWidget {
  final double value;
  const TirePressureProgressIndicator({
    super.key,
    required this.value, // Require the value to be passed
  });

  @override
  Widget build(BuildContext context) {
    // Calculate the width as a percentage of the full width (74 in this case)
    final double fillWidth = (value / 35) * 74;

    return Stack(
      alignment: AlignmentDirectional.centerStart,
      children: [
        Container(
          width: 100,
          height: 24,
          decoration: BoxDecoration(
            border: GradientBoxBorder(
              gradient:
                  LinearGradient(colors: const [Colors.white30, Colors.white]),
            ),
          ),
        ),
        Positioned(
          left: 3,
          child: Container(
            width: fillWidth, // Use the calculated width here
            height: 18, // Match the height of the progress bar
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: const [AGLDemoColors.periwinkleColor, Colors.white],
                stops: [
                  0.8,
                  1,
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class TirePressureUnitWidget extends ConsumerWidget {
  const TirePressureUnitWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final unit =
        ref.watch(unitStateProvider.select((unit) => unit.pressureUnit));

    return Padding(
      padding: const EdgeInsets.only(left: 4.0, right: 1.0, bottom: 2.0),
      child: Text(
        unit == PressureUnit.kilopascals ? 'kPa' : 'PSI',
        style: TextStyle(
          fontSize: 26,
        ),
      ),
    );
  }
}
