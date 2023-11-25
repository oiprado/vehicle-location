import 'package:flutter/material.dart';
import 'package:wob_app/blocs/blocs.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapView extends StatelessWidget {
  final LatLng initialCameraPosition;
  final List<LatLng> route;
  final Set<Marker> _markers = {};
  final Set<Polyline> _polylines = {};

  MapView(
      {super.key, required this.initialCameraPosition, required this.route});

  // final Completer<GoogleMapController> _controller =
  //     Completer<GoogleMapController>();

  @override
  Widget build(BuildContext context) {
    final mapBloc = BlocProvider.of<MapBloc>(context);

    final CameraPosition initialCameraPosition =
        CameraPosition(target: this.initialCameraPosition, zoom: 16);

    // _createMarkers();
    // _convertToPolylines(route);

    final size = MediaQuery.of(context).size;

    final googleMap = GoogleMap(
        initialCameraPosition: initialCameraPosition,
        mapType: MapType.normal,
        // on below line we have enabled location
        myLocationEnabled: true,
        myLocationButtonEnabled: false,
        // on below line we have enabled compass location
        compassEnabled: false,
        zoomControlsEnabled: false,
        markers: _markers,
        polylines: _polylines,
        onMapCreated: (controller) =>
            mapBloc.add(OnInitializedMap(controller)));

    return SizedBox(width: size.width, height: size.height, child: googleMap);
  }

  void _createMarkers() {
    // for (int i = 0; i < route.length; i++) {

    // }

    if (route.length < 1) return;

    _markers.add(Marker(
      markerId: const MarkerId("1"),
      position: route[0],
    ));

    _markers.add(Marker(
      markerId: const MarkerId("1"),
      position: route[route.length - 1],
    ));
  }

  void _convertToPolylines(List<LatLng> route) {
    _polylines.add(Polyline(
        polylineId: const PolylineId('poly'),
        points: route,
        width: 5,
        color: Colors.grey));
  }
}
