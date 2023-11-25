import 'dart:convert';
import 'package:meta/meta.dart';

class Route {
  double latitude;
  double longitude;

  Route({
    required this.latitude,
    required this.longitude,
  });

  Route copyWith({
    double? latitude,
    double? longitude,
  }) =>
      Route(
        latitude: latitude ?? this.latitude,
        longitude: longitude ?? this.longitude,
      );

  factory Route.fromRawJson(String str) => Route.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Route.fromJson(Map<String, dynamic> json) => Route(
        latitude: json["latitude"]?.toDouble(),
        longitude: json["longitude"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "latitude": latitude,
        "longitude": longitude,
      };
}
