import 'package:flutter_ics_homescreen/core/utils/helpers.dart';
import 'package:flutter_ics_homescreen/export.dart';

class GradientProgressIndicator extends StatelessWidget {
  ///it can be anything between 0 to 100
  final int percent;
  final Gradient gradient;
  final Color backgroundColor;
  final double height;
  final String type;

  const GradientProgressIndicator(
      {required this.percent,
      required this.gradient,
      required this.backgroundColor,
      super.key,
      this.height = 16,
      required this.type});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          flex: percent,
          fit: FlexFit.tight,
          child: Container(
            height: height,
            margin: const EdgeInsets.all(1),
            decoration: BoxDecoration(
              border: Border.all(
                  color: AGLDemoColors.neonBlueColor.withOpacity(0.5),
                  width: 1),
              gradient: gradient,
              borderRadius:
                  BorderRadius.all(Radius.circular(type == "fm" ? 16 : 2)),
            ),
            alignment: Alignment.centerRight,
          ),
        ),
        type == "media"
            ? Container(
                height: height,
                width: 2,
                color: Colors.white,
              )
            : Container(
                height: 64,
                width: 64,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      Helpers.boxDropShadowRegular,
                    ],
                    color: AGLDemoColors.periwinkleColor),
                child: Container(
                  height: 32,
                  width: 32,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        Helpers.boxDropShadowRegular,
                      ],
                      border: Border.all(
                          color: AGLDemoColors.neonBlueColor, width: 2),
                      color: AGLDemoColors.periwinkleColor),
                ),
              ),
        Flexible(
          fit: FlexFit.tight,
          flex: 100 - percent,
          child: Container(
            decoration: BoxDecoration(
              color: backgroundColor,
              border: Border.all(
                  color: AGLDemoColors.neonBlueColor.withOpacity(0.5),
                  width: 1),
              borderRadius: const BorderRadius.all(Radius.circular(2)),
            ),
            child: SizedBox(height: height),
          ),
        ),
      ],
    );
  }
}
