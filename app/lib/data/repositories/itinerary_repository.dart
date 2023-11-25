import 'package:wob_app/data/model/itinerary_model.dart';
import 'package:wob_app/data/repositories/sqlite/repository.dart';
import 'package:wob_app/data/repositories/sqlite/sqlite_repository.dart';

class ItineraryRepository extends SqliteRepository<ItineraryModel, int>
    implements Repository<ItineraryModel, int> {
  ItineraryRepository() : super();
}
