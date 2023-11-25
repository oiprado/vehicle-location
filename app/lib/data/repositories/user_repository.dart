import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter/material.dart';
import 'package:wob_app/data/repositories/sqlite_database.dart';

class UserRepository extends ChangeNotifier {
  static List schemas = [
    "1_create_user_account_schema.sql",
    "2_create_responsible_schema.sql",
    "3_create_itinerary_schema.sql",
    "4_create_mark_schema.sql",
    "5_create_route_schema.sql"
  ];
  static const String databaseName = "database.db";
  static Database? db;

  UserRepository();

  static Future<Database> initizateDb() async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, databaseName);
    return db ??
        await openDatabase(path, version: 1,
            onCreate: (Database db, int version) async {
          await SqliteDatabase.createTables(db);
        });
  }

  Future<List<Map>> getUser() async {
    final database = await UserRepository.initizateDb();

    // database.rawInsert(
    //     """INSERT INTO USER_ACCOUNT (GUID,FULL_NAME,ADDRESS,PIC) VALUES
    //         ('6d96d9e7-7b0c-47ed-bf4b-183a928db392','Emmanuel Prado Ninco','Calle 1 #3-46, Barrio Puerto Isaac, Yumbo, Valle del Cauca',NULL),
    //         ('ff471a53-7b39-45bd-b9e1-cd72831ca497','Catherin Ninco Chamorro','Calle 1 #3-46, Barrio Puerto Isaac, Yumbo, Valle del Cauca',NULL),
    //         ('6a471e24-c479-4190-985b-0a90401790e3','Oscar Ivan Prado Ninco','Calle 1 #3-46, Barrio Puerto Isaac, Yumbo, Valle del Cauca',NULL)""");

    List<Map<String, dynamic>> users = [];
    if (database.isOpen) {
      users = await database.query('USER_ACCOUNT');
    }
    return users;
  }
}
