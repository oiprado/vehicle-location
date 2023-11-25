import 'dart:convert';
import 'package:meta/meta.dart';

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
