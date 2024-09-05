import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_ics_homescreen/core/utils/helpers.dart';
import 'package:flutter_ics_homescreen/export.dart';

class PlayListTable extends ConsumerStatefulWidget {
  const PlayListTable({super.key});

  @override
  ConsumerState<PlayListTable> createState() => _PlayListTableState();
}

class _PlayListTableState extends ConsumerState<PlayListTable> {
  bool isAudioSettingsEnabled = false;

  //@override
  //void initState() {
  //  super.initState();
  //}

  @override
  Widget build(BuildContext context) {
    final controller = ScrollController();
    var playlist = ref.watch(playlistProvider);
    var selectedPosition = ref.watch(mediaPlayerStateProvider
        .select((mediaplayer) => mediaplayer.playlistPosition));
    late String tableName = "USB";

    return Material(
        color: Colors.transparent,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      tableName,
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 40),
                    ),
                    InkWell(
                        customBorder: const CircleBorder(),
                        onTap: () {},
                        child: Opacity(
                          opacity: 0.5,
                          child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SvgPicture.asset(
                                "assets/AppleMusic.svg",
                                width: 32,
                              )),
                        )),
                  ],
                ),
                InkWell(
                    customBorder: const CircleBorder(),
                    onTap: () {
                      setState(() {
                        isAudioSettingsEnabled = !isAudioSettingsEnabled;
                        ref
                            .read(appProvider.notifier)
                            .update(AppState.audioSettings);
                      });
                    },
                    child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SvgPicture.asset(
                          "assets/${isAudioSettingsEnabled ? "AudioSettingsPressed.svg" : "AudioSettings.svg"}",
                          width: 48,
                        )))
              ],
            ),
            Padding(
                padding: const EdgeInsets.only(right: 12),
                child: SizedBox(
                    height: 500,
                    child: RawScrollbar(
                        controller: controller,
                        thickness: 32,
                        thumbVisibility: true,
                        radius: const Radius.circular(10),
                        thumbColor: AGLDemoColors.periwinkleColor,
                        minThumbLength: 60,
                        interactive: true,
                        child: ScrollConfiguration(
                            behavior: ScrollConfiguration.of(context).copyWith(
                              scrollbars: false,
                              overscroll: false,
                            ),
                            child: CustomScrollView(
                                controller: controller,
                                physics: const ClampingScrollPhysics(),
                                slivers: <Widget>[
                                  SliverList.separated(
                                    itemCount: playlist.length,
                                    itemBuilder: (_, int index) {
                                      return Container(
                                        height: 92,
                                        margin:
                                            const EdgeInsets.only(right: 44),
                                        decoration: BoxDecoration(
                                            border: Border(
                                                left: selectedPosition ==
                                                        playlist[index].position
                                                    ? const BorderSide(
                                                        color: Colors.white,
                                                        width: 4)
                                                    : BorderSide.none),
                                            gradient: LinearGradient(
                                                colors: selectedPosition ==
                                                        playlist[index].position
                                                    ? [
                                                        AGLDemoColors
                                                            .neonBlueColor,
                                                        AGLDemoColors
                                                            .neonBlueColor
                                                            .withOpacity(0.15)
                                                      ]
                                                    : [
                                                        Colors.black,
                                                        Colors.black
                                                            .withOpacity(0.20)
                                                      ])),
                                        child: InkWell(
                                          onTap: () {
                                            setState(() {
                                              selectedPosition =
                                                  playlist[index].position;
                                              ref
                                                  .read(mpdClientProvider)
                                                  .pickTrack(
                                                      playlist[index].position);
                                            });
                                          },
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 17, horizontal: 24),
                                            child: Column(
                                              children: [
                                                Expanded(
                                                    flex: 6,
                                                    child: Align(
                                                        alignment: Alignment
                                                            .centerLeft,
                                                        child: AutoSizeText(
                                                          playlist[index].title,
                                                          maxLines: 1,
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 40,
                                                              shadows: [
                                                                Helpers
                                                                    .dropShadowRegular
                                                              ]),
                                                        ))),
                                                Expanded(
                                                    flex: 4,
                                                    child: Align(
                                                        alignment: Alignment
                                                            .centerLeft,
                                                        child: Text(
                                                          playlist[index]
                                                              .artist,
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 22,
                                                              shadows: [
                                                                Helpers
                                                                    .dropShadowRegular
                                                              ]),
                                                        )))
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                    separatorBuilder: (_, __) {
                                      return const SizedBox(height: 8);
                                    },
                                  ),
                                ]))))),
          ],
        ));
  }
}
