import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prueba_incubapp/providers/providers.dart';
import 'package:prueba_incubapp/screens/screens.dart';
import 'package:prueba_incubapp/widgets/widgets.dart';

class HomeScreen2 extends StatefulWidget {
  @override
  State<HomeScreen2> createState() => _HomeScreenState();
}

bool _search = false;
String _searchTarea = '';

class _HomeScreenState extends State<HomeScreen2> {
  void initState() {
    _search = false;
    _searchTarea = '';
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
      bottomNavigationBar: CustomNavigationBar(),
      body: _PaginaSeleccionada(),
    );
  }
}

class _PaginaSeleccionada extends StatelessWidget {
  const _PaginaSeleccionada({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final selectedScreenProvider = Provider.of<SelectedScreenProvider>(context);
    final opcionSeleccionada = selectedScreenProvider.opcionSeleccionada;

    switch (opcionSeleccionada) {
      case 0:
        return HomeScreen();
      case 1:
        return LocationScreen();
      case 2:
        return EpisodeScreen2();
      default:
        return HomeScreen();
    }
  }
}
