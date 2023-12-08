import 'package:flutter/foundation.dart';
import 'package:kdksdkskdxd/entities/jugador.dart';

class PartidoModel extends ChangeNotifier {
  Map<String, int> itemCounts = {};
  List<Jugador> jugadores = misJugadores;

  void updateItemCount(String key, int value) {
    itemCounts[key] = value;
    notifyListeners();
  }

  void actualizarJugadores(List<Jugador> nuevosJugadores) {
    jugadores = nuevosJugadores;
    notifyListeners();
  }
}
