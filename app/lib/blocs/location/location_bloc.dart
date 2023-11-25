import 'dart:async';
import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' show LatLng;


part 'location_event.dart';
part 'location_state.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  StreamSubscription? locationStream;

  LocationBloc() : super(const LocationState(speed: 0)) {
    on<OnNewLocationEvent>((event, emit) {
      emit(state.copyWith(currentPosition: event.location, speed: event.speed));
    });
  }

  Future getCurrentPosition() async {
    // _checkPermissions();
    final position = await Geolocator.getCurrentPosition();
    add(OnNewLocationEvent(
        location: LatLng(position.latitude, position.longitude),
        speed: position.speed));
  }

  void startRoute() {
    // _checkPermissions();
    locationStream = Geolocator.getPositionStream().listen((event) {
      final position = event;
      // print(jsonEncode(position));
      add(OnNewLocationEvent(
          location: LatLng(position.latitude, position.longitude),
          speed: position.speed));
    });
  }

  void stopRoute() {
    locationStream?.cancel();
  }

  void _checkPermissions() async {
    bool serviceEnabled;
    LocationPermission permission;
    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    final GeolocatorPlatform _geolocatorPlatform = GeolocatorPlatform.instance;
    final status = await _geolocatorPlatform.getLocationAccuracy();

    // print(Geolocator.getCurrentPosition());

    // Geolocator.getPositionStream().listen((event) {
    //   print("object: $event");
    // });
  }

  @override
  Future<void> close() {
    stopRoute();
    return super.close();
  }
}
