import 'dart:convert';
import 'package:prueba_incubapp/models/models.dart';

class LocationModels {
  LocationModels({
    required this.info,
    required this.results,
  });

  Info info;
  List<LocationResult> results;

  factory LocationModels.fromJson(String str) =>
      LocationModels.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory LocationModels.fromMap(Map<String, dynamic> json) => LocationModels(
        info: Info.fromMap(json["info"]),
        results: List<LocationResult>.from(
            json["results"].map((x) => LocationResult.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "info": info.toMap(),
        "results": List<dynamic>.from(results.map((x) => x.toMap())),
      };
}
