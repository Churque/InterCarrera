import 'package:flutter/material.dart';
import 'package:kdksdkskdxd/app/widgets/JugadorWidget.dart';
import 'package:kdksdkskdxd/app/widgets/NavBarJugadoresEquipo.dart';
import 'package:kdksdkskdxd/app/widgets/match_info.dart';
import 'package:kdksdkskdxd/entities/equipo.dart';
import 'package:kdksdkskdxd/entities/equipo_estadisticas.dart';
import 'package:kdksdkskdxd/entities/jugador.dart';

class MyInfoPartidoPage extends StatefulWidget {
  const MyInfoPartidoPage();

  @override
  _MyInfoPartidoPage createState() => _MyInfoPartidoPage();
}

class _MyInfoPartidoPage extends State<MyInfoPartidoPage> {
  Jugador miJugador = Jugador(
      nombre: 'Lionel Messi',
      // imagenURL:
      //    'https://preview.redd.it/arturo-vidal-v0-d7zwvhnwokbb1.jpg?width=640&crop=smart&auto=webp&s=44bb726ba2d2c56fe7988d71006e436ceec67a44',
      equipo: Equipo(
        posicion: 1,
        nombreEquipo: 'FC Barcelona',
        imagenURL:
            'https://assets.stickpng.com/images/584a9b3bb080d7616d298777.png',
        estadisticas: EquipoEstadisticas(
            pts: 9, pj: 3, pg: 3, pe: 0, pp: 0, difGoles: "+6"),
        jugadores: [],
      ),
      goles: 8,
      numCamiseta: 13);

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
            _buildMatchInfoRow(),
            _buildRecentResults(),
            tituloJugadores(),
            NavBarJugadoresEquipo(),
            JugadorWidget(
              nombre: 'Lionel messi',
              imagenURL:
                  'https://preview.redd.it/arturo-vidal-v0-d7zwvhnwokbb1.jpg?width=640&crop=smart&auto=webp&s=44bb726ba2d2c56fe7988d71006e436ceec67a44',
              numCamiseta: 10,
            ),
            containerJugador(),
            containerJugador(),
            containerJugador(),
          ],
        ),
      ),
    );
  }

  Widget containerJugador() {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(30, 6.5, 29.5, 6.5),
            width: double.infinity,
            height: 55,
            decoration: BoxDecoration(
              border: Border.all(color: Color(0xffd9d9d9)),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: double.infinity,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 15, 0),
                        width: 42,
                        height: 42,
                        decoration: BoxDecoration(
                          shape: BoxShape
                              .circle, // Cambiado a BoxShape.circle para hacer un círculo
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                                'https://preview.redd.it/arturo-vidal-v0-d7zwvhnwokbb1.jpg?width=640&crop=smart&auto=webp&s=44bb726ba2d2c56fe7988d71006e436ceec67a44'), // Reemplaza con la URL de tu imagen
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Ciro inmobile',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          height: 1.5,
                          color: Color(0xff000000),
                        ),
                      ),
                    ],
                  ),
                ),
                Spacer(), // Agregado Spacer para empujar el número "17" a la derecha
                Container(
                  margin: EdgeInsets.fromLTRB(0, 1, 0, 0),
                  child: Text(
                    '17',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 16,
                      fontWeight: FontWeight.w900,
                      height: 1.2125,
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

  Widget tituloJugadoresEquipo() {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
      width: double.infinity,
      height: 53,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                // Lógica para manejar el clic en Villareal CF
                print('Clic en Villareal CF');
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                height: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xffd9d9d9)),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 10),
                      width: 27,
                      height: 27,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              'https://assets.stickpng.com/images/584a9b57b080d7616d298779.png'),
                        ),
                      ),
                    ),
                    Text(
                      'VILLAREAL CF',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        height: 1.5,
                        color: Color(0xff000000),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                // Lógica para manejar el clic en Girona FC
                print('Clic en Girona FC');
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                height: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xffd9d9d9)),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'GIRONA FC',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        height: 1.5,
                        color: Color(0xff000000),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 10),
                      width: 27,
                      height: 27,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              'https://upload.wikimedia.org/wikipedia/en/7/7a/Girona_FC_new_logo.png'),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget tituloJugadores() {
    return Container(
      width: double.infinity,
      height: 54,
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xffd9d9d9)),
        color: Color(0xffffffff),
      ),
      child: Center(
        child: Text(
          'Jugadores',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'Inter',
            fontSize: 16,
            fontWeight: FontWeight.w900,
            height: 1.2125,
            color: Color(0xff000000),
          ),
        ),
      ),
    );
  }

  Widget _buildMatchInfoRow() {
    return Container(
      padding: EdgeInsets.all(15),
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xffcccccc)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MatchInfoRow(),
        ],
      ),
    );
  }

  Widget _buildRecentResults() {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 24, 20, 34),
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xffcccccc)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 50),
            child: Text(
              'Resultados Recientes',
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 16,
                fontWeight: FontWeight.w900,
                color: Color(0xff000000),
              ),
            ),
          ),
          Container(
            width: double.infinity,
            height: 60,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TeamResults(),
                TeamResultsRight(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class TeamResults extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(10, 0, 128, 0),
      width: 110,
      height: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(0, 0, 34, 10),
            width: double.infinity,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(0, 1, 10, 0),
                  child: Text(
                    'Vil',
                    style: TextStyle(
                      fontFamily: 'Inter',
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
                      image: NetworkImage(
                          'https://upload.wikimedia.org/wikipedia/en/thumb/b/b9/Villarreal_CF_logo-en.svg/1200px-Villarreal_CF_logo-en.svg.png'),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            height: 21,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 5, 0),
                  width: 85,
                  height: double.infinity,
                  child: Stack(
                    children: List.generate(5, (index) {
                      return Positioned(
                        left: 16 *
                            index
                                .toDouble(), // Ajusta este valor para el espaciado horizontal
                        top: 0,
                        child: Container(
                          width: 21,
                          height: 21,
                          decoration: BoxDecoration(
                            color: index % 2 == 0
                                ? Color(0xffff0000)
                                : Color(0xff00d92f),
                            borderRadius: BorderRadius.circular(10.5),
                          ),
                          child: Center(
                            child: Text(
                              index % 2 == 0 ? 'P' : 'G',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'Inter',
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
}

class TeamResultsRight extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      // frame80abq (117:375)
      width: 100,
      height: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(32, 0, 0, 10),
            width: double.infinity,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(0, 1, 10, 0),
                  child: Text(
                    'Gir',
                    style: TextStyle(
                      fontFamily: 'Inter',
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
                    'https://static.wikia.nocookie.net/fifa/images/5/5d/Girona_FC.png/revision/latest?cb=20161228190707',
                    width: 29,
                    height: 29,
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            height: 21,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 5, 0),
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
                    children: List.generate(5, (index) {
                      return Positioned(
                        left: 16 *
                            index
                                .toDouble(), // Ajusta este valor para el espaciado horizontal
                        top: 0,
                        child: Container(
                          width: 21,
                          height: 21,
                          decoration: BoxDecoration(
                            color: index % 2 == 0
                                ? Color(0xffff0000)
                                : Color(0xff00d92f),
                            borderRadius: BorderRadius.circular(10.5),
                          ),
                          child: Center(
                            child: Text(
                              index % 2 == 0 ? 'P' : 'G',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'Inter',
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
