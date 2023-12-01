import 'package:flutter/material.dart';
import 'package:kdksdkskdxd/app/widgets/BottomNavigationBar.dart';
import 'package:kdksdkskdxd/app/widgets/partido_info.dart';
import 'package:kdksdkskdxd/entities/equipo.dart';
import 'package:kdksdkskdxd/entities/equipo_estadisticas.dart';
import 'package:kdksdkskdxd/entities/partido.dart';

class MyHomePage extends StatefulWidget {
  //const MyHomePage();
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndexDay = 0;
  int _selectedIndexPage = 0;
  final List<String> days = ["Ayer", "Hoy", "Mañana"];

  void _onDayTapped(int index) {
    setState(() {
      _selectedIndexDay = index;
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndexPage = index;
      if (index == 0) {
        Navigator.pushNamed(context, '/');
      }
      if (index == 1) {
        // Si se hace clic en "Clasificación", navega a la página de clasificación
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
            buildDayTabs(),
            buildPartidosSection(),
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

  Widget buildPartidosSection() {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.all(9),
          width: double.infinity,
          height: 36,
          child: Center(
            child: Text(
              'Partidos',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400,
                color: Color(0xff000000),
              ),
            ),
          ),
        ),
        Container(
          width: double.infinity,
          height: 26,
          decoration: BoxDecoration(
            color: Color(0xffd9d9d9),
          ),
          child: Center(
            child: Text(
              'Lunes 25 SEP. 2023',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: Color(0xff000000),
              ),
            ),
          ),
        ),
        Column(
          children: misPartidos
              .map((partido) => PartidoInfo(partido: partido))
              .toList(),
        ),
      ],
    );
  }

  Widget buildDayTabs() {
    return Container(
      height: 37,
      child: Row(
        children: [
          for (var i = 0; i < days.length; i++)
            InkWell(
              onTap: () {
                _onDayTapped(i);
              },
              child: Container(
                width: MediaQuery.of(context).size.width / 3,
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: i == _selectedIndexDay
                          ? Colors.green
                          : Colors.transparent,
                      width: 2.0,
                    ),
                  ),
                ),
                child: Center(
                  child: Text(
                    days[i],
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
