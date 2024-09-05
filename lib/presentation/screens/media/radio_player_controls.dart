import 'package:flutter_ics_homescreen/core/utils/helpers.dart';
import 'package:flutter_ics_homescreen/export.dart';
import 'package:flutter_ics_homescreen/presentation/screens/settings/settings_screens/audio_settings/widget/slider_widgets.dart';

class RadioPlayerControls extends ConsumerWidget {
  const RadioPlayerControls({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var freqCurrent =
        ref.watch(radioStateProvider.select((radio) => radio.freqCurrent));
    String currentString = (freqCurrent / 1000000.0).toStringAsFixed(1);
    var freqMin =
        ref.watch(radioStateProvider.select((radio) => radio.freqMin));
    String freqMinString = (freqMin / 1000000.0).toStringAsFixed(1);
    var freqMax =
        ref.watch(radioStateProvider.select((radio) => radio.freqMax));
    String freqMaxString = (freqMax / 1000000.0).toStringAsFixed(1);

    return Material(
      color: Colors.transparent,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            currentString,
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w400,
                shadows: [Helpers.dropShadowRegular],
                fontSize: 44),
          ),
          const RadioPlayerControlsActions(),
          Column(children: [
            const RadioPlayerControlsSlider(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    freqMinString,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 26,
                        shadows: [Helpers.dropShadowRegular]),
                  ),
                  Text(
                    freqMaxString,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 26,
                        shadows: [Helpers.dropShadowRegular]),
                  )
                ],
              ),
            ),
          ]),
        ],
      ),
    );
  }
}

class RadioPlayerControlsActions extends ConsumerWidget {
  const RadioPlayerControlsActions({super.key});

  onPressed({required WidgetRef ref, required String type}) {
    if (type == "tuneLeft") {
      ref.read(radioClientProvider).tuneBackward();
    } else if (type == "tuneRight") {
      ref.read(radioClientProvider).tuneForward();
    } else if (type == "scanLeft") {
      bool playing =
          ref.read(radioStateProvider.select((radio) => radio.playing));
      if (playing) {
        ref.read(radioClientProvider).scanBackward();
      }
    } else if (type == "scanRight") {
      bool playing =
          ref.read(radioStateProvider.select((radio) => radio.playing));
      if (playing) {
        ref.read(radioClientProvider).scanForward();
      }
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text(
                "Tune",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 40,
                    shadows: [Helpers.dropShadowRegular]),
              ),
              const SizedBox(
                width: 25,
              ),
              InkWell(
                  customBorder: const CircleBorder(),
                  onTap: () {
                    onPressed(ref: ref, type: "tuneLeft");
                  },
                  child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.arrow_back,
                        size: 48,
                        color: AGLDemoColors.periwinkleColor,
                      ))),
              const SizedBox(
                width: 25,
              ),
              InkWell(
                  customBorder: const CircleBorder(),
                  onTap: () {
                    onPressed(ref: ref, type: "tuneRight");
                  },
                  child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.arrow_forward,
                        color: AGLDemoColors.periwinkleColor,
                        size: 48,
                      ))),
            ],
          ),
          Row(
            children: [
              Text(
                "Scan",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 40,
                    shadows: [Helpers.dropShadowRegular]),
              ),
              const SizedBox(
                width: 25,
              ),
              InkWell(
                  customBorder: const CircleBorder(),
                  onTap: () {
                    onPressed(ref: ref, type: "scanLeft");
                  },
                  child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.arrow_back,
                        color: AGLDemoColors.periwinkleColor,
                        size: 48,
                      ))),
              const SizedBox(
                width: 25,
              ),
              InkWell(
                  customBorder: const CircleBorder(),
                  onTap: () {
                    onPressed(ref: ref, type: "scanRight");
                  },
                  child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.arrow_forward,
                        color: AGLDemoColors.periwinkleColor,
                        size: 48,
                      ))),
            ],
          )
        ],
      ),
    );
  }
}

class RadioPlayerControlsSlider extends ConsumerStatefulWidget {
  const RadioPlayerControlsSlider({super.key});

  @override
  ConsumerState<RadioPlayerControlsSlider> createState() =>
      RadioPlayerControlsSliderState();
}

class RadioPlayerControlsSliderState
    extends ConsumerState<RadioPlayerControlsSlider> {
  @override
  Widget build(BuildContext context) {
    var freqMin =
        ref.watch(radioStateProvider.select((radio) => radio.freqMin));
    var freqMax =
        ref.watch(radioStateProvider.select((radio) => radio.freqMax));
    var freqStep =
        ref.watch(radioStateProvider.select((radio) => radio.freqStep));
    var currentFreq =
        ref.watch(radioStateProvider.select((radio) => radio.freqCurrent)) /
            1000000.0;

    return SizedBox(
      height: 80,
      child: SliderTheme(
        data: SliderThemeData(
          overlayShape: SliderComponentShape.noOverlay,
          valueIndicatorShape: SliderComponentShape.noOverlay,
          activeTickMarkColor: Colors.transparent,
          inactiveTickMarkColor: Colors.transparent,
          inactiveTrackColor: AGLDemoColors.periwinkleColor,
          thumbShape: const PolygonSliderThumb(sliderValue: 3, thumbRadius: 23),
          //trackHeight: 5,
        ),
        child: Slider(
          divisions: (freqMax - freqMin) ~/ freqStep,
          min: freqMin / 1000000.0,
          max: freqMax / 1000000.0,
          value: currentFreq,
          onChangeStart: (double value) {
            ref.read(radioClientProvider).scanStop();
          },
          onChanged: (double value) {
            setState(() {
              ref
                  .read(radioStateProvider.notifier)
                  .updateFrequency((value * 1000000.0).toInt());
            });
          },
          onChangeEnd: (double value) {
            ref
                .read(radioStateProvider.notifier)
                .setFrequency((value * 1000000.0).toInt());
          },
        ),
      ),
    );
  }
}
