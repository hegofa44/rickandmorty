import 'package:flutter/material.dart';
import 'package:prueba_incubapp/models/models.dart';

class SliderEpisode extends StatefulWidget {
  final List<CharactersPersonajes> characters;
  final String? title;
  final Function paginaSiguiente;

  const SliderEpisode(
      {Key? key,
      required this.characters,
      this.title,
      required this.paginaSiguiente})
      : super(key: key);

  @override
  State<SliderEpisode> createState() => _SliderEpisodeState();
}

class _SliderEpisodeState extends State<SliderEpisode> {
  final ScrollController scrollController = new ScrollController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    scrollController.addListener(() {
      if (scrollController.position.pixels >=
          scrollController.position.maxScrollExtent - 500) {
        widget.paginaSiguiente();
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 260,
      // color: Colors.red,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              this.widget.title!,
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 15, letterSpacing: 1),
            ),
          ),
          Expanded(
            child: ListView.builder(
                controller: scrollController,
                scrollDirection: Axis.horizontal,
                itemCount: widget.characters.length,
                itemBuilder: (_, int index) => _EpisodeImage(
                      character: widget.characters[index],
                    )),
          ),
        ],
      ),
    );
  }
}

class _EpisodeImage extends StatelessWidget {
  // const _EpisodeImage({ Key? key }) : super(key: key);
  final CharactersPersonajes character;

  const _EpisodeImage({Key? key, required this.character}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.blueAccent,
      height: 70,
      width: 150,
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: GestureDetector(
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: FadeInImage(
                placeholder: AssetImage('assets/no-image.jpg'),
                image: NetworkImage(character.image),
                width: 150,
                height: 180,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              character.name,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              textAlign: TextAlign.left,
            ),
          ],
        ),
        onTap: () {
          Navigator.pushNamed(context, 'episodeScreen', arguments: character);
        },
      ),
    );
  }
}
