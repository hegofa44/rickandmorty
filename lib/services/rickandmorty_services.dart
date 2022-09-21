import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:io';
// import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:prueba_incubapp/models/models.dart';

class RickAndMortyServices extends ChangeNotifier {
  String _baseUrl = 'rickandmortyapi.com';
  List<CharactersPersonajes> personajes = [];
  List<CharactersPersonajes> allCharacters = [];

  int _numberPage = 0;

  RickAndMortyServices() {
    this.getCharacters();
    this.getAllCharacters();
  }
  getCharacters() async {
    final url = Uri.https(_baseUrl, '/api/character', {'page': '1'});

    // Await the http get response, then decode the json-formatted response.
    final response = await http.get(url);
    final characterResponse = CharacterModels.fromJson(response.body);
    // final Map<String, dynamic> decodedData = json.decode(response.body);
    print(characterResponse.results[19].episode[0]);
    personajes = characterResponse.results;
    notifyListeners();
  }

  getAllCharacters() async {
    _numberPage++;
    final url =
        Uri.https(_baseUrl, '/api/character', {'page': _numberPage.toString()});

    // Await the http get response, then decode the json-formatted response.
    final response = await http.get(url);
    final characterResponse = CharacterModels.fromJson(response.body);
    // final Map<String, dynamic> decodedData = json.decode(response.body);
    print(characterResponse.results[19].episode[0]);
    allCharacters = [...allCharacters, ...characterResponse.results];
    notifyListeners();
  }
}
