import 'package:flutter_ics_homescreen/export.dart';

class HVAC extends ConsumerStatefulWidget {
  const HVAC({super.key});

  @override
  HVACState createState() => HVACState();
}

class HVACState extends ConsumerState<HVAC> {
  bool isFanFocusLeftTopSelected = false;
  bool isFanFocusRightTopSelected = true;
  bool isFanFocusLeftBottomSelected = true;
  bool isFanFocusRightBottomSelected = false;

  bool isAutoSelected = true;

  @override
  void initState() {
    super.initState();
  }

  TextStyle climateControlTextStyle = GoogleFonts.raleway(
      color: AGLDemoColors.periwinkleColor,
      fontSize: 44,
      height: 1.25,
      fontWeight: FontWeight.w500,
      shadows: [
        Shadow(
            offset: const Offset(1, 2),
            blurRadius: 3,
            color: Colors.black.withOpacity(0.7))
      ]);
  TextStyle climateControlSelectedTextStyle = GoogleFonts.raleway(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 44,
      height: 1.25,
      shadows: [
        Shadow(
            offset: const Offset(1, 2),
            blurRadius: 3,
            color: Colors.black.withOpacity(0.7))
      ]);

  @override
  Widget build(BuildContext context) {
    bool isACSelected = ref.watch(vehicleProvider.select((vehicle) => vehicle.isAirConditioningActive));
    bool isFrontDefrostSelected = ref.watch(vehicleProvider.select((vehicle) => vehicle.isFrontDefrosterActive));
    bool isRearDefrostSelected = ref.watch(vehicleProvider.select((vehicle) => vehicle.isRearDefrosterActive));
    bool isRecirculationSelected = ref.watch(vehicleProvider.select((vehicle) => vehicle.isRecirculationActive));
    bool isSYNCSelected = ref.watch(vehicleProvider.select((vehicle) => vehicle.temperatureSynced));
    Size size = MediaQuery.sizeOf(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(
          height: 83,
        ),
        Row(
          children: [
            SizedBox(
              width: size.width * 0.125,
            ),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Text(
                    "Left",
                    style: TextStyle(color: Colors.white, fontSize: 40),
                    textAlign: TextAlign.center,
                  ),
                ),
                FanFocus(
                    onPressed: () {
                      setState(() {
                        isFanFocusLeftTopSelected = !isFanFocusLeftTopSelected;
                      });
                    },
                    isSelected: isFanFocusLeftTopSelected,
                    focusType: "top_half"),
                const SizedBox(
                  height: 12,
                ),
                FanFocus(
                    onPressed: () {
                      setState(() {
                        isFanFocusLeftBottomSelected =
                            !isFanFocusLeftBottomSelected;
                      });
                    },
                    isSelected: isFanFocusLeftBottomSelected,
                    focusType: "bottom_half")
              ],
            )),
            SizedBox(
              width: size.width * 0.05,
            ),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Text(
                    "Right",
                    style: TextStyle(color: Colors.white, fontSize: 40),
                    textAlign: TextAlign.center,
                  ),
                ),
                FanFocus(
                    onPressed: () {
                      setState(() {
                        isFanFocusRightTopSelected =
                            !isFanFocusRightTopSelected;
                      });
                    },
                    isSelected: isFanFocusRightTopSelected,
                    focusType: "top_half"),
                const SizedBox(
                  height: 12,
                ),
                FanFocus(
                    onPressed: () {
                      setState(() {
                        isFanFocusRightBottomSelected =
                            !isFanFocusRightBottomSelected;
                      });
                    },
                    isSelected: isFanFocusRightBottomSelected,
                    focusType: "bottom_half")
              ],
            )),
            SizedBox(
              width: size.width * 0.1,
            ),
          ],
        ),
        const SizedBox(
          height: 80,
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TemperatureControl(side: Side.left),
            TemperatureControl(side: Side.right)
          ],
        ),
        const SizedBox(
          height: 170,
        ),
        const FanSpeedControls(),
        const SizedBox(
          height: 70,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClimateControls(
                isSelected: isACSelected,
                onPressed: () {
                  ref
                      .read(vehicleProvider.notifier)
                      .setHVACMode(mode: 'airCondition');
                },
                child: Text(
                  "A/C",
                  style: isACSelected
                      ? climateControlSelectedTextStyle
                      : climateControlTextStyle,
                )),
            ClimateControls(
                onPressed: () {
                  if (!isSYNCSelected) {
                    int temperature = ref.read(vehicleProvider.select((vehicle) => vehicle.driverTemperature));
                    ref
                        .read(vehicleProvider.notifier)
                        .setTemperature(side: Side.right, value: temperature);
                  }
                  ref
                      .read(vehicleProvider.notifier)
                      .setTemperatureSynced(!isSYNCSelected);
                },
                isSelected: isSYNCSelected,
                child: Text(
                  "SYNC",
                  style: isSYNCSelected
                      ? climateControlSelectedTextStyle
                      : climateControlTextStyle,
                )),
            ClimateControls(
                onPressed: () {
                  ref
                      .read(vehicleProvider.notifier)
                      .setHVACMode(mode: 'frontDefrost');
                },
                isSelected: isFrontDefrostSelected,
                child: SvgPicture.asset(
                  "assets/${isFrontDefrostSelected ? "FrontDefrostFilled.svg" : "FrontDefrost.svg"}",
                ))
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClimateControls(
                isSelected: isAutoSelected,
                onPressed: () {
                  setState(() {
                    isAutoSelected = !isAutoSelected;
                  });
                },
                child: Text(
                  "AUTO",
                  style: isAutoSelected
                      ? climateControlSelectedTextStyle
                      : climateControlTextStyle,
                )),
            ClimateControls(
                onPressed: () {
                  ref
                      .read(vehicleProvider.notifier)
                      .setHVACMode(mode: 'recirculation');
                },
                isSelected: isRecirculationSelected,
                child: SvgPicture.asset(
                  "assets/${isRecirculationSelected ? "RecirculationFilled.svg" : "Recirculation.svg"}",
                )),
            ClimateControls(
                onPressed: () {
                  ref
                      .read(vehicleProvider.notifier)
                      .setHVACMode(mode: 'rearDefrost');
                },
                isSelected: isRearDefrostSelected,
                child: SvgPicture.asset(
                  "assets/${isRearDefrostSelected ? "BackDefrostFilled.svg" : "BackDefrost.svg"}",
                ))
          ],
        )
      ],
    );
  }
}
