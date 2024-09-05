import 'package:flutter_ics_homescreen/export.dart';
import 'playlist_notifier.dart';

class MediaPlayerStateNotifier extends Notifier<MediaPlayerState> {
  @override
  MediaPlayerState build() {
    return const MediaPlayerState.initial();
  }

  void updatePlayState(PlayState newState) {
    state = state.copyWith(playState: newState);
  }

  void updatePlaylistPosition(int position) {
    state = state.copyWith(playlistPosition: position);
  }

  void updateCurrent(PlaylistEntry song) {
    state = state.copyWith(song: song, playlistPosition: song.position);
  }

  void reset() {
    state = const MediaPlayerState.initial();
  }
}
