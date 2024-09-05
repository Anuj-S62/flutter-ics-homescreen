import 'dart:async';
import 'dart:math';

import 'package:flutter_ics_homescreen/export.dart';

class DashBoard extends ConsumerStatefulWidget {
  const DashBoard({super.key});

  @override
  DashBoardState createState() => DashBoardState();
}

class DashBoardState extends ConsumerState<DashBoard>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  static bool _isAnimationPlayed = false;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 1800),
      vsync: this,
      value: _isAnimationPlayed ? 1.0 : 0.0,
    );

    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeIn,
    );

    // Start the animation on first build.
    if (!_isAnimationPlayed) {
      Future.delayed(const Duration(milliseconds: 500), () {
        _animationController.forward();
        _isAnimationPlayed = true;
      });
    }

    bool randomHybridAnimation = ref.read(appConfigProvider).randomHybridAnimation;
    if (randomHybridAnimation) {
      timer = Timer.periodic(const Duration(seconds: 5), (timer) {
        Random random = Random();
        int randomState = random.nextInt(4);
        var hybridState = HybridState.values[randomState];
        ref.read(hybridStateProvider.notifier).setHybridState(hybridState);
      });
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    if (timer != null) {
      timer?.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget svgImage = Align(
      alignment: Alignment.bottomCenter,
      child: SvgPicture.asset(
        'assets/Car Illustration.svg',
        width: 625,
        height: 440,
        fit: BoxFit.fitHeight,
      ),
    );

    Widget fadeContent = FadeTransition(
        opacity: _animation,
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //mainAxisSize: MainAxisSize.max,
              children: [
                RPMProgressIndicator(),
                SpeedProgressIndicator(),
                FuelProgressIndicator(),
              ],
            ),
            HybridModel(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TemperatureWidget(),
                RangeWidget(),
              ],
            ),
            CarStatus(),
          ],
        ));

    return Stack(
      alignment: Alignment.center,
      children: [
        Positioned.fill(
          child: fadeContent,
        ),
        Positioned(
          bottom: 138,
          child: svgImage,
        ),
      ],
    );
  }
}
