import 'package:flutter/material.dart';
import 'package:kdksdkskdxd/app/widgets/BottomNavigationBar.dart';
import 'package:kdksdkskdxd/app/widgets/equipo_info.dart';
import 'package:kdksdkskdxd/entities/equipo.dart';
import 'package:kdksdkskdxd/entities/equipo_estadisticas.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  int _selectedIndexPage = 1;

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
            GrupoInfoWidget(groupName: 'GRUPO A'),
            EquipoInfoWidget(
              equipo: Equipo(
                posicion: 1,
                nombreEquipo: 'FC Barcelona',
                imagenURL:
                    'https://assets.stickpng.com/images/584a9b3bb080d7616d298777.png',
                estadisticas: EquipoEstadisticas(
                    pts: 9, pj: 3, pg: 3, pe: 0, pp: 0, difGoles: "+6"),
                jugadores: [],
              ),
            ),
            EquipoInfoWidget(
              equipo: Equipo(
                posicion: 1,
                nombreEquipo: 'FC Barcelona',
                imagenURL:
                    'https://assets.stickpng.com/images/584a9b3bb080d7616d298777.png',
                estadisticas: EquipoEstadisticas(
                    pts: 9, pj: 3, pg: 3, pe: 0, pp: 0, difGoles: "+6"),
                jugadores: [],
              ),
            ),
            EquipoInfoWidget(
              equipo: Equipo(
                posicion: 1,
                nombreEquipo: 'FC Barcelona',
                imagenURL:
                    'https://assets.stickpng.com/images/584a9b3bb080d7616d298777.png',
                estadisticas: EquipoEstadisticas(
                    pts: 9, pj: 3, pg: 3, pe: 0, pp: 0, difGoles: "+6"),
                jugadores: [],
              ),
            ),
            EquipoInfoWidget(
              equipo: Equipo(
                posicion: 1,
                nombreEquipo: 'FC Barcelona',
                imagenURL:
                    'https://assets.stickpng.com/images/584a9b3bb080d7616d298777.png',
                estadisticas: EquipoEstadisticas(
                    pts: 9, pj: 3, pg: 3, pe: 0, pp: 0, difGoles: "+6"),
                jugadores: [],
              ),
            ),
            GrupoInfoWidget(groupName: 'GRUPO B'),
            GrupoInfoWidget(groupName: 'GRUPO C'),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        selectedIndex: _selectedIndexPage,
        onItemTapped: _onItemTapped,
      ),
    );
  }

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
}

class GrupoInfoWidget extends StatelessWidget {
  final String groupName;

  GrupoInfoWidget({required this.groupName});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(32.5, 8.5, 12.5, 8.5),
      width: double.infinity,
      height: 37,
      decoration: BoxDecoration(
        color: Color(0xff015c1a),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(0, 0, 101, 0),
            child: Text(
              groupName,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 13,
                fontWeight: FontWeight.w400,
                height: 1.5,
                color: Colors.white,
              ),
            ),
          ),
          Container(
            height: double.infinity,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(
                    left: 15,
                  ),
                  child: Text(
                    'PTS',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Container(
                  margin: EdgeInsets.only(
                    right: 0,
                  ),
                  child: Text(
                    'PJ',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Container(
                  margin: EdgeInsets.only(
                    right: 0,
                  ),
                  child: Text(
                    'PG',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Container(
                  margin: EdgeInsets.only(
                    right: 0,
                  ),
                  child: Text(
                    'PE',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Container(
                  margin: EdgeInsets.only(
                    right: 0,
                  ),
                  child: Text(
                    'PP',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Container(
                  margin: EdgeInsets.only(
                    left: 0,
                  ),
                  child: Text(
                    'DG',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
