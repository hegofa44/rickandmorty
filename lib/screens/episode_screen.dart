import 'package:flutter/material.dart';
import 'package:prueba_incubapp/models/models.dart';
import 'package:prueba_incubapp/services/rickandmorty_services.dart';
import 'package:prueba_incubapp/widgets/widgets.dart';

class EpisodeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CharactersPersonajes episode =
        ModalRoute.of(context)!.settings.arguments as CharactersPersonajes;
    return Scaffold(
        body: CustomScrollView(slivers: [
      _CustomAppBar(episode),
      SliverList(
          delegate: SliverChildListDelegate([
        _EpisodioTitulo(episode),
        _EpisodioResumen(episode),
        // CharacterSwiper(),
      ]))
    ]));
  }
}

class _CustomAppBar extends StatelessWidget {
  final CharactersPersonajes cheracterPerson;
  const _CustomAppBar(this.cheracterPerson);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      // backgroundColor: ,
      expandedHeight: 200,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: const EdgeInsets.all(0.0),
        title: Container(
          padding: const EdgeInsets.only(bottom: 10.0),
          width: double.infinity,
          alignment: Alignment.bottomCenter,
          color: Colors.black12,
          child: Text(
            cheracterPerson.name,
            style: TextStyle(fontSize: 16),
          ),
        ),
        background: FadeInImage(
          placeholder: AssetImage('assets/loading.gif'),
          image: NetworkImage(cheracterPerson.image),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class _EpisodioTitulo extends StatelessWidget {
  final CharactersPersonajes cheracterPerson;
  const _EpisodioTitulo(this.cheracterPerson);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20.0),
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: FadeInImage(
              placeholder: AssetImage('assets/no-image.jpg'),
              image: NetworkImage(cheracterPerson.image),
              fit: BoxFit.cover,
              height: 150,
            ),
          ),
          SizedBox(
            width: 20.0,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 160,
                child: Text(
                  cheracterPerson.name,
                  style: Theme.of(context).textTheme.headline5,
                  overflow: TextOverflow.ellipsis,
                  // maxLines: 2,
                ),
              ),
              Text(
                'Status: ' + cheracterPerson.status,
                style: Theme.of(context).textTheme.subtitle1,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
              Text(
                'Gender: ' + cheracterPerson.gender,
                style: Theme.of(context).textTheme.subtitle1,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
              // Text(
              //   'Genero: ' + cheracterPerson.gender,
              //   style: Theme.of(context).textTheme.subtitle1,
              //   overflow: TextOverflow.ellipsis,
              //   maxLines: 2,
              // ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // Icon(Icons.star_half_rounded),
                  // SizedBox(
                  //   width: 5.0,
                  // ),
                  Container(
                    width: 130,
                    child: Text(cheracterPerson.location.name,
                        style: Theme.of(context).textTheme.caption,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}

class _EpisodioResumen extends StatelessWidget {
  final CharactersPersonajes cheracterPerson;
  const _EpisodioResumen(this.cheracterPerson);

  @override
  Widget build(BuildContext context) {
    final rickAndMortyServices = new RickAndMortyServices();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10.0, left: 20),
          child: Text(
            'Episodios: \(${cheracterPerson.episode.length}\)',
            style: Theme.of(context).textTheme.subtitle1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 0.0),
          child: GridView.builder(
            shrinkWrap: true,
            padding: EdgeInsets.symmetric(vertical: 10),
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 40,
              childAspectRatio: 5.1 / 5,
              crossAxisSpacing: 3,
              mainAxisSpacing: 4,
            ),
            itemCount: cheracterPerson.episode.length,
            itemBuilder: (BuildContext context, int index) {
              return ClipRRect(
                // borderRadius: BorderRadius.circular(),
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          border: Border.all(
                              // borderRadius: BorderRadius.circular(10.0),
                              color: Colors.black,
                              width: 1.0),
                          borderRadius: BorderRadius.circular(8.0)),
                      // height: 80,
                      // width: 80,
                      child: Column(
                        children: [
                          (cheracterPerson.episode[index] == null)
                              ? Image(image: AssetImage('assets/no-image.png'))
                              : Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Text(
                                    cheracterPerson.episode[index].replaceAll(
                                        "https://rickandmortyapi.com/api/episode/",
                                        ""),
                                    textAlign: TextAlign.justify,
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 13),
                                  ))
                        ],
                      ),
                      // color: Colors.grey,
                      // decoration: _cardColorsDecorations(),
                    ),
                    // Icon(FontAwesomeIcons.slash),
                  ],
                ),
              );
              // return Text(
              //   cheracterPerson.episode[index]
              //       .replaceAll("https://rickandmortyapi.com/api/episode/", ""),
              //   textAlign: TextAlign.justify,
              // );
            },
          ),
        ),
      ],
    );
  }
}
