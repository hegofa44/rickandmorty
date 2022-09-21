// To parse this JSON data, do
//
//     final episodesModels = episodesModelsFromMap(jsonString);

import 'dart:convert';
import 'package:prueba_incubapp/models/models.dart';

class EpisodesModels {
  EpisodesModels({
    required this.info,
    required this.results,
  });

  Info info;
  List<EpisodesResult> results;

  factory EpisodesModels.fromJson(String str) =>
      EpisodesModels.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory EpisodesModels.fromMap(Map<String, dynamic> json) => EpisodesModels(
        info: Info.fromMap(json["info"]),
        results: List<EpisodesResult>.from(
            json["results"].map((x) => EpisodesResult.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "info": info.toMap(),
        "results": List<dynamic>.from(results.map((x) => x.toMap())),
      };
}
