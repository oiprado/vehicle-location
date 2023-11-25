import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wob_app/screens/map_widget.dart';
import 'package:wob_app/data/model/itinerary_model.dart';
import 'package:wob_app/data/repositories/user_repository.dart';
import 'package:wob_app/data/repositories/itinerary_repository.dart';
import 'package:wob_app/providers/synchronization/itinerary/itinerary_sync_provider.dart';

class ItineraryCard extends StatefulWidget {
  final String title;

  const ItineraryCard({super.key, required this.title});

  @override
  State<ItineraryCard> createState() => _ItineraryCardState();
}

class _ItineraryCardState extends State<ItineraryCard> {
  final _index = 0;

  @override
  Widget build(BuildContext context) {
    return _createItem("Colegio Internacional Cañaverales");
  }

  Widget _createItem(String titleCard) {
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: const DecorationImage(
            image: AssetImage('assets/images/desktop-wallpaper-vw-bus.jpg'),
            fit: BoxFit.cover),
      ),
      height: 200,
      // decoration: BoxDecoration(color: Colors.orange),
      child: Row(children: [
        Expanded(
          child: Container(
            margin: const EdgeInsets.all(10),
            child: Text(titleCard,
                style: const TextStyle(
                    fontFamily: "Roboto",
                    fontSize: 20,
                    color: Colors.amber,
                    fontWeight: FontWeight.bold)),
          ),
        ),
        GestureDetector(
          onTap: () {
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

                    userRepository.getUser().then((value) {
                      print('init stream');
                      print(value);
                      print('end stream');
                    });

                    // final repository = ItineraryRepository();

                    // repository
                    //     .getList(ItineraryModel(1))
                    //     .then((value) => print('repository $value'));

                    return const MapWidget();
                  },
                ),
              ),
            );
          },
          child: Container(
            width: 60,
            decoration: BoxDecoration(
                color: Colors.amber.shade700,
                borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(10),
                    bottomRight: Radius.circular(10)),
                border: Border.all(color: Colors.amber.shade700, width: 4)),
            child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.white,
                    ),
                    onPressed: null,
                  ),
                ]),
            // decoration: BoxDecoration(color: Colors.blue),
          ),
        )
      ]),
    );
  }
}
