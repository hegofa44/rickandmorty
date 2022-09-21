import 'package:flutter/material.dart';
import 'package:flutter_card_swipper/flutter_card_swiper.dart';
import 'package:prueba_incubapp/models/models.dart';

class CardSwiperHome extends StatelessWidget {
  final List<CharactersPersonajes> characters;

  const CardSwiperHome({Key? key, required this.characters}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    if (this.characters.length == 0) {
      return Container(
        width: double.infinity,
        height: size.height * 0.45,
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    return Container(
      width: double.infinity,
      height: size.height * 0.45,
      // color: Colors.red,
      child: Swiper(
        layout: SwiperLayout.STACK,
        itemWidth: size.width * 0.6,
        itemHeight: size.height * 0.4,
        itemCount: characters.length,
        itemBuilder: (_, int index) {
          final _personajes = characters[index];
          // print(_personajes.image);
          return GestureDetector(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: FadeInImage(
                placeholder: AssetImage('assets/no-image.jpg'),
                image: NetworkImage(_personajes.image),
                fit: BoxFit.cover,
              ),
            ),
            onTap: () {
              Navigator.pushNamed(context, 'episodeScreen',
                  arguments: _personajes);
            },
          );
        },
      ),
    );
  }
}
