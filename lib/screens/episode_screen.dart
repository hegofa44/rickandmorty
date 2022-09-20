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
        CharacterSwiper(),
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
                cheracterPerson.status,
                style: Theme.of(context).textTheme.subtitle1,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(Icons.star_half_rounded),
                  SizedBox(
                    width: 5.0,
                  ),
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
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: cheracterPerson.episode.length,
        itemBuilder: (BuildContext context, int index) {
          return Text(
            cheracterPerson.episode[index],
            textAlign: TextAlign.justify,
          );
        },
      ),
    );
  }
}
