import 'package:flutter/material.dart';
import 'package:wob_app/views/speedometer.dart';

class Menubar extends StatelessWidget {
  const Menubar({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    // SizedBox();
    return Row(
      children: [
        Column(
            // crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.center,
            // verticalDirection: VerticalDirection.up,
            children: [
              TextField(
                onChanged: (texto) {
                  print(texto);
                },
              )
            ]),
        // Column(
        //     mainAxisAlignment: MainAxisAlignment.end, children: [Speedometer()])
      ],
    );
  }
}
