import 'package:flutter_ics_homescreen/core/utils/helpers.dart';
import 'package:flutter_ics_homescreen/export.dart';
import 'package:flutter_ics_homescreen/presentation/screens/settings/settings_screens/audio_settings/widget/slider_widgets.dart';

// Time to string helper, returns HH:MM:SS or MM:SS as appropriate
String timeToString(Duration time) {
  String result = "";
  if (time > const Duration(minutes: 59, seconds: 59)) {
    result = time.toString().split('.').first.padLeft(8, "0");
  } else {
    result = time.toString().substring(2, 7);
  }
  return result;
}

class MediaPlayerControls extends ConsumerStatefulWidget {
  const MediaPlayerControls({super.key});

  @override
  ConsumerState<MediaPlayerControls> createState() =>
      _MediaPlayerControlsState();
}

class _MediaPlayerControlsState extends ConsumerState<MediaPlayerControls> {
  //@override
  //void initState() {
  //  super.initState();
  //}

  @override
  Widget build(BuildContext context) {
    var currentSong = ref.watch(
        mediaPlayerStateProvider.select((mediaplayer) => mediaplayer.song));
    var songPosition = ref.watch(mediaPlayerPositionProvider);

    String songName = "";
    String songDetail = "";
    String songPositionString = "00:00";
    String songLengthString = "00:00";
    if (currentSong != null) {
      songName = currentSong.title;
      songDetail = currentSong.artist;
      songLengthString = timeToString(currentSong.duration);
    }
    songPositionString = timeToString(songPosition);

    return Material(
      color: Colors.transparent,
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Text(
          songName,
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w400,
              shadows: [Helpers.dropShadowRegular],
              fontSize: 44),
        ),
        MediaPlayerControlsDetails(
          songDetail: songDetail,
        ),
        Column(children: [
          const MediaPlayerControlsSlider(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  songPositionString,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 26,
                      shadows: [Helpers.dropShadowRegular]),
                ),
                Text(
                  songLengthString,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 26,
                      shadows: [Helpers.dropShadowRegular]),
                )
              ],
            ),
          ),
        ]),
        const MediaPlayerControlsActions(),
      ]),
    );
  }
}

class MediaPlayerControlsDetails extends StatefulWidget {
  const MediaPlayerControlsDetails({super.key, required this.songDetail});
  final String songDetail;

  @override
  State<MediaPlayerControlsDetails> createState() =>
      _MediaPlayerControlsDetailsState();
}

class _MediaPlayerControlsDetailsState
    extends State<MediaPlayerControlsDetails> {
  bool isShuffleEnabled = false;
  bool isRepeatEnabled = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Text(
              widget.songDetail,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: 40,
                  shadows: [Helpers.dropShadowRegular]),
            ),
          ),
        ),
        Row(
          children: [
            InkWell(
                customBorder: const CircleBorder(),
                onTap: () {
                  setState(() {
                    isShuffleEnabled = !isShuffleEnabled;
                  });
                },
                child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SvgPicture.asset(
                      "assets/${isShuffleEnabled ? "ShufflePressed.svg" : "Shuffle.svg"}",
                      width: 48,
                    ))),
            InkWell(
                customBorder: const CircleBorder(),
                onTap: () {
                  setState(() {
                    isRepeatEnabled = !isRepeatEnabled;
                  });
                },
                child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SvgPicture.asset(
                      "assets/${isRepeatEnabled ? "RepeatPressed.svg" : "Repeat.svg"}",
                      width: 48,
                    ))),
          ],
        )
      ],
    );
  }
}

class MediaPlayerControlsSlider extends ConsumerStatefulWidget {
  const MediaPlayerControlsSlider({super.key});

  @override
  ConsumerState<MediaPlayerControlsSlider> createState() =>
      MediaPlayerControlsSliderState();
}

class MediaPlayerControlsSliderState
    extends ConsumerState<MediaPlayerControlsSlider> {
  //late Duration songPosition;

  //@override
  //void initState() {
  //  songPosition = ref.read(mediaPlayerPositionProvider);
  //  super.initState();
  //}

  @override
  Widget build(BuildContext context) {
    var currentSong = ref.watch(
        mediaPlayerStateProvider.select((mediaplayer) => mediaplayer.song));
    var songPosition = ref.watch(mediaPlayerPositionProvider);

    Duration songLength = Duration.zero;
    if (currentSong != null) {
      songLength = currentSong.duration;
    }

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
          max: songLength.inMilliseconds.toDouble(),
          value: songPosition.inMilliseconds.toDouble(),
          onChangeStart: (double value) {
            // Disable timer so position will not change while control is
            // being dragged.  It will be re-enabled via the playback state
            // update from MPD.
            ref.read(mediaPlayerPositionProvider.notifier).pause();
          },
          onChanged: (double newValue) {
            setState(() {
              ref
                  .read(mediaPlayerPositionProvider.notifier)
                  .set(Duration(milliseconds: newValue.toInt()));
            });
          },
          onChangeEnd: (double newValue) {
            ref.read(mpdClientProvider).seek(newValue.toInt());
          },
        ),
      ),
    );
  }
}

class MediaPlayerControlsActions extends ConsumerStatefulWidget {
  const MediaPlayerControlsActions({super.key});

  @override
  ConsumerState<MediaPlayerControlsActions> createState() =>
      _MediaPlayerControlsActionsState();
}

class _MediaPlayerControlsActionsState
    extends ConsumerState<MediaPlayerControlsActions> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    bool isPlaying = ref.watch(mediaPlayerStateProvider
            .select((mediaplayer) => mediaplayer.playState)) ==
        PlayState.playing;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
            customBorder: const CircleBorder(),
            onTap: () {
              ref.read(mpdClientProvider).previous();
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SvgPicture.asset(
                "assets/SkipPrevious.svg",
                width: 48,
              ),
            )),
        const SizedBox(
          width: 120,
        ),
        InkWell(
            customBorder: const CircleBorder(),
            onTap: () {
              setState(() {
                if (isPlaying) {
                  ref.read(mpdClientProvider).pause();
                } else {
                  ref.read(mpdClientProvider).play();
                }
              });
            },
            onTapDown: (details) {
              setState(() {
                isPressed = true;
              });
            },
            onTapUp: (details) {
              isPressed = false;
            },
            child: Container(
              width: 64,
              height: 64,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color:
                      isPressed ? Colors.white : AGLDemoColors.periwinkleColor,
                  boxShadow: [Helpers.boxDropShadowRegular]),
              child: Icon(
                isPlaying ? Icons.pause : Icons.play_arrow,
                color: AGLDemoColors.resolutionBlueColor,
                size: 60,
              ),
            )),
        const SizedBox(
          width: 120,
        ),
        InkWell(
            customBorder: const CircleBorder(),
            onTap: () {
              ref.read(mpdClientProvider).next();
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SvgPicture.asset(
                "assets/SkipNext.svg",
                width: 48,
              ),
            )),
      ],
    );
  }
}
