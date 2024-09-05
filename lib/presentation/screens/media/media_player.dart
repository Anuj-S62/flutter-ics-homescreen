import 'package:flutter_ics_homescreen/export.dart';
import 'media_player_controls.dart';
import 'play_list_table.dart';
import 'segmented_buttons.dart';

class MediaPlayer extends ConsumerStatefulWidget {
  const MediaPlayer({super.key});

  @override
  ConsumerState<MediaPlayer> createState() => _MediaPlayerState();
}

class _MediaPlayerState extends ConsumerState<MediaPlayer> {
  String selectedNav = "USB";
  List<String> navItems = ["USB", "SD", "Bluetooth"];

  @override
  Widget build(BuildContext context) {
    double albumArtSize = 400;
    final playlistPosition = ref.watch(mediaPlayerStateProvider
        .select((mediaplayer) => mediaplayer.playlistPosition));
    final playlistArt = ref.watch(playlistArtProvider);
    Uint8List art = Uint8List(0);
    if (playlistArt.containsKey(playlistPosition)) {
      art = playlistArt[playlistPosition]!;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SegmentedButtons(
          navItems: navItems,
          selectedNav: selectedNav,
        ),
        const SizedBox(
          height: 32,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            art.isNotEmpty
                ? Image.memory(art,
                    width: albumArtSize,
                    height: albumArtSize,
                    fit: BoxFit.contain)
                : Container(
                    width: albumArtSize,
                    height: albumArtSize,
                    color: AGLDemoColors.jordyBlueColor.withOpacity(0.2),
                    child: Icon(
                      Icons.music_note,
                      size: albumArtSize,
                      color: AGLDemoColors.jordyBlueColor,
                    ))
          ],
        ),
        const SizedBox(
          height: 40,
        ),
        const Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            MediaPlayerControls(),
            const SizedBox(
              height: 12,
            ),
            PlayListTable(),
          ],
        )
      ],
    );
  }
}
