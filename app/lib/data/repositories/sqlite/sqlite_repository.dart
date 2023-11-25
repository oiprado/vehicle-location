import 'base_entity.dart';
import 'package:sqflite/sqflite.dart';
import 'package:wob_app/data/repositories/sqlite/repository.dart';
import 'package:wob_app/data/repositories/sqlite/sqlite_datasource.dart';

class SqliteRepository<T extends BaseEntity, I> implements Repository<T, I> {
  late Database _db;

  SqliteRepository();

  @override
  Future<void> delete(T entity) async {
    _db = await SqliteDatasource.database(
        databaseName: "database.db", version: 1);

    await _db.delete(entity.getTableName());
  }

  @override
  Future<List<Map<String, dynamic>>> getList(T entity) async {
    _db = await SqliteDatasource.database(
        databaseName: "database.db", version: 1);

    return await _db.query(entity.getTableName());
  }

  @override
  Future<List<Map<String, dynamic>>> getOne(T entity, I identity) async {
    return await _db.query(entity.getTableName(),
        where: '${entity.getIdFieldName()} = ?', whereArgs: [identity]);
  }

  @override
  Future<void> insert(T entity) async {
    await _db.insert(entity.getTableName(), entity.toMap());
  }

  @override
  Future<void> update(T entity) async {
    await _db.update(entity.getTableName(), entity.toMap(),
        where: ' ${entity.getIdFieldName()} = ?',
        whereArgs: [entity.getIdValue()]);
  }
}
