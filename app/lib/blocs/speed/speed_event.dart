part of 'speed_bloc.dart';

class SpeedEvent extends Equatable {
  const SpeedEvent();

  @override
  List<Object> get props => [];
}

class OnSpeedChange extends SpeedEvent {
  final double speed;
  final String level;

  const OnSpeedChange({required this.speed, required this.level});
}
