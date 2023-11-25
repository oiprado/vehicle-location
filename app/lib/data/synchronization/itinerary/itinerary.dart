import 'dart:convert';
import 'package:meta/meta.dart';
import 'package:wob_app/model/itinerary.dart';

class Itinerary {
  String guid;
  String name;
  String description;
  List<Route> route;
  List<Placemark> placemark;

  Itinerary({
    required this.guid,
    required this.name,
    required this.description,
    required this.route,
    required this.placemark,
  });

  Itinerary copyWith({
    String? guid,
    String? name,
    String? description,
    List<Route>? route,
    List<Placemark>? placemark,
  }) =>
      Itinerary(
        guid: guid ?? this.guid,
        name: name ?? this.name,
        description: description ?? this.description,
        route: route ?? this.route,
        placemark: placemark ?? this.placemark,
      );

  factory Itinerary.fromRawJson(String str) =>
      Itinerary.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Itinerary.fromJson(Map<String, dynamic> json) => Itinerary(
        guid: json["guid"],
        name: json["name"],
        description: json["description"],
        route: List<Route>.from(json["route"].map((x) => Route.fromJson(x))),
        placemark: List<Placemark>.from(
            json["placemark"].map((x) => Placemark.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "guid": guid,
        "name": name,
        "description": description,
        "route": List<dynamic>.from(route.map((x) => x.toJson())),
        "placemark": List<dynamic>.from(placemark.map((x) => x.toJson())),
      };
}
