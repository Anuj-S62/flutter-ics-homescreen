import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_ics_homescreen/core/utils/helpers.dart';
import 'package:flutter_ics_homescreen/export.dart';
import 'package:flutter_ics_homescreen/data/data_providers/radio_presets_provider.dart';

class RadioPresetTable extends ConsumerStatefulWidget {
  const RadioPresetTable(
      {super.key,
      required this.tableName,
      required this.presets,
      required this.selectedPreset});

  final String tableName;
  final List<RadioPreset> presets;
  final String selectedPreset;

  @override
  ConsumerState<RadioPresetTable> createState() => _RadioPresetTableState();
}

class _RadioPresetTableState extends ConsumerState<RadioPresetTable> {
  bool isAudioSettingsEnabled = false;
  late String tableName;
  late List<RadioPreset> presets;
  late String selectedPreset;

  @override
  void initState() {
    tableName = widget.tableName;
    presets = widget.presets;
    selectedPreset = widget.selectedPreset;
    super.initState();
  }

  String frequencyToString(int frequency) {
    return "${(frequency / 1000000.0).toStringAsFixed(1)} MHz";
  }

  @override
  Widget build(BuildContext context) {
    final controller = ScrollController();

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
                                itemCount: presets.length,
                                itemBuilder: (_, int index) {
                                  return Container(
                                    height: 92,
                                    margin: const EdgeInsets.only(right: 44),
                                    decoration: BoxDecoration(
                                        border: Border(
                                            left: selectedPreset ==
                                                    presets[index].name
                                                ? const BorderSide(
                                                    color: Colors.white,
                                                    width: 4)
                                                : BorderSide.none),
                                        gradient: LinearGradient(
                                            colors: selectedPreset ==
                                                    presets[index].name
                                                ? [
                                                    AGLDemoColors.neonBlueColor,
                                                    AGLDemoColors.neonBlueColor
                                                        .withOpacity(0.15)
                                                  ]
                                                : [
                                                    Colors.black,
                                                    Colors.black
                                                        .withOpacity(0.20)
                                                  ])),
                                    child: InkWell(
                                      onTap: () {
                                        ref
                                            .read(radioClientProvider)
                                            .setFrequency(
                                                presets[index].frequency);
                                        setState(() {
                                          selectedPreset = presets[index].name;
                                        });
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 17, horizontal: 24),
                                        child: Row(
                                          children: [
                                            Expanded(
                                                flex: 6,
                                                child: AutoSizeText(
                                                  presets[index].name,
                                                  maxLines: 1,
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 32,
                                                      shadows: [
                                                        Helpers
                                                            .dropShadowRegular
                                                      ]),
                                                )),
                                            Expanded(
                                                flex: 4,
                                                child: Align(
                                                    alignment:
                                                        Alignment.centerRight,
                                                    child: Text(
                                                      frequencyToString(
                                                          presets[index]
                                                              .frequency),
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 24,
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
                            ])),
                  ),
                )),
          ],
        ));
  }
}

class PlayListModel {
  final String songName;
  final String albumName;

  PlayListModel({required this.songName, required this.albumName});
}
