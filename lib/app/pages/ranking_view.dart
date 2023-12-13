import 'package:flutter/material.dart';
import 'package:kdksdkskdxd/app/appstate.dart';
import 'package:kdksdkskdxd/entities/jugador.dart';

import 'package:provider/provider.dart';

class MyRankingPage extends StatefulWidget {
  //const MyRankingPage();
  const MyRankingPage({Key? key}) : super(key: key);

  @override
  _MyRankingState createState() => _MyRankingState();
}

class _MyRankingState extends State<MyRankingPage> {
  List<Jugador> topGoleadores = [];
  List<Jugador> topAsistidores = [];
  List<Jugador> topGoleadoresYAsistidores = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    topGoleadores = obtenerTopGoleadores(misJugadores, 3);
    topAsistidores = obtenerTopAsistidores(misJugadores, 3);
    topGoleadoresYAsistidores =
        obtenerTopGoleadoresYAsistidores(misJugadores, 3);

    final appState = Provider.of<AppState>(context);
    final jugadores = appState.jugadores;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            GrupoInfoWidget(tipoRank: 'Goleadores'),
            for (var jugador in topGoleadores)
              JugadorInfoWidget(
                  jugador: jugador, puntuacion: jugador.estadisticas.goles),
            buildBotonVerTodos(),
            GrupoInfoWidget(tipoRank: 'Asistencias'),
            for (var jugador in topAsistidores)
              JugadorInfoWidget(
                  jugador: jugador,
                  puntuacion: jugador.estadisticas.asistencias),
            buildBotonVerTodos(),
            GrupoInfoWidget(tipoRank: 'Goleadores + Asistencias'),
            for (var jugador in topGoleadoresYAsistidores)
              JugadorInfoWidget(
                  jugador: jugador,
                  puntuacion: (jugador.estadisticas.goles +
                      jugador.estadisticas.asistencias)),
            buildBotonVerTodos(),
          ],
        ),
      ),
    );
  }
}

Widget buildBotonVerTodos() {
  return InkWell(
    onTap: () {},
    child: Container(
      height: 40,
      child: Align(
        alignment: Alignment.center,
        child: Text(
          'Ver todos',
          style: TextStyle(
            fontFamily: 'Urbanist',
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Color(0xff000000),
          ),
        ),
      ),
    ),
  );
}

class JugadorInfoWidget extends StatelessWidget {
  final Jugador jugador;
  final int puntuacion;

  JugadorInfoWidget({required this.jugador, required this.puntuacion});

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);

    return Container(
      height: 65,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Color(0xffcccccc),
          ),
        ),
      ),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            width: 25,
            height: 25,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.network(
                jugador.imagenURL,
                width: 25,
                height: 25,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            child: Container(
              height: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    jugador.nombre,
                    style: TextStyle(
                      fontFamily: 'Urbanist',
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff000000),
                    ),
                  ),
                  Text(
                    jugador.equipo?.nombreEquipo ?? 'Equipo no encontrado',
                    style: TextStyle(
                      fontFamily: 'Urbanist',
                      fontSize: 8,
                      fontWeight: FontWeight.w400,
                      height: 1.5,
                      color: Color(0xff000000),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              puntuacion.toString(),
              style: TextStyle(
                fontFamily: 'Urbanist',
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: Color(0xff000000),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class GrupoInfoWidget extends StatelessWidget {
  final String tipoRank;

  GrupoInfoWidget({required this.tipoRank});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 7, 20, 7),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color(0xff015c1a),
      ),
      child: Text(
        tipoRank,
        style: TextStyle(
          fontFamily: 'Urbanist',
          fontSize: 13,
          fontWeight: FontWeight.w600,
          height: 1.5,
          color: Color(0xffffffff),
        ),
      ),
    );
  }
}
