import 'package:flutter/material.dart';
import 'package:kdksdkskdxd/app/widgets/equipo_info.dart';
import 'package:kdksdkskdxd/entities/equipo.dart';
import 'package:kdksdkskdxd/entities/grupo.dart';

class MyClasificationPage extends StatefulWidget {
  //const MyClasificationPage({super.key});
  const MyClasificationPage({Key? key}) : super(key: key);

  @override
  State<MyClasificationPage> createState() => _MyClasificationPage();
}

class _MyClasificationPage extends State<MyClasificationPage> {
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
            Column(
              children: [
                for (var grupo in tusGrupos) GrupoWidget(grupo: grupo),
              ],
            )
          ],
        ),
      ),
      /*
      bottomNavigationBar: CustomBottomNavigationBar(
        selectedIndex: _selectedIndexPage,
        onItemTapped: _onItemTapped,
      ),
      */
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

class GrupoWidget extends StatelessWidget {
  final Grupo grupo;

  const GrupoWidget({required this.grupo});

  @override
  Widget build(BuildContext context) {
    grupo.equipos.sort();

    List<Equipo> equiposOrdenados = List.from(grupo.equipos);
    equiposOrdenados.sort();

    for (int i = 0; i < equiposOrdenados.length; i++) {
      equiposOrdenados[i].posicion = i + 1;
    }
    return Column(
      children: [
        GrupoInfoWidget(groupName: grupo.nombre),
        for (var equipo in grupo.equipos) EquipoInfoWidget(equipo: equipo),
      ],
    );
  }
}

class GrupoInfoWidget extends StatelessWidget {
  final String groupName;

  GrupoInfoWidget({required this.groupName});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 30),
      width: double.infinity,
      height: 37,
      decoration: BoxDecoration(
        color: Color(0xff015c1a),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(0, 0, 101, 0),
            child: Text(
              groupName,
              style: TextStyle(
                fontFamily: 'Urbanist',
                fontSize: 13,
                fontWeight: FontWeight.w400,
                height: 1.5,
                color: Colors.white,
              ),
            ),
          ),
          Container(
            child: Row(
              children: [
                Container(
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
                SizedBox(width: 14),
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
