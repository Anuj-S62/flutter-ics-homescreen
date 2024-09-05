import 'package:flutter_ics_homescreen/export.dart';

@immutable
class RadioState {
  final int freqMin;
  final int freqMax;
  final int freqStep;
  final int freqCurrent;
  final bool playing;
  final bool scanning;
  const RadioState(
      {required this.freqMin,
      required this.freqMax,
      required this.freqStep,
      required this.freqCurrent,
      required this.playing,
      required this.scanning});

  const RadioState.initial()
      : freqMin = 8790000,
        freqMax = 1083000,
        freqStep = 20000,
        freqCurrent = 8790000,
        playing = false,
        scanning = false;

  RadioState copyWith(
      {int? freqMin,
      int? freqMax,
      int? freqStep,
      int? freqCurrent,
      bool? playing,
      bool? scanning}) {
    return RadioState(
      freqMin: freqMin ?? this.freqMin,
      freqMax: freqMax ?? this.freqMax,
      freqStep: freqStep ?? this.freqStep,
      freqCurrent: freqCurrent ?? this.freqCurrent,
      playing: playing ?? this.playing,
      scanning: scanning ?? this.scanning,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is RadioState &&
        other.freqMin == freqMin &&
        other.freqMax == freqMax &&
        other.freqStep == freqStep &&
        other.freqCurrent == freqCurrent &&
        other.playing == playing &&
        other.scanning == scanning;
  }

  @override
  int get hashCode {
    return freqMin.hashCode ^
        freqMax.hashCode ^
        freqStep.hashCode ^
        freqCurrent.hashCode ^
        playing.hashCode ^
        scanning.hashCode;
  }
}
