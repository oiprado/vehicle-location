import 'package:flutter/material.dart';
import 'package:wob_app/blocs/blocs.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wob_app/screens/principal.dart';

void main() => runApp(MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => GpsBloc()),
        BlocProvider(create: (_) => LocationBloc()),
        BlocProvider(
            create: (context) =>
                MapBloc(locationBloc: BlocProvider.of<LocationBloc>(context))),
        BlocProvider(
            create: (context) => SpeedBloc(
                locationBloc: BlocProvider.of<LocationBloc>(context))),
        BlocProvider(create: (_) => RouteBloc())
      ],
      child: const WobApp(),
    ));

class WobApp extends StatelessWidget {
  const WobApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    WidgetsFlutterBinding.ensureInitialized();

    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: "Roboto",
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        routes: {'principal': (_) => const Principal()},
        initialRoute: 'principal');
  }
}
