import 'package:wob_app/data/repositories/sqlite/base_entity.dart';

abstract class Repository<T extends BaseEntity, I> {
  Future<void> insert(T entity);
  Future<void> delete(T entity);
  Future<void> update(T identity);
  Future<List<Map<String, dynamic>>> getList(T entity);
  Future<List<Map<String, dynamic>>> getOne(T entity, I identity);
}
