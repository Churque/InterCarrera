import 'package:flutter/foundation.dart';
import 'package:kdksdkskdxd/entities/jugador.dart';

class PartidoModel extends ChangeNotifier {
  Map<String, int> itemCounts = {};

  Map<String, int> golesCounts = {};
  Map<String, int> asistenciasCounts = {};

  void updateItemCount(String key, int value) {
    itemCounts[key] = value;
    notifyListeners();
  }

  //void actualizarJugadores(List<Jugador> nuevosJugadores) {
  // jugadores = nuevosJugadores;
  // notifyListeners();
  //}

  void updateGolesCount(String key, int value) {
    golesCounts[key] = value;
    notifyListeners();
  }

  void updateAsistenciasCount(String key, int value) {
    asistenciasCounts[key] = value;
    notifyListeners();
  }
}
