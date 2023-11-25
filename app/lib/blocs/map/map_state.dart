part of 'map_bloc.dart';

class MapState extends Equatable {
  final bool isMapInitialized;
  final bool followingUser;
  final LatLng? updatePosition;

  const MapState(
      {this.isMapInitialized = false,
      this.followingUser = false,
      this.updatePosition});

  MapState copyWith({bool? isMapInitialized, bool? followingUser}) => MapState(
      isMapInitialized: isMapInitialized ?? this.isMapInitialized,
      followingUser: followingUser ?? this.followingUser,
      updatePosition: updatePosition ?? updatePosition);

  @override
  List<Object> get props => [isMapInitialized, followingUser];
}
