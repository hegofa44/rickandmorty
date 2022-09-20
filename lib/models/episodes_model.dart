// To parse this JSON data, do
//
//     final episodesModels = episodesModelsFromMap(jsonString);

import 'dart:convert';

class EpisodesModels {
  EpisodesModels({
    this.id,
    required this.name,
    required this.airDate,
    required this.episode,
    required this.characters,
    required this.url,
    required this.created,
  });

  int? id;
  String name;
  String airDate;
  String episode;
  List<String> characters;
  String url;
  DateTime created;

  factory EpisodesModels.fromJson(String str) =>
      EpisodesModels.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory EpisodesModels.fromMap(Map<String, dynamic> json) => EpisodesModels(
        // id: json["id"],
        name: json["name"],
        airDate: json["air_date"],
        episode: json["episode"],
        characters: List<String>.from(json["characters"].map((x) => x)),
        url: json["url"],
        created: DateTime.parse(json["created"]),
      );

  Map<String, dynamic> toMap() => {
        // "id": id,
        "name": name,
        "air_date": airDate,
        "episode": episode,
        "characters": List<dynamic>.from(characters.map((x) => x)),
        "url": url,
        "created": created.toIso8601String(),
      };
}
