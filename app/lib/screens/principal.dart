import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wob_app/blocs/blocs.dart';
import 'package:wob_app/views/map_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wob_app/screens/map_widget.dart';
import 'package:wob_app/providers/map/rotes_provider.dart';

class Principal extends StatefulWidget {
  const Principal({super.key});

  @override
  State<Principal> createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {
  @override
  Widget build(BuildContext context) {
    final blocProvider = BlocProvider.of<GpsBloc>(context);
    final size = MediaQuery.of(context).size;
    blocProvider.add(CheckPermissionsEvent());

    return Scaffold(
        backgroundColor: const Color.fromRGBO(40, 48, 54, 10),
        body: BlocBuilder<GpsBloc, GpsState>(
          builder: (context, state) {
            return SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [_buildStartButton(state.hasPermissions)],
              ),
            );
          },
        ));
  }

  Widget _listView() {
    return ListWheelScrollView(
      itemExtent: 3,
      useMagnifier: true,
      magnification: 1.5,
      children: <Widget>[
        // Card(
        //   elevation: 3,
        //   shape: RoundedRectangleBorder(
        //     side: BorderSide(
        //       color: Theme.of(context).colorScheme.outline,
        //     ),
        //     borderRadius: const BorderRadius.all(Radius.circular(0)),
        //   ),
        //   child: const SizedBox(
        //       // height: 50,
        //       child: Column(
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     children: [
        //       ListTile(
        //           leading: Icon(Icons.bus_alert_rounded),
        //           title: Text('Ruta 1')),
        //       // ListTile(leading: Icon(Icons.arrow_forward_ios))
        //     ],
        //   )),
        // ),
        // Card(
        //   elevation: 3,
        //   shape: RoundedRectangleBorder(
        //     side: BorderSide(
        //       color: Theme.of(context).colorScheme.outline,
        //     ),
        //     borderRadius: const BorderRadius.all(Radius.circular(0)),
        //   ),
        //   child: const SizedBox(
        //       // height: 50,
        //       child: Column(
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     children: [
        //       ListTile(
        //           leading: Icon(Icons.bus_alert_rounded),
        //           title: Text('Ruta 1')),
        //       // ListTile(leading: Icon(Icons.arrow_forward_ios))
        //     ],
        //   )),
        // ),
        ListTile(
          leading: Icon(
            Icons.map,
          ),
          title: Text('Map'),
        ),
        ListTile(
          leading: Icon(Icons.photo_album),
          title: Text('Album'),
        ),
        ListTile(
          leading: Icon(Icons.phone),
          title: Text('Phone'),
        ),
      ],
    );
  }

  Widget _buildStartButton(bool hasPermissions) {
    return GestureDetector(
      onTap: () => hasPermissions
          ? {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => MultiProvider(
                    providers: [
                      ChangeNotifierProvider(
                        create: (context) => RoutesProvider(),
                        lazy: true,
                      )
                    ],
                    builder: (context, child) {
                      return const MapWidget();
                    },
                  ),
                ),
              )
            }
          : null,
      child: Material(
        shape: const CircleBorder(),
        elevation: 8,
        child: Container(
          padding: const EdgeInsets.all(40),
          height: 200,
          width: 200,
          decoration:
              const BoxDecoration(shape: BoxShape.circle, color: Colors.indigo),
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Start",
                style: TextStyle(color: Colors.white70),
              )
            ],
          ),
        ),
      ),
    );
  }
}
