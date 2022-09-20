// To parse this JSON data, do
//
//     final characterModels = characterModelsFromMap(jsonString);

import 'dart:convert';

import 'package:prueba_incubapp/models/models.dart';

class CharacterModels {
  CharacterModels({
    required this.info,
    required this.results,
  });

  Info info;
  List<CharactersPersonajes> results;

  factory CharacterModels.fromJson(String str) =>
      CharacterModels.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CharacterModels.fromMap(Map<String, dynamic> json) => CharacterModels(
        info: Info.fromMap(json["info"]),
        results: List<CharactersPersonajes>.from(
            json["results"].map((x) => CharactersPersonajes.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "info": info.toMap(),
        "results": List<dynamic>.from(results.map((x) => x.toMap())),
      };
}

class Info {
  Info({
    required this.count,
    required this.pages,
    required this.next,
    required this.prev,
  });

  int count;
  int pages;
  String next;
  dynamic prev;

  factory Info.fromJson(String str) => Info.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Info.fromMap(Map<String, dynamic> json) => Info(
        count: json["count"],
        pages: json["pages"],
        next: json["next"],
        prev: json["prev"],
      );

  Map<String, dynamic> toMap() => {
        "count": count,
        "pages": pages,
        "next": next,
        "prev": prev,
      };
}
