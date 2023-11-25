import '../views/menubar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wob_app/blocs/blocs.dart';
import 'package:wob_app/views/views.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:wob_app/providers/synchronization/itinerary/itinerary_sync_provider.dart';

class MapWidget extends StatefulWidget {
  const MapWidget({super.key});

  @override
  State<MapWidget> createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
  late LocationBloc locationBloc;
  late RouteBloc routeBloc;

  final Set<Marker> _markers = {};
  final Set<Polyline> _polylines = {};

  @override
  void initState() {
    super.initState();
    locationBloc = BlocProvider.of<LocationBloc>(context);
    locationBloc.startRoute();
    setState(() {});
    setState(() {});
  }

  @override
  void dispose() {
    locationBloc.stopRoute();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _scaffold();
  }

  Scaffold _scaffold() {
    final size = MediaQuery.of(context).size;
    final routesProvider = Provider.of<ItinerarySyncProvider>(context);
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new,
                color: Colors.black,
                shadows: [Shadow(color: Colors.black, blurRadius: 2)]),
            onPressed: () => Navigator.of(context).pop(),
          )),

      body: BlocBuilder<LocationBloc, LocationState>(
        builder: (context, state) {
          final currentPosition = state.currentPosition;

          if (currentPosition == null) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return FutureBuilder(
            future: routesProvider.getItineraries(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return SizedBox(
                    height: size.height,
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ));
              }
              /*return Hero(
                tag: "map",
                child: MapView(
                    initialCameraPosition: currentPosition,
                    route: snapshot.data!),
              );*/
              return Center(
                child: Text("Mapa"),
              );
            },
          );
        },
      ),
      // floatingActionButton: const Menubar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
    );
  }
}
