import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prueba_incubapp/models/models.dart';
import 'package:prueba_incubapp/services/services.dart';

class EpisodeScreen2 extends StatefulWidget {
  @override
  State<EpisodeScreen2> createState() => _EpisodeScreen2State();
}

class _EpisodeScreen2State extends State<EpisodeScreen2> {
  final ScrollController scrollController = new ScrollController();
  paginaSiguiente() {
    final rickandmortyService =
        Provider.of<RickAndMortyServices>(context, listen: false);
    rickandmortyService.getAllEpisodes();
  }

  void initState() {
    // TODO: implement initState
    super.initState();
    scrollController.addListener(() {
      if (scrollController.position.pixels >=
          scrollController.position.maxScrollExtent - 200) {
        paginaSiguiente();
      }
      // print(scrollController.position.maxScrollExtent);
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final rickandmortyService = Provider.of<RickAndMortyServices>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text('Episodes'),
        ),
        body: GridView.builder(
          controller: scrollController,
          padding: EdgeInsets.only(top: 10, left: 10, right: 10),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 150,
            childAspectRatio: 3.5 / 5,
            crossAxisSpacing: 6,
            mainAxisSpacing: 6,
          ),
          itemCount: rickandmortyService.allEpisodes.length,
          itemBuilder: (BuildContext context, int index) {
            return _DataEpisode(
              episode: rickandmortyService.allEpisodes[index],
            );
          },
        ));
  }
}

class _DataEpisode extends StatelessWidget {
  final EpisodesResult episode;
  const _DataEpisode({
    Key? key,
    required this.episode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 5),
        alignment: Alignment.center,
        height: 100,
        width: 100,
        decoration: BoxDecoration(
          border: Border.all(
              // width: 1.0,
              color: Color.fromARGB(255, 13, 252, 0)),
          borderRadius: BorderRadius.circular(15.0),
          // color: Colors.red,
        ),
        child: Text(
          episode.name,
          textAlign: TextAlign.center,
        ),
      ),
      onTap: () {
        Navigator.pushNamed(context, 'detalleEpisodioScreen',
            arguments: episode);
      },
    );
  }
}
