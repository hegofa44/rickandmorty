import 'package:flutter/material.dart';

class SelectedScreenProvider extends ChangeNotifier {
  int _opcionSeleccionada = 0;
  double _opcionSeleccionada2 = 0.01;

  int get opcionSeleccionada {
    return this._opcionSeleccionada;
  }

  set opcionSeleccionada(int i) {
    this._opcionSeleccionada = i;
    notifyListeners();
  }

  double get opcionSeleccionada2 {
    return this._opcionSeleccionada2;
  }

  set opcionSeleccionada2(double i) {
    this._opcionSeleccionada2 = i;
    notifyListeners();
  }
}
