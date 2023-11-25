import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:wob_app/data/synchronization/itinerary/itinerary_response.dart';

class ItinerarySyncProvider extends ChangeNotifier {
  final String _baseUrl = '2416-181-51-228-152.ngrok-free.app';
  final String _segment = "/route/user/RouteA";

  List<ItineraryResponse> _itineraries = [];

  Future<List<ItineraryResponse>> getItineraries() async {
    var url = Uri.https(_baseUrl, _segment);
    _itineraries = List.empty(growable: true);
    var response = await http.get(url);
    if (response.statusCode == 200) {
      final routesResponse = ItineraryResponse.fromRawJson(response.body);

      // for (var element in routesResponse.) {
      //   polylines.add(LatLng(element.latitude, element.longitude));
      // }
    } else {
      _itineraries = [];
    }

    return _itineraries;
  }
}
