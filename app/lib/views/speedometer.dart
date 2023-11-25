import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wob_app/blocs/blocs.dart';

class Speedometer extends StatelessWidget {
  const Speedometer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SpeedBloc, SpeedState>(
      builder: (context, state) {
        final speed = state.speed.toString();
        final speedFraction = speed.split(".")[0];
        final speedDecimalFraction = speed.split(".")[1];
        final level = state.level;

        return Container(
          height: 70,
          width: 70,
          decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(100),
              border: Border.all(color: _getColorLevel(level), width: 4)
              //more than 50% of width makes circle
              ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(speedFraction,
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20)),
                  Text(speedDecimalFraction,
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 12))
                ],
              ),
              const Text(
                "Km/h",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              )
            ],
          ),
        );
      },
    );
  }

  _getColorLevel(String level) {
    if (level.contains("red")) {
      return Colors.red;
    } else if (level.contains("yellow")) {
      return Colors.orange;
    } else {
      return Colors.grey;
    }
  }
}
