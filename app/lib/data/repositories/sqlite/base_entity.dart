import 'package:wob_app/data/repositories/sqlite/id.dart';
import 'package:wob_app/data/repositories/sqlite/table.dart';
import 'package:wob_app/data/repositories/sqlite/to_map.dart';

abstract class BaseEntity with Table, Id, ToMap {}
