import 'package:flutter_ics_homescreen/core/utils/helpers.dart';
import 'package:flutter_ics_homescreen/export.dart';

class UnitsPage extends ConsumerWidget {
  const UnitsPage({super.key});

  static Page<void> page() => const MaterialPage<void>(child: UnitsPage());
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final unit = ref.watch(unitStateProvider.select((unit) => unit));

    return Scaffold(
      //appBar: SettingsTopBar('Units'),

      body: Column(
        children: [
          CommonTitle(
            title: 'Units',
            hasBackButton: true,
            onPressed: () {
              context.flow<AppState>().update((state) => AppState.settings);
            },
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 144),
              child: ListView(
                children: [
                  UnitsTile(
                      icon: Icons.calendar_month_outlined,
                      title: 'Distance',
                      unitName: unit.distanceUnit == DistanceUnit.kilometers
                          ? 'kilometers'
                          : 'miles',
                      hasSwich: false,
                      voidCallback: () async {
                        context
                            .flow<AppState>()
                            .update((next) => AppState.distanceUnit);
                      }),
                  UnitsTile(
                      icon: Icons.straighten,
                      title: 'Temperature',
                      unitName: unit.temperatureUnit == TemperatureUnit.celsius
                          ? 'Celsius'
                          : 'Fahrenheit',
                      hasSwich: true,
                      voidCallback: () {
                        context
                            .flow<AppState>()
                            .update((next) => AppState.tempUnit);
                      }),
                  UnitsTile(
                      icon: Icons.straighten,
                      title: 'Pressure',
                      unitName: unit.pressureUnit == PressureUnit.kilopascals
                          ? 'kilopascals'
                          : 'PSI',
                      hasSwich: true,
                      voidCallback: () {
                        context
                            .flow<AppState>()
                            .update((next) => AppState.pressureUnit);
                      }),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class UnitsTile extends ConsumerStatefulWidget {
  final IconData? icon;
  final String title;
  final String unitName;
  final bool hasSwich;
  final VoidCallback voidCallback;
  final String? image;
  const UnitsTile({
    super.key,
    this.icon,
    required this.title,
    required this.unitName,
    required this.hasSwich,
    required this.voidCallback,
    this.image,
  });

  @override
  UnitsTileState createState() => UnitsTileState();
}

class UnitsTileState extends ConsumerState<UnitsTile> {
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
            leading: widget.icon != null
                ? Icon(
                    widget.icon,
                    color: AGLDemoColors.periwinkleColor,
                    size: 48,
                  )
                : Padding(
                    padding: const EdgeInsets.only(right: 24),
                    child: SvgPicture.asset(
                      widget.image!,
                      width: 48,
                      height: 48,
                    ),
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
                  widget.unitName,
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
