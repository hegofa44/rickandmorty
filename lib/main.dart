import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prueba_incubapp/providers/providers.dart';
import 'package:prueba_incubapp/screens/screens.dart';
import 'package:prueba_incubapp/services/services.dart';

void main() => runApp(AppState());

class AppState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => RickAndMortyServices(),
          lazy: false,
        ),
        ChangeNotifierProvider(
          create: (_) => SelectedScreenProvider(),
          // lazy: false,
        )
      ],
      child: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Rick and Morty',
      initialRoute: 'homeScreen2',
      routes: {
        'homeScreen': (_) => HomeScreen(),
        'homeScreen2': (_) => HomeScreen2(),
        'episodeScreen': (_) => EpisodeScreen(),
        'episodeScreen2': (_) => EpisodeScreen2(),
        'locationScreen': (_) => LocationScreen(),
      },
      theme: ThemeData.light(),
    );
  }
}
