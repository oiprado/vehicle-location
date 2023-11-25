import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:wob_app/blocs/blocs.dart';
import 'package:wob_app/themes/themes.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

part 'map_event.dart';
part 'map_state.dart';

class MapBloc extends Bloc<MapEvent, MapState> {
  final LocationBloc locationBloc;
  GoogleMapController? _mapController;

  MapBloc({required this.locationBloc}) : super(const MapState()) {
    on<OnInitializedMap>(_onInitMap);
    locationBloc.stream.listen((locationState) {
      if (locationState.currentPosition == null) return;
      moveCamera(locationState.currentPosition!);
    });
  }

  void _onInitMap(OnInitializedMap event, Emitter<MapState> emmit) {
    _mapController = event.googleMapController;
    // _mapController!.setMapStyle(jsonEncode(darkMapTheme));
    emit(state.copyWith(isMapInitialized: true));
  }

  void moveCamera(LatLng newLocation) {
    final cameraUpdate = CameraUpdate.newCameraPosition(
        CameraPosition(target: newLocation, zoom: 17));

    _mapController?.animateCamera(cameraUpdate);
  }
}
