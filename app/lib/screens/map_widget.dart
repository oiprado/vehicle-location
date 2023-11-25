import '../views/menubar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wob_app/blocs/blocs.dart';
import 'package:wob_app/views/views.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wob_app/providers/map/rotes_provider.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

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
    final routesProvider = Provider.of<RoutesProvider>(context);
    return Scaffold(
      body: BlocBuilder<LocationBloc, LocationState>(
        builder: (context, state) {
          final currentPosition = state.currentPosition;

          if (currentPosition == null) {
            return const Center(
              child: Text("Getting current position"),
            );
          }
          return SingleChildScrollView(
              child: Stack(children: [
            FutureBuilder(
              future: routesProvider.getPolylines(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return SizedBox(
                      height: size.height,
                      child: const Center(
                        child: CircularProgressIndicator(),
                      ));
                }
                return MapView(
                    initialCameraPosition: currentPosition,
                    route: snapshot.data!);
              },
            ),
            Positioned(
                top: 50,
                right: 20,
                left: 20,
                child: Column(
                  children: [
                    SearchBar(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0),
                      )),
                      onChanged: (texto) {
                        print(texto);
                      },
                    )
                  ],
                ))
          ]));
        },
      ),
      // floatingActionButton: const Menubar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
    );
  }
}
