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
            VerTodosWidget(),
            GrupoInfoWidget(tipoRank: 'Asistencias'),
            JugadorInfoWidget(jugador: miJugador),
            JugadorInfoWidget(jugador: miJugador),
            JugadorInfoWidget(jugador: miJugador),
            VerTodosWidget(),
            GrupoInfoWidget(tipoRank: 'Goleadores + Asistencias'),
            JugadorInfoWidget(jugador: miJugador),
            JugadorInfoWidget(jugador: miJugador),
            JugadorInfoWidget(jugador: miJugador),
            VerTodosWidget(),
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

class VerTodosWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Acción a realizar al hacer clic en "Ver todos"
        // Puedes definir una función para manejar la acción que desees aquí
      },
      child: Container(
        margin: EdgeInsets.fromLTRB(0, 0, 0, 15),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        child: Text(
          'Ver todos',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 14,
            fontWeight: FontWeight.w600,
            height: 1.5,
            color: Color(0xff000000),
          ),
        ),
      ),
    );
  }
}

class JugadorInfoWidget extends StatelessWidget {
  final Jugador jugador;

  JugadorInfoWidget({required this.jugador});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(21, 14.5, 21, 14.5),
            width: double.infinity,
            height: 65,
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Color(0xffcccccc),
                ),
              ),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 20, 0),
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Color(0xffd9d9d9),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 20, 0),
                  height: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        jugador.nombre,
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          height: 1.5,
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
                Container(
                  margin: EdgeInsets.only(left: 175),
                  height: double.infinity,
                  child: Text(
                    jugador.goles.toString(),
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      height: 1.5,
                      color: Color(0xff000000),
                    ),
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
