import 'dart:convert';

class RoutesResponse {
  List<Route> routes;
  List<Placemark> placemark;

  RoutesResponse({
    required this.routes,
    required this.placemark,
  });

  factory RoutesResponse.fromRawJson(String str) =>
      RoutesResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory RoutesResponse.fromJson(Map<String, dynamic> json) => RoutesResponse(
        routes: List<Route>.from(json["routes"].map((x) => Route.fromJson(x))),
        placemark: List<Placemark>.from(
            json["placemark"].map((x) => Placemark.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "routes": List<dynamic>.from(routes.map((x) => x.toJson())),
        "placemark": List<dynamic>.from(placemark.map((x) => x.toJson())),
      };
}

class Placemark {
  String name;
  String student;
  Mark mark;

  Placemark({
    required this.name,
    required this.student,
    required this.mark,
  });

  factory Placemark.fromRawJson(String str) =>
      Placemark.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Placemark.fromJson(Map<String, dynamic> json) => Placemark(
        name: json["name"],
        student: json["student"],
        mark: json["mark"].map((x) => Mark.fromJson(x)),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "student": student,
        "coordinates": List<dynamic>.from(coordinates.map((x) => x.toJson())),
      };
}

class Mark {
  double latitude;
  double longitude;

  Mark({
    required this.latitude,
    required this.longitude,
  });

  factory Mark.fromRawJson(String str) => Mark.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Mark.fromJson(Map<String, dynamic> json) => Mark(
        latitude: json["latitude"]?.toDouble(),
        longitude: json["longitude"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "latitude": latitude,
        "longitude": longitude,
      };
}

class Route {
  double latitude;
  double longitude;

  Route({
    required this.latitude,
    required this.longitude,
  });

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
