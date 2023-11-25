part of 'speed_bloc.dart';

@immutable
class SpeedState extends Equatable {
  final double speed;
  final String level;

  const SpeedState({required this.speed, required this.level});

  SpeedState copyWith({double? speed, String? level}) =>
      SpeedState(speed: speed ?? this.speed, level: level ?? this.level);

  @override
  List<Object> get props => [speed, level];
}
