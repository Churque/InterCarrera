import 'package:flutter/foundation.dart';
import 'package:kdksdkskdxd/entities/equipo.dart';
import 'package:kdksdkskdxd/entities/jugador.dart';
import 'package:kdksdkskdxd/entities/partido.dart';

class AppState extends ChangeNotifier {
  List<Jugador> jugadores = [];
  List<Partido> partidos = [];
  List<Equipo> equipos = [];

  void updateJugadores(List<Jugador> nuevosJugadores) {
    jugadores = nuevosJugadores;
    notifyListeners();
  }

  void updatePartidos(List<Partido> nuevosPartidos) {
    partidos = nuevosPartidos;
    notifyListeners();
  }

  void updateEquipos(List<Equipo> nuevosEquipos) {
    equipos = nuevosEquipos;
    notifyListeners();
  }
}
