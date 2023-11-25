part of 'location_bloc.dart';

@immutable
class LocationState extends Equatable {
  final bool followingUser;
  final LatLng? currentPosition;
  final double speed;

  const LocationState(
      {this.followingUser = false, this.currentPosition, required this.speed});

  LocationState copyWith(
          {bool? followingUser, LatLng? currentPosition, double? speed}) =>
      LocationState(
          followingUser: followingUser ?? this.followingUser,
          currentPosition: currentPosition ?? this.currentPosition,
          speed: speed ?? this.speed);

  @override
  List<Object?> get props => [followingUser, currentPosition, speed];
}
