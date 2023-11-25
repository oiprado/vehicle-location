part of 'map_bloc.dart';

sealed class MapEvent extends Equatable {
  const MapEvent();

  @override
  List<Object> get props => [];
}

class OnInitializedMap extends MapEvent {
  final GoogleMapController googleMapController;

  const OnInitializedMap(this.googleMapController);
}
