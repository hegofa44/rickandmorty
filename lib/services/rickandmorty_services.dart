import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:prueba_incubapp/models/models.dart';

class RickAndMortyServices extends ChangeNotifier {
  String _baseUrl = 'rickandmortyapi.com';
  List<CharactersPersonajes> personajes = [];
  List<CharactersPersonajes> allCharacters = [];
  List<EpisodesResult> allEpisodes = [];
  List<LocationResult> allLocation = [];

  int _numberPage = 0;
  int _numberPageEpisodes = 0;
  int _numberPageLocations = 0;

  RickAndMortyServices() {
    this.getCharacters();
    this.getAllCharacters();
    this.getAllEpisodes();
    this.getAllLocation();
  }
  getCharacters() async {
    final url = Uri.https(_baseUrl, '/api/character', {'page': '1'});

    final response = await http.get(url);
    final characterResponse = CharacterModels.fromJson(response.body);

    print(characterResponse.results[19].episode[0]);
    personajes = characterResponse.results;
    notifyListeners();
  }

  getAllCharacters() async {
    if (_numberPage <= 41) {
      _numberPage++;
    }

    final url =
        Uri.https(_baseUrl, '/api/character', {'page': _numberPage.toString()});

    final response = await http.get(url);
    final characterResponse = CharacterModels.fromJson(response.body);

    print(characterResponse.results[19].episode[0]);
    allCharacters = [...allCharacters, ...characterResponse.results];
    notifyListeners();
  }

  //-----------------------EPISODIOS----------------------
  getAllEpisodes() async {
    if (_numberPageEpisodes <= 2) {
      _numberPageEpisodes++;
    }
    final url = Uri.https(
        _baseUrl, '/api/episode', {'page': _numberPageEpisodes.toString()});

    final response = await http.get(url);
    final episodeResponse = EpisodesModels.fromJson(response.body);
    // final Map<String, dynamic> decodedData = json.decode(response.body);
    // print(episodeResponse.results[19].name);
    allEpisodes = [...allEpisodes, ...episodeResponse.results];
    notifyListeners();
  }
  //-----------------------EPISODIOS----------------------

  //-----------------------LOCATIONS----------------------
  getAllLocation() async {
    if (_numberPageLocations <= 6) {
      _numberPageLocations++;
    }
    final url = Uri.https(
        _baseUrl, '/api/location', {'page': _numberPageLocations.toString()});

    final response = await http.get(url);
    final locationResponse = LocationModels.fromJson(response.body);
    // final Map<String, dynamic> decodedData = json.decode(response.body);
    // print(locationResponse.results[19].name);
    allLocation = [...allLocation, ...locationResponse.results];
    notifyListeners();
  }
  //-----------------------LOCATIONS----------------------
}
