import 'package:flutter/material.dart';
import 'package:kdksdkskdxd/app/widgets/BottomNavigationBar.dart';
import 'package:kdksdkskdxd/entities/equipo.dart';
import 'package:kdksdkskdxd/entities/equipo_estadisticas.dart';
import 'package:kdksdkskdxd/entities/jugador.dart';

class MyRankingPage extends StatefulWidget {
  const MyRankingPage();

  @override
  _MyRankingState createState() => _MyRankingState();
}

class _MyRankingState extends State<MyRankingPage> {
  int _selectedIndexPage = 3;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndexPage = index;
      if (index == 0) {
        Navigator.pushNamed(context, '/');
      }
      if (index == 1) {
        Navigator.pushNamed(context, '/clasificacion');
      }
      if (index == 2) {
        Navigator.pushNamed(context, '/favoritos');
      }
      if (index == 3) {
        Navigator.pushNamed(context, '/ranking');
      }
    });
  }

  Jugador miJugador = Jugador(
      nombre: 'Lionel Messi',
      equipo: Equipo(
        posicion: 1,
        nombreEquipo: 'FC asdasdasd',
        imagenURL:
            'https://assets.stickpng.com/images/584a9b3bb080d7616d298777.png',
        estadisticas: EquipoEstadisticas(
            pts: 9, pj: 3, pg: 3, pe: 0, pp: 0, difGoles: "+6"),
        jugadores: [],
      ),
      goles: 8,
      numCamiseta: 10);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "InterCarrera",
          style: TextStyle(fontSize: 16, color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            GrupoInfoWidget(tipoRank: 'Goleadores'),
            JugadorInfoWidget(jugador: miJugador),
            JugadorInfoWidget(jugador: miJugador),
            JugadorInfoWidget(jugador: miJugador),
            buildBotonVerTodos(),
            GrupoInfoWidget(tipoRank: 'Asistencias'),
            JugadorInfoWidget(jugador: miJugador),
            JugadorInfoWidget(jugador: miJugador),
            JugadorInfoWidget(jugador: miJugador),
            buildBotonVerTodos(),
            GrupoInfoWidget(tipoRank: 'Goleadores + Asistencias'),
            JugadorInfoWidget(jugador: miJugador),
            JugadorInfoWidget(jugador: miJugador),
            JugadorInfoWidget(jugador: miJugador),
            buildBotonVerTodos(),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        selectedIndex: _selectedIndexPage,
        onItemTapped: _onItemTapped,
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
            fontFamily: 'Poppins',
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

  JugadorInfoWidget({required this.jugador});

  @override
  Widget build(BuildContext context) {
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
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Color(0xffd9d9d9),
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
                        fontFamily: 'Poppins',
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff000000),
                      ),
                    ),
                    Text(
                      'asdasdasd',
                      style: TextStyle(
                        fontFamily: 'Poppins',
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
                jugador.goles.toString(),
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: Color(0xff000000),
                ),
              ),
            ),
          ],
        ));
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
          fontFamily: 'Poppins',
          fontSize: 13,
          fontWeight: FontWeight.w600,
          height: 1.5,
          color: Color(0xffffffff),
        ),
      ),
    );
  }
}
