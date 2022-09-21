import 'package:flutter/material.dart';
import 'package:prueba_incubapp/models/models.dart';

class DetalleLocationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final LocationResult location =
        ModalRoute.of(context)!.settings.arguments as LocationResult;
    return Scaffold(
      appBar: AppBar(
        title: Text(location.name),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image(image: AssetImage('assets/rickandmorty.png')),
          // SizedBox(
          //   height: 50,
          // ),
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
                      color: Color.fromARGB(255, 225, 255, 0),
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
                        location.name,
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
                      color: Colors.cyan,
                      width: 3.0,
                    ),
                    borderRadius: BorderRadius.circular(5),
                    // color: Colors.red,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Dimension',
                        style: TextStyle(fontSize: 10),
                      ),
                      SizedBox(
                        height: 1,
                      ),
                      Text(
                        location.dimension,
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
                      color: Colors.cyan,
                      width: 3.0,
                    ),
                    borderRadius: BorderRadius.circular(5),
                    // color: Colors.red,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Type', style: TextStyle(fontSize: 10)),
                      SizedBox(
                        height: 1,
                      ),
                      Text(location.type),
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
                      color: Color.fromARGB(255, 225, 255, 0),
                      width: 3.0,
                    ),
                    borderRadius: BorderRadius.circular(5),
                    // color: Colors.red,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Residents',
                        style: TextStyle(fontSize: 10),
                      ),
                      SizedBox(
                        height: 1,
                      ),
                      Text(location.residents.length.toString()),
                    ],
                  )),
            ],
          ),
        ],
      ),
    );
  }
}
