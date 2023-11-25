import 'dart:convert';

class ItineraryResponse {
  List<Itinerary> itineraries;

  ItineraryResponse({
    required this.itineraries,
  });

  ItineraryResponse copyWith({
    List<Itinerary>? itineraries,
  }) =>
      ItineraryResponse(
        itineraries: itineraries ?? this.itineraries,
      );

  factory ItineraryResponse.fromRawJson(String str) =>
      ItineraryResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ItineraryResponse.fromJson(Map<String, dynamic> json) =>
      ItineraryResponse(
        itineraries: List<Itinerary>.from(
            json["itineraries"].map((x) => Itinerary.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "itineraries": List<dynamic>.from(itineraries.map((x) => x.toJson())),
      };
}

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

class Placemark {
  String guid;
  String name;
  String user;
  List<Route> mark;
  List<NotifyUser> notifyUser;

  Placemark({
    required this.guid,
    required this.name,
    required this.user,
    required this.mark,
    required this.notifyUser,
  });

  Placemark copyWith({
    String? guid,
    String? name,
    String? user,
    List<Route>? mark,
    List<NotifyUser>? notifyUser,
  }) =>
      Placemark(
        guid: guid ?? this.guid,
        name: name ?? this.name,
        user: user ?? this.user,
        mark: mark ?? this.mark,
        notifyUser: notifyUser ?? this.notifyUser,
      );

  factory Placemark.fromRawJson(String str) =>
      Placemark.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Placemark.fromJson(Map<String, dynamic> json) => Placemark(
        guid: json["guid"],
        name: json["name"],
        user: json["user"],
        mark: List<Route>.from(json["mark"].map((x) => Route.fromJson(x))),
        notifyUser: List<NotifyUser>.from(
            json["notifyUser"].map((x) => NotifyUser.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "guid": guid,
        "name": name,
        "user": user,
        "mark": List<dynamic>.from(mark.map((x) => x.toJson())),
        "notifyUser": List<dynamic>.from(notifyUser.map((x) => x.toJson())),
      };
}

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

class NotifyUser {
  String guid;
  String user;

  NotifyUser({
    required this.guid,
    required this.user,
  });

  NotifyUser copyWith({
    String? guid,
    String? user,
  }) =>
      NotifyUser(
        guid: guid ?? this.guid,
        user: user ?? this.user,
      );

  factory NotifyUser.fromRawJson(String str) =>
      NotifyUser.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory NotifyUser.fromJson(Map<String, dynamic> json) => NotifyUser(
        guid: json["guid"],
        user: json["user"],
      );

  Map<String, dynamic> toJson() => {
        "guid": guid,
        "user": user,
      };
}
