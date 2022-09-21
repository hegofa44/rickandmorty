import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prueba_incubapp/models/models.dart';
import 'package:prueba_incubapp/services/services.dart';
import 'package:prueba_incubapp/widgets/widgets.dart';

class LocationScreen extends StatefulWidget {
  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  final ScrollController scrollController = new ScrollController();
  paginaSiguiente() {
    final rickandmortyService =
        Provider.of<RickAndMortyServices>(context, listen: false);
    rickandmortyService.getAllLocation();
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
        title: Text('Locations'),
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
        itemCount: rickandmortyService.allLocation.length,
        itemBuilder: (BuildContext context, int index) {
          return _DataLocation(
            location: rickandmortyService.allLocation[index],
          );
        },
      ),
    );
  }
}

class _DataLocation extends StatelessWidget {
  final LocationResult location;
  const _DataLocation({
    Key? key,
    required this.location,
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
              color: Colors.cyan),
          borderRadius: BorderRadius.circular(15.0),
          // color: Colors.red,
        ),
        child: Text(
          location.name,
          textAlign: TextAlign.center,
        ),
      ),
      onTap: () {
        Navigator.pushNamed(context, 'detalleLocationScreen',
            arguments: location);
      },
    );
  }
}
