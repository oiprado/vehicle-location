import 'dart:convert';
import 'package:meta/meta.dart';
import 'package:wob_app/model/itinerary.dart';

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
