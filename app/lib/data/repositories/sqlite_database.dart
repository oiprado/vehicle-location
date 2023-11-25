import 'package:sqflite/sqflite.dart';
import 'package:flutter/services.dart' show rootBundle;

class SqliteDatabase {
  static List schemas = [
    "1_create_user_account_schema.sql",
    "2_create_responsible_schema.sql",
    "3_create_itinerary_schema.sql",
    "4_create_mark_schema.sql",
    "5_create_route_schema.sql"
  ];

  static Future<void> createTables(Database database) async {
    schemas.forEach((schemaFileName) async {
      print(schemaFileName);
      final schema = await loadStatements(schemaFileName);
      database.execute(schema);
    });
  }

  static Future<String> loadStatements(schemaFileName) async {
    return await rootBundle.loadString('assets/sql/$schemaFileName');
  }
}
