import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter/material.dart';
import 'package:wob_app/blocs/blocs.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wob_app/coordinates/dummy.dart';
import 'package:wob_app/screens/principal.dart';

void main() {
  Future<void>.delayed(Duration.zero).then((_) async {
    final path = join(await getDatabasesPath(), 'wob_database.db');
    print('$path');
    // Set the path to the database. Note: Using the `join` function from the
    // `path` package is best practice to ensure the path is correctly
    // constructed for each platform.
    final database = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      // When creating the db, create the table
      await db.execute(
          'CREATE TABLE Test (id INTEGER PRIMARY KEY, name TEXT, value INTEGER, num REAL)');
    });

    // Insert some records in a transaction
    await database.transaction((txn) async {
      int id1 = await txn.rawInsert(
          'INSERT INTO Test(name, value, num) VALUES("some name", 1234, 456.789)');
      print('inserted1: $id1');
      int id2 = await txn.rawInsert(
          'INSERT INTO Test(name, value, num) VALUES(?, ?, ?)',
          ['another name', 12345678, 3.1416]);
      print('inserted2: $id2');
    });
  });

  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(create: (_) => GpsBloc()),
      BlocProvider(create: (_) => LocationBloc()),
      BlocProvider(
          create: (context) =>
              MapBloc(locationBloc: BlocProvider.of<LocationBloc>(context))),
      BlocProvider(
          create: (context) =>
              SpeedBloc(locationBloc: BlocProvider.of<LocationBloc>(context))),
      BlocProvider(create: (_) => RouteBloc())
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    WidgetsFlutterBinding.ensureInitialized();

    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        routes: {'principal': (_) => const Principal()},
        initialRoute: 'principal');
  }
}
