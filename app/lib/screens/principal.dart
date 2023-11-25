import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wob_app/blocs/blocs.dart';
import 'package:wob_app/views/map_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wob_app/screens/map_widget.dart';
import 'package:wob_app/widgets/itnerary_card.dart';
import 'package:wob_app/data/model/itinerary_model.dart';
import 'package:wob_app/data/repositories/user_repository.dart';
import 'package:wob_app/data/repositories/itinerary_repository.dart';
import 'package:wob_app/providers/synchronization/itinerary/itinerary_sync_provider.dart';

class Principal extends StatefulWidget {
  const Principal({super.key});

  @override
  State<Principal> createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    final blocProvider = BlocProvider.of<GpsBloc>(context);
    blocProvider.add(CheckPermissionsEvent());

    return Scaffold(
        // backgroundColor: const Color.fromRGBO(40, 48, 54, 10),
        appBar: AppBar(
          elevation: 0,
          leading: const Icon(Icons.menu),
          title: const Text("Home"),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                width: 36,
                height: 30,
                decoration: BoxDecoration(
                    color: Colors.grey[800],
                    borderRadius: BorderRadius.circular(10)),
                child: const Center(child: Text("0")),
              ),
            )
          ],
          backgroundColor: Colors.amber.shade700,
        ),
        body: BlocBuilder<GpsBloc, GpsState>(
          builder: (context, state) {
            return Hero(
              tag: "map",
              child: ListView.builder(
                  itemCount: 6,
                  itemBuilder: (context, index) =>
                      const ItineraryCard(title: "Colegio Cañaverales (CIS)")),
            );
          },
        ));
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
                        create: (context) => ItinerarySyncProvider(),
                        lazy: true,
                      ),
                      ChangeNotifierProvider(
                        create: (context) => UserRepository(),
                        lazy: true,
                      )
                    ],
                    builder: (context, child) {
                      final userRepository =
                          Provider.of<UserRepository>(context, listen: true);

                      // userRepository.getUser().then((value) {
                      //   print(value);
                      // });

                      // final repository = ItineraryRepository();

                      // repository
                      //     .getList(ItineraryModel(1))
                      //     .then((value) => print('repository $value'));
                      // print('before future');

                      FutureBuilder(
                        future: userRepository.getUser(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return const CircularProgressIndicator();
                          }
                          print(snapshot.data);
                          return const Text('data');
                        },
                      );

                      return const Center(child: Text('pantalla'));
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
