import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class SqliteDatasource {
  static final SqliteDatasource _db = SqliteDatasource._();
  static Database? db;
  SqliteDatasource._();

  static Future<Database> database(
      {required String databaseName,
      required int version,
      bool readonly = false}) async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, databaseName);
    return db ?? await openDatabase(path, version: version, readOnly: readonly);
  }

  factory SqliteDatasource() {
    return _db;
  }
}
