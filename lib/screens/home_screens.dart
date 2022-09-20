import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prueba_incubapp/services/services.dart';
import 'package:prueba_incubapp/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final rickandmortyService = Provider.of<RickAndMortyServices>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text('Rick and Morty'),
          actions: [
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {},
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              // Ver listado capitulos
              CardSwiperHome(characters: rickandmortyService.personajes),
              //Listado horizontal capitulos

              SliderEpisode(
                characters: rickandmortyService.allCharacters,
                title: 'Personajes',
                paginaSiguiente: () => rickandmortyService.getAllCharacters(),
              ),
              // SliderEpisode(),
            ],
          ),
        ));
  }
}
