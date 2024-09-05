import 'package:flutter_ics_homescreen/export.dart';

class CustomBalanceSlider extends ConsumerStatefulWidget {
  const CustomBalanceSlider({
    super.key,
  });

  @override
  CustomBalanceState createState() => CustomBalanceState();
}

class CustomBalanceState extends ConsumerState<CustomBalanceSlider> {
  bool isPressed = false;

  void _increase() {
    setState(() {
      if (_currentVal < 10) {
        _currentVal++;
        ref.read(audioStateProvider.notifier).setBalance(_currentVal);
      }
    });
  }

  void _decrease() {
    setState(() {
      if (_currentVal > 0) {
        _currentVal--;
        ref.read(audioStateProvider.notifier).setBalance(_currentVal);
      }
    });
  }

  double _currentVal = 5;
  @override
  Widget build(BuildContext context) {
    final balanceValue =
        ref.watch(audioStateProvider.select((audio) => audio.balance));
    return Column(
      //crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 8),
          child: Text(
            'Balance',
            style: TextStyle(fontSize: 40),
          ),
        ),
        Container(
          width: 792,
          height: 160,
          decoration: const ShapeDecoration(
            gradient: LinearGradient(
              colors: <Color>[
                AGLDemoColors.neonBlueColor,
                AGLDemoColors.resolutionBlueColor,
                Color.fromARGB(127, 20, 31, 100),
                Color(0xFF2962FF)
              ],
              stops: [0, 0, 1, 1],
            ),
            shape: StadiumBorder(
                side: BorderSide(
              color: Color(0xFF5477D4),
              width: 1,
            )),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 40),
                child: InkWell(
                    onTap: () {
                      _decrease();
                    },
                    child: const Text(
                      'LEFT',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AGLDemoColors.periwinkleColor,
                      ),
                    )),
              ),
              SizedBox(
                width: 584,
                child: SliderTheme(
                  data: SliderThemeData(
                    showValueIndicator: ShowValueIndicator.always,
                    trackShape: CustomRoundedRectSliderTrackShape(
                        sliderVal: balanceValue, isFrontRear: true),
                    activeTickMarkColor: Colors.transparent,
                    inactiveTickMarkColor: Colors.transparent,
                    inactiveTrackColor: AGLDemoColors.backgroundInsetColor,
                    thumbShape: PolygonSliderThumb(
                        sliderValue: 3, thumbRadius: 23, isPressed: isPressed),
                    trackHeight: 16,
                  ),
                  child: Slider(
                    divisions: 10,
                    min: 0,
                    max: 10,
                    value: balanceValue,
                    onChanged: (newValue) {
                      ref
                          .read(audioStateProvider.notifier)
                          .setBalance(newValue);
                      _currentVal = newValue;
                    },
                    onChangeEnd: (value) {
                      setState(() {
                        isPressed = false;
                      });
                    },
                    onChangeStart: (value) {
                      setState(() {
                        isPressed = true;
                      });
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 40),
                child: InkWell(
                    onTap: () {
                      _increase();
                    },
                    child: const Text(
                      'RIGHT',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AGLDemoColors.periwinkleColor,
                      ),
                    )),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class CustomFaderSlider extends ConsumerStatefulWidget {
  const CustomFaderSlider({
    super.key,
  });

  @override
  CustomFaderState createState() => CustomFaderState();
}

class CustomFaderState extends ConsumerState<CustomFaderSlider> {
  bool isPressed = false;

  void _increase() {
    setState(() {
      if (_currentVal < 10) {
        _currentVal++;
        ref.read(audioStateProvider.notifier).setFade(_currentVal);
      }
    });
  }

  void _decrease() {
    setState(() {
      if (_currentVal > 0) {
        _currentVal--;
        ref.read(audioStateProvider.notifier).setFade(_currentVal);
      }
    });
  }

  double _currentVal = 5;
  @override
  Widget build(BuildContext context) {
    final faderValue =
        ref.watch(audioStateProvider.select((audio) => audio.fade));
    return Column(
      //crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 8),
          child: Text(
            'Fade',
            style: TextStyle(fontSize: 40),
          ),
        ),
        Container(
          width: 792,
          height: 160,
          decoration: const ShapeDecoration(
            gradient: LinearGradient(
              colors: <Color>[
                AGLDemoColors.neonBlueColor,
                AGLDemoColors.resolutionBlueColor,
                Color.fromARGB(127, 20, 31, 100),
                Color(0xFF2962FF)
              ],
              stops: [0, 0, 1, 1],
            ),
            shape: StadiumBorder(
                side: BorderSide(
              color: Color(0xFF5477D4),
              width: 1,
            )),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 40),
                child: InkWell(
                    onTap: () {
                      _decrease();
                    },
                    child: const Text(
                      'REAR',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AGLDemoColors.periwinkleColor,
                      ),
                    )),
              ),
              SizedBox(
                width: 584,
                child: SliderTheme(
                  data: SliderThemeData(
                    showValueIndicator: ShowValueIndicator.always,
                    trackShape: CustomRoundedRectSliderTrackShape(
                        sliderVal: faderValue, isFrontRear: true),
                    activeTickMarkColor: Colors.transparent,
                    inactiveTickMarkColor: Colors.transparent,
                    inactiveTrackColor: AGLDemoColors.backgroundInsetColor,
                    thumbShape: PolygonSliderThumb(
                        sliderValue: 3, thumbRadius: 23, isPressed: isPressed),
                    trackHeight: 16,
                  ),
                  child: Slider(
                    divisions: 10,
                    min: 0,
                    max: 10,
                    value: faderValue,
                    onChanged: (newValue) {
                      ref.read(audioStateProvider.notifier).setFade(newValue);
                      _currentVal = newValue;
                    },
                    onChangeEnd: (value) {
                      setState(() {
                        isPressed = false;
                      });
                    },
                    onChangeStart: (value) {
                      setState(() {
                        isPressed = true;
                      });
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 40),
                child: InkWell(
                    onTap: () {
                      _increase();
                    },
                    child: const Text(
                      'FRONT',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AGLDemoColors.periwinkleColor,
                      ),
                    )),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class CustomTrebleSlider extends ConsumerStatefulWidget {
  const CustomTrebleSlider({
    super.key,
  });

  @override
  CustomTrebleSliderState createState() => CustomTrebleSliderState();
}

class CustomTrebleSliderState extends ConsumerState<CustomTrebleSlider> {
  bool isPressed = false;
  void _increase() {
    setState(() {
      if (_currentVal < 10) {
        _currentVal++;
        ref.read(audioStateProvider.notifier).setTreble(_currentVal);
      }
    });
  }

  void _decrease() {
    setState(() {
      if (_currentVal > 0) {
        _currentVal--;
        ref.read(audioStateProvider.notifier).setTreble(_currentVal);
      }
    });
  }

  double _currentVal = 5;
  @override
  Widget build(BuildContext context) {
    final trebleValue =
        ref.watch(audioStateProvider.select((audio) => audio.treble));
    return Column(
      //crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 8),
          child: Text(
            'Treble',
            style: TextStyle(fontSize: 40),
          ),
        ),
        Container(
          width: 792,
          height: 160,
          decoration: const ShapeDecoration(
            gradient: LinearGradient(
              colors: <Color>[
                AGLDemoColors.neonBlueColor,
                AGLDemoColors.resolutionBlueColor,
                Color.fromARGB(127, 20, 31, 100),
                Color(0xFF2962FF)
              ],
              stops: [0, 0, 1, 1],
            ),
            shape: StadiumBorder(
                side: BorderSide(
              color: Color(0xFF5477D4),
              width: 1,
            )),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 40),
                child: InkWell(
                  onTap: () {
                    _decrease();
                  },
                  child: const Icon(
                    Icons.remove,
                    color: AGLDemoColors.periwinkleColor,
                    size: 48,
                  ),
                ),
              ),
              SizedBox(
                width: 584,
                child: SliderTheme(
                  data: SliderThemeData(
                    showValueIndicator: ShowValueIndicator.always,
                    trackShape: CustomRoundedRectSliderTrackShape(
                        sliderVal: trebleValue),
                    activeTickMarkColor: Colors.transparent,
                    inactiveTickMarkColor: Colors.transparent,
                    inactiveTrackColor: AGLDemoColors.backgroundInsetColor,
                    thumbShape: PolygonSliderThumb(
                        sliderValue: 3, thumbRadius: 23, isPressed: isPressed),
                    trackHeight: 16,
                  ),
                  child: Slider(
                    divisions: 10,
                    min: 0,
                    max: 10,
                    value: trebleValue,
                    onChanged: (newValue) {
                      ref.read(audioStateProvider.notifier).setTreble(newValue);
                      _currentVal = newValue;
                    },
                    onChangeEnd: (value) {
                      setState(() {
                        isPressed = false;
                      });
                    },
                    onChangeStart: (value) {
                      setState(() {
                        isPressed = true;
                      });
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  right: 40,
                ),
                child: InkWell(
                    onTap: () {
                      _increase();
                    },
                    child: const Icon(
                      Icons.add,
                      color: AGLDemoColors.periwinkleColor,
                      size: 48,
                    )),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class CustomBassSlider extends ConsumerStatefulWidget {
  const CustomBassSlider({
    super.key,
  });

  @override
  CustomBassSliderState createState() => CustomBassSliderState();
}

class CustomBassSliderState extends ConsumerState<CustomBassSlider> {
  bool isPressed = false;

  void _increase() {
    setState(() {
      if (_currentVal < 10) {
        _currentVal++;
        ref.read(audioStateProvider.notifier).setBass(_currentVal);
      }
    });
  }

  void _decrease() {
    setState(() {
      if (_currentVal > 0) {
        _currentVal--;
        ref.read(audioStateProvider.notifier).setBass(_currentVal);
      }
    });
  }

  double _currentVal = 5;
  @override
  Widget build(BuildContext context) {
    final bassValue =
        ref.watch(audioStateProvider.select((audio) => audio.bass));

    return Column(
      //crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 8),
          child: Text(
            'Bass',
            style: TextStyle(fontSize: 40),
          ),
        ),
        Container(
          width: 792,
          height: 160,
          decoration: const ShapeDecoration(
            gradient: LinearGradient(
              colors: <Color>[
                AGLDemoColors.neonBlueColor,
                AGLDemoColors.resolutionBlueColor,
                Color.fromARGB(127, 20, 31, 100),
                Color(0xFF2962FF)
              ],
              stops: [0, 0, 1, 1],
            ),
            shape: StadiumBorder(
                side: BorderSide(
              color: Color(0xFF5477D4),
              width: 1,
            )),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 40),
                child: InkWell(
                    onTap: () {
                      _decrease();
                    },
                    child: const Icon(
                      Icons.remove,
                      color: AGLDemoColors.periwinkleColor,
                      size: 48,
                    )),
              ),
              SizedBox(
                width: 584,
                child: SliderTheme(
                  data: SliderThemeData(
                    showValueIndicator: ShowValueIndicator.always,
                    trackShape:
                        CustomRoundedRectSliderTrackShape(sliderVal: bassValue),
                    activeTickMarkColor: Colors.transparent,
                    inactiveTickMarkColor: Colors.transparent,
                    inactiveTrackColor: AGLDemoColors.backgroundInsetColor,
                    thumbShape: PolygonSliderThumb(
                        sliderValue: 3, thumbRadius: 23, isPressed: isPressed),
                    trackHeight: 16,
                  ),
                  child: Slider(
                    divisions: 10,
                    min: 0,
                    max: 10,
                    value: bassValue,
                    onChanged: (newValue) {
                      ref.read(audioStateProvider.notifier).setBass(newValue);
                      _currentVal = newValue;
                    },
                    onChangeEnd: (value) {
                      setState(() {
                        isPressed = false;
                      });
                    },
                    onChangeStart: (value) {
                      setState(() {
                        isPressed = true;
                      });
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 40),
                child: InkWell(
                    onTap: () {
                      _increase();
                    },
                    child: const Icon(
                      Icons.add,
                      color: AGLDemoColors.periwinkleColor,
                      size: 48,
                    )),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class PolygonSliderThumb extends SliderComponentShape {
  final double thumbRadius;
  final double sliderValue;
  final bool isPressed;
  const PolygonSliderThumb(
      {required this.thumbRadius,
      required this.sliderValue,
      this.isPressed = false});

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return Size.fromRadius(thumbRadius);
  }

  @override
  void paint(
    PaintingContext context,
    Offset center, {
    required Animation<double> activationAnimation,
    required Animation<double> enableAnimation,
    required bool isDiscrete,
    required TextPainter labelPainter,
    required RenderBox parentBox,
    required SliderThemeData sliderTheme,
    required TextDirection textDirection,
    required double value,
    required double textScaleFactor,
    required Size sizeWithOverflow,
  }) {
    // Define the slider thumb design here
    final Canvas canvas = context.canvas;
    var paintStroke = Paint()
      ..color =
          isPressed ? AGLDemoColors.jordyBlueColor : AGLDemoColors.neonBlueColor
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;
    var paintFill = Paint()
      ..color = isPressed ? Colors.white : AGLDemoColors.periwinkleColor
      ..strokeWidth = 2
      ..style = PaintingStyle.fill
      ..strokeCap = StrokeCap.round;
    var path = Path();
    path.addOval(Rect.fromCircle(
      center: center,
      radius: 9,
    ));
    canvas.drawCircle(center, isPressed ? 37 : 32, paintFill);
    canvas.drawShadow(path, Colors.black26, 0.5, false);
    canvas.drawCircle(center, isPressed ? 21 : 16, paintStroke);
  }
}

//TODO add border to custom track Shape
class CustomRoundedRectSliderTrackShape extends SliderTrackShape
    with BaseSliderTrackShape {
  final double sliderVal;
  final bool? isFrontRear;

  CustomRoundedRectSliderTrackShape({
    required this.sliderVal,
    this.isFrontRear = false,
  });
  @override
  void paint(
    PaintingContext context,
    Offset offset, {
    required RenderBox parentBox,
    required SliderThemeData sliderTheme,
    required Animation<double> enableAnimation,
    required TextDirection textDirection,
    required Offset thumbCenter,
    Offset? secondaryOffset,
    bool isDiscrete = false,
    bool isEnabled = false,
    double additionalActiveTrackHeight = 2,
  }) {
    assert(sliderTheme.disabledActiveTrackColor != null);
    assert(sliderTheme.disabledInactiveTrackColor != null);
    assert(sliderTheme.activeTrackColor != null);
    assert(sliderTheme.inactiveTrackColor != null);
    assert(sliderTheme.thumbShape != null);
    if (sliderTheme.trackHeight == null || sliderTheme.trackHeight! <= 0) {
      return;
    }

    final Rect trackRect = getPreferredRect(
      parentBox: parentBox,
      offset: offset,
      sliderTheme: sliderTheme,
      isEnabled: isEnabled,
      isDiscrete: isDiscrete,
    );
    final Radius trackRadius = Radius.circular(trackRect.height / 2);
    final Radius activeTrackRadius =
        Radius.circular((trackRect.height + additionalActiveTrackHeight) / 2);
    final activeGradientRect = Rect.fromLTRB(
      trackRect.left,
      textDirection == TextDirection.ltr
          ? trackRect.top - (additionalActiveTrackHeight / 2)
          : trackRect.top,
      thumbCenter.dx,
      (textDirection == TextDirection.ltr)
          ? trackRect.bottom + (additionalActiveTrackHeight / 2)
          : trackRect.bottom,
    );

    LinearGradient gradient = const LinearGradient(
        colors: [AGLDemoColors.jordyBlueColor, Colors.white]);
    // Assign the track segment paints, which are leading: active and
    // trailing: inactive.
    final ColorTween activeTrackColorTween = ColorTween(
        begin: sliderTheme.disabledActiveTrackColor,
        end: sliderTheme.activeTrackColor);
    final ColorTween inactiveTrackColorTween = ColorTween(
        begin: sliderTheme.disabledInactiveTrackColor,
        end: sliderTheme.inactiveTrackColor);
    final Paint activePaint = Paint()
      ..shader = gradient.createShader(activeGradientRect)
      ..color = activeTrackColorTween.evaluate(enableAnimation)!;
    final Paint inactivePaint = Paint()
      ..color = inactiveTrackColorTween.evaluate(enableAnimation)!;
    final Paint leftTrackPaint;
    final Paint rightTrackPaint;
    switch (textDirection) {
      case TextDirection.ltr:
        leftTrackPaint = activePaint;
        rightTrackPaint = inactivePaint;
      case TextDirection.rtl:
        leftTrackPaint = inactivePaint;
        rightTrackPaint = activePaint;
    }
    //center divider
    final smallRect =
        Rect.fromLTWH(trackRect.right / 2, trackRect.bottom / 2 + 15, 10, 40);
    context.canvas.drawRRect(
        RRect.fromRectAndCorners(smallRect,
            topLeft: const Radius.circular(25),
            topRight: const Radius.circular(25),
            bottomLeft: const Radius.circular(25),
            bottomRight: const Radius.circular(25)),
        //sliderVal > 5 ? leftTrackPaint : rightTrackPaint);
        isFrontRear!
            ? rightTrackPaint
            : sliderVal > 5
                ? leftTrackPaint
                : rightTrackPaint);
//active
    context.canvas.drawRRect(
      RRect.fromLTRBAndCorners(
        trackRect.left,
        (textDirection == TextDirection.ltr)
            ? trackRect.top - (additionalActiveTrackHeight / 2)
            : trackRect.top,
        thumbCenter.dx,
        (textDirection == TextDirection.ltr)
            ? trackRect.bottom + (additionalActiveTrackHeight / 2)
            : trackRect.bottom,
        topLeft: (textDirection == TextDirection.ltr)
            ? activeTrackRadius
            : trackRadius,
        bottomLeft: (textDirection == TextDirection.ltr)
            ? activeTrackRadius
            : trackRadius,
      ),
      isFrontRear! ? rightTrackPaint : leftTrackPaint,
    );
    //inactive
    context.canvas.drawRRect(
      RRect.fromLTRBAndCorners(
        thumbCenter.dx,
        (textDirection == TextDirection.rtl)
            ? trackRect.top - (additionalActiveTrackHeight / 2)
            : trackRect.top,
        trackRect.right,
        (textDirection == TextDirection.rtl)
            ? trackRect.bottom + (additionalActiveTrackHeight / 2)
            : trackRect.bottom,
        topRight: (textDirection == TextDirection.rtl)
            ? activeTrackRadius
            : trackRadius,
        bottomRight: (textDirection == TextDirection.rtl)
            ? activeTrackRadius
            : trackRadius,
      ),
      rightTrackPaint,
    );
  }
}
