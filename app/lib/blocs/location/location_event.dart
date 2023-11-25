part of 'location_bloc.dart';

@immutable
class LocationEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class OnNewLocationEvent extends LocationEvent {
  final LatLng location;
  final double speed;

  OnNewLocationEvent({required this.location, required this.speed});
}
