import 'dart:convert';
import 'package:meta/meta.dart';
import 'package:wob_app/model/itinerary.dart';

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
