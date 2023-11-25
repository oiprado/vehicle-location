import 'dart:convert' as convert;
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:wob_app/model/polylines.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' show LatLng;

class RoutesProvider extends ChangeNotifier {
  final String _baseUrl = "1530-181-51-228-152.ngrok-free.app";
  final String _segment = "/route/user/RouteA";

  List<LatLng> polylines = [];

  RoutesProvider() {
    getPolylines();
  }

  Future<List<LatLng>> getPolylines() async {
    var url = Uri.https(_baseUrl, _segment);
    polylines = List.empty(growable: true);

    var response = await http.get(url);
    if (response.statusCode == 200) {
      final routesResponse = RoutesResponse.fromRawJson(response.body);

      for (var element in routesResponse.routes) {
        polylines.add(LatLng(element.latitude, element.longitude));
      }
    } else {
      polylines = [];
    }

    return polylines;
  }
}
