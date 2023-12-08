import 'dart:math';

import 'package:flutter/material.dart';
import 'package:kdksdkskdxd/app/widgets/JugadorWidget.dart';
import 'package:kdksdkskdxd/app/widgets/NavBarJugadoresEquipo.dart';
import 'package:kdksdkskdxd/app/widgets/match_info.dart';
import 'package:kdksdkskdxd/entities/equipo.dart';
import 'package:kdksdkskdxd/entities/historial_partido.dart';
import 'package:kdksdkskdxd/entities/jugador.dart';
import 'package:kdksdkskdxd/entities/partido.dart';

class MyInfoPartidoPage extends StatefulWidget {
  const MyInfoPartidoPage({required this.partido});

  final Partido partido;

  @override
  _MyInfoPartidoPage createState() => _MyInfoPartidoPage();
}

class _MyInfoPartidoPage extends State<MyInfoPartidoPage> {
  late Partido partido;
  List<Jugador> jugadores = [];

  @override
  void initState() {
    super.initState();
    partido = widget.partido;
    jugadores = partido.local.jugadores;
  }

  void updateJugadores(Equipo equipo) {
    setState(() {
      jugadores = equipo.jugadores;
    });
  }

  List<ResultadoPartido> generarHistorial(Equipo equipo) {
    //aki poner un algoritmo pa los ultimos 5 partidos

    //generar datos aleatorio
    return List.generate(
      5,
      (index) => ResultadoPartido(
        gano: index % 3 == 0,
        golesEquipoLocal: Random().nextInt(4),
        golesEquipoVisita: Random().nextInt(4),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "InterCarrera",
          style: TextStyle(fontSize: 16, color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildMatchInfoRow(partido),
            _buildRecentResults(),
            tituloJugadores(),
            NavBarJugadoresEquipo(
              equipoLocal: partido.local,
              equipoVisita: partido.visita,
              onEquipoTapped: updateJugadores,
            ),
            for (var jugador in jugadores)
              JugadorWidget(
                nombre: jugador.nombre,
                imagenURL: jugador.imagenURL,
                numCamiseta: jugador.numCamiseta,
              ),
          ],
        ),
      ),
    );
  }

  Widget tituloJugadores() {
    return Container(
      width: double.infinity,
      height: 54,
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xffd9d9d9)),
      ),
      child: Center(
        child: Text(
          'Jugadores',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'Urbanist',
            fontSize: 16,
            fontWeight: FontWeight.w900,
            color: Color(0xff000000),
          ),
        ),
      ),
    );
  }

  Widget _buildMatchInfoRow(Partido partido) {
    return Container(
      height: 171,
      padding: EdgeInsets.all(15),
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xffcccccc)),
      ),
      child: MatchInfoRow(partido: partido),
    );
  }

  Widget _buildRecentResults() {
    final historialLocal = HistorialPartidos(
      nombreEquipo: partido.local.nombreEquipo,
      imagenURL: partido.local.imagenURL,
      resultados: generarHistorial(partido.local),
    );

    final historialVisita = HistorialPartidos(
      nombreEquipo: partido.visita.nombreEquipo,
      imagenURL: partido.visita.imagenURL,
      resultados: generarHistorial(partido.visita),
    );

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      height: 171,
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xffcccccc)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            child: Text(
              'Resultados Recientes',
              style: TextStyle(
                fontFamily: 'Urbanist',
                fontSize: 16,
                fontWeight: FontWeight.w900,
                color: Color(0xff000000),
              ),
            ),
          ),
          Container(
            width: double.infinity,
            height: 90,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildTeamResults(historialLocal),
                SizedBox(width: 125),
                buildTeamResultsRight(historialVisita),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildTeamResults(HistorialPartidos historial) {
    return Container(
      width: 100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 10),
            width: double.infinity,
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.only(right: 10),
                  child: Text(
                    historial.nombreEquipo.substring(0, 3),
                    style: TextStyle(
                      fontFamily: 'Urbanist',
                      fontSize: 16,
                      fontWeight: FontWeight.w900,
                      color: Color(0xff000000),
                    ),
                  ),
                ),
                Container(
                  width: 29,
                  height: 29,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14.5),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(historial.imagenURL),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 21,
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.only(right: 5),
                  width: 85,
                  child: Stack(
                    children:
                        List.generate(historial.resultados.length, (index) {
                      final resultado = historial.resultados[index];
                      return Positioned(
                        left: 16 * index.toDouble(),
                        child: Container(
                          width: 21,
                          height: 21,
                          decoration: BoxDecoration(
                            color: resultado.gano
                                ? Color(0xff00d92f)
                                : Color(0xffff0000),
                            borderRadius: BorderRadius.circular(10.5),
                          ),
                          child: Center(
                            child: Text(
                              resultado.gano ? 'G' : 'P',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'Urbanist',
                                fontSize: 9,
                                fontWeight: FontWeight.w900,
                                color: Color(0xffffffff),
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                ),
                Container(
                  width: 6,
                  height: 8,
                  child: Image.network(
                    'https://images.vexels.com/media/users/3/136721/isolated/preview/0a87638be517433b4846494d15db9126-punta-de-flecha-derecha.png',
                    width: 6,
                    height: 8,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildTeamResultsRight(HistorialPartidos historial) {
    return Container(
      width: 100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(34, 0, 0, 10),
            width: double.infinity,
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(0, 5, 10, 0),
                  child: Text(
                    historial.nombreEquipo.substring(0, 3),
                    style: TextStyle(
                      fontFamily: 'Urbanist',
                      fontSize: 16,
                      fontWeight: FontWeight.w900,
                      color: Color(0xff000000),
                    ),
                  ),
                ),
                Container(
                  width: 29,
                  height: 29,
                  child: Image.network(
                    historial.imagenURL,
                    width: 29,
                    height: 29,
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 21,
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.only(right: 5),
                  width: 6,
                  height: 8,
                  child: Image.network(
                    'https://images.vexels.com/media/users/3/136721/isolated/preview/0a87638be517433b4846494d15db9126-punta-de-flecha-derecha.png',
                    width: 6,
                    height: 8,
                  ),
                ),
                Container(
                  width: 85,
                  height: double.infinity,
                  child: Stack(
                    children:
                        List.generate(historial.resultados.length, (index) {
                      final resultado = historial.resultados[index];
                      return Positioned(
                        left: 16 * index.toDouble(),
                        top: 0,
                        child: Container(
                          width: 21,
                          height: 21,
                          decoration: BoxDecoration(
                            color: resultado.gano
                                ? Color(0xff00d92f)
                                : Color(0xffff0000),
                            borderRadius: BorderRadius.circular(10.5),
                          ),
                          child: Center(
                            child: Text(
                              resultado.gano ? 'G' : 'P',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'Urbanist',
                                fontSize: 9,
                                fontWeight: FontWeight.w900,
                                color: Color(0xffffffff),
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
