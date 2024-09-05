import 'package:flutter_ics_homescreen/export.dart';

@immutable
class AudioState {
  final double volume;
  final double balance;
  final double fade;
  final double treble;
  final double bass;
  const AudioState({
    required this.volume,
    required this.balance,
    required this.fade,
    required this.treble,
    required this.bass,
  });

  const AudioState.initial()
      : volume = 5.0,
        balance = 5.0,
        fade = 5.0,
        treble = 5.0,
        bass = 5.0;

  AudioState copyWith({
    double? volume,
    double? balance,
    double? fade,
    double? treble,
    double? bass,
  }) {
    return AudioState(
      volume: volume ?? this.volume,
      balance: balance ?? this.balance,
      fade: fade ?? this.fade,
      treble: treble ?? this.treble,
      bass: bass ?? this.bass,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AudioState &&
        other.volume == volume &&
        other.balance == balance &&
        other.fade == fade &&
        other.treble == treble &&
        other.bass == bass;
  }

  @override
  int get hashCode {
    return volume.hashCode ^
        balance.hashCode ^
        fade.hashCode ^
        treble.hashCode ^
        bass.hashCode;
  }
}
