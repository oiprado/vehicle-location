import 'package:wob_app/data/repositories/sqlite/base_entity.dart';

class ItineraryModel extends BaseEntity {
  final int id;

  ItineraryModel(this.id);

  @override
  dynamic getIdFieldName() {
    return id;
  }

  @override
  String getTableName() {
    return "ITINERARY";
  }

  @override
  Map<String, dynamic> toMap() {
    return {"id": id};
  }

  @override
  getIdValue() {
    return id;
  }
}
