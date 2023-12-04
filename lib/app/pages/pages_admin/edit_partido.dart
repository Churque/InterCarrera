import 'package:flutter/material.dart';
import 'package:kdksdkskdxd/app/widgets/NavBarJugadoresEquipo.dart';
import 'package:kdksdkskdxd/app/widgets/match_info.dart';
import 'package:kdksdkskdxd/entities/equipo.dart';
import 'package:kdksdkskdxd/entities/jugador.dart';
import 'package:kdksdkskdxd/entities/partido.dart';

class MyEditPartidoPage extends StatefulWidget {
  const MyEditPartidoPage({required this.partido});

  final Partido partido;

  @override
  _MyEditPartidoPage createState() => _MyEditPartidoPage();
}

class _MyEditPartidoPage extends State<MyEditPartidoPage> {
  late Partido partido;
  List<Jugador> jugadores = [];
  Map<String, int> itemCounts = {};

  @override
  void initState() {
    super.initState();
    partido = widget.partido;
    jugadores = partido.local.jugadores;
    itemCounts = Map.fromIterable(jugadores,
        key: (jugador) => _getKey(jugador), value: (_) => 0);
  }

  String _getKey(Jugador jugador) {
    return '${jugador.id}-${jugador.equipoID}';
  }

  void updateJugadores(Equipo equipo) {
    setState(() {
      jugadores = equipo.jugadores;
      for (var jugador in jugadores) {
        final key = _getKey(jugador);
        itemCounts.putIfAbsent(key, () => 0);
      }
    });
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
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        _buildMatchInfoRow(partido),
        buildOpcionesDeAgregar(),
        NavBarJugadoresEquipo(
          equipoLocal: partido.local,
          equipoVisita: partido.visita,
          onEquipoTapped: updateJugadores,
        ),
        for (var i = 0; i < jugadores.length; i++) buildJugadores(i),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          width: double.infinity,
          child: Column(
            children: [
              buildSaveEditPartido(),
              SizedBox(height: 14),
              buildDeletePartido(),
            ],
          ),
        ),
      ])),
    );
  }

  Widget buildDeletePartido() {
    return Container(
      width: double.infinity,
      height: 55,
      decoration: BoxDecoration(
        color: Color(0xffd9d9d9),
        borderRadius: BorderRadius.circular(52),
      ),
      child: Center(
        child: Text(
          'Eliminar Partido',
          style: TextStyle(
            fontFamily: 'Urbanist',
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Color(0xff000000),
          ),
        ),
      ),
    );
  }

  Widget buildSaveEditPartido() {
    return Container(
      width: double.infinity,
      height: 55,
      decoration: BoxDecoration(
        color: Color(0xff015c1a),
        borderRadius: BorderRadius.circular(52),
      ),
      child: Center(
        child: Text(
          'Actualizar  Partido',
          style: TextStyle(
            fontFamily: 'Urbanist',
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Color(0xffffffff),
          ),
        ),
      ),
    );
  }

  Widget buildOpcionesDeAgregar() {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 15, 10, 15),
      width: double.infinity,
      height: 75,
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xffd9d9d9)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 163,
            height: double.infinity,
            decoration: BoxDecoration(
              color: Color(0xff015c1a),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Center(
              child: Text(
                'Agregar gol',
                style: TextStyle(
                  fontFamily: 'Urbanist',
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  height: 1.5,
                  color: Color(0xffffffff),
                ),
              ),
            ),
          ),
          SizedBox(width: 20), // Espaciado entre los containers
          Container(
            width: 163,
            height: double.infinity,
            decoration: BoxDecoration(
              color: Color(0xffd9d9d9),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Center(
              child: Text(
                'Agregar Asistencia',
                style: TextStyle(
                  fontFamily: 'Urbanist',
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  height: 1.5,
                  color: Color(0xff000000),
                ),
              ),
            ),
          ),
        ],
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

  Widget buildJugadores(int index) {
    final jugador = jugadores[index];

    return Container(
      padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
      width: double.infinity,
      height: 75,
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xffd9d9d9)),
      ),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(0, 0, 8, 0),
            height: double.infinity,
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 15, 0),
                  width: 42,
                  height: 42,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(21),
                    color: Color(0xffd9d9d9),
                  ),
                  child: Image.network(
                    jugador.imagenURL,
                    width: 42,
                    height: 42,
                    fit: BoxFit
                        .cover, // Puedes ajustar esto según tus necesidades
                  ),
                ),
                Text(
                  jugador.nombre,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff000000),
                  ),
                ),
              ],
            ),
          ),
          Text(
            jugador.numCamiseta.toString(),
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 18,
              fontWeight: FontWeight.w900,
              color: Color(0xff000000),
            ),
          ),
          Spacer(),
          buildCounterRow(index),
        ],
      ),
    );
  }

  Widget buildCounterRow(int index) {
    final jugador = jugadores[index];
    final key = _getKey(jugador);
    final itemCount = itemCounts[key];

    return Container(
      margin: EdgeInsets.only(right: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
            onTap: () {
              setState(() {
                if (itemCounts[key]! > 0) {
                  itemCounts[key] = itemCounts[key]! - 1;
                  partido.actualizarGolesEquipo(jugadores[index].equipoID, -1);
                }
              });
            },
            child: Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Color(0xff015c1a),
                  width: 2,
                ),
              ),
              child: Center(
                child: Icon(
                  Icons.remove,
                  size: 20,
                  color: Color(0xff015c1a),
                ),
              ),
            ),
          ),
          SizedBox(width: 10),
          Text(
            '$itemCount',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 16,
              fontWeight: FontWeight.w600,
              height: 1.5,
              color: Color(0xFF000000),
            ),
          ),
          SizedBox(width: 10),
          InkWell(
            onTap: () {
              setState(() {
                itemCounts[key] = itemCounts[key]! + 1;
                partido.actualizarGolesEquipo(jugadores[index].equipoID, 1);
              });
            },
            child: Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xff015c1a),
              ),
              child: Center(
                child: Icon(
                  Icons.add,
                  size: 20,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
