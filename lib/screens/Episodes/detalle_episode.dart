import 'package:flutter/material.dart';
import 'package:prueba_incubapp/models/models.dart';

class DetalleEpisodioScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final EpisodesResult episode =
        ModalRoute.of(context)!.settings.arguments as EpisodesResult;
    return Scaffold(
      appBar: AppBar(
        title: Text(episode.name),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Image(image: AssetImage('assets/Rick_and_Morty.webp')),
          ),
          SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  alignment: Alignment.center,
                  width: 150,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Color.fromARGB(255, 13, 252, 0),
                      width: 3.0,
                    ),
                    borderRadius: BorderRadius.circular(5),
                    // color: Colors.red,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Name', style: TextStyle(fontSize: 10)),
                      SizedBox(
                        height: 1,
                      ),
                      Text(
                        episode.name,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ],
                  )),
              SizedBox(
                width: 30,
              ),
              Container(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  alignment: Alignment.center,
                  width: 150,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Color.fromARGB(255, 13, 252, 0),
                      width: 3.0,
                    ),
                    borderRadius: BorderRadius.circular(5),
                    // color: Colors.red,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Episode',
                        style: TextStyle(fontSize: 10),
                      ),
                      SizedBox(
                        height: 1,
                      ),
                      Text(
                        episode.episode,
                      ),
                    ],
                  )),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  alignment: Alignment.center,
                  width: 150,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Color.fromARGB(255, 13, 252, 0),
                      width: 3.0,
                    ),
                    borderRadius: BorderRadius.circular(5),
                    // color: Colors.red,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('AirDate', style: TextStyle(fontSize: 10)),
                      SizedBox(
                        height: 1,
                      ),
                      Text(episode.airDate),
                    ],
                  )),
              SizedBox(
                width: 30,
              ),
              Container(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  alignment: Alignment.center,
                  width: 150,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Color.fromARGB(255, 13, 252, 0),
                      width: 3.0,
                    ),
                    borderRadius: BorderRadius.circular(5),
                    // color: Colors.red,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Characters',
                        style: TextStyle(fontSize: 10),
                      ),
                      SizedBox(
                        height: 1,
                      ),
                      Text(episode.characters.length.toString()),
                    ],
                  )),
            ],
          ),
        ],
      ),
    );
  }
}
