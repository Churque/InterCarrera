import 'dart:async';

import 'package:flutter/material.dart';
import 'package:kdksdkskdxd/app/pages/add_team_page.dart';
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
  int _selectedIndexDay = 1;
  int _selectedIndexPage = 0;
  late DateTime now;

  final List<String> months = [
    'Enero',
    'Febrero',
    'Marzo',
    'Abril',
    'Mayo',
    'Junio',
    'Julio',
    'Agosto',
    'Septiembre',
    'Octubre',
    'Noviembre',
    'Diciembre',
  ];

  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(minutes: 1), (Timer timer) {
      setState(() {
        // Actualizar la fecha actual
        now = DateTime.now();
      });
    });

    // Obtener la fecha actual al inicio
    now = DateTime.now();
  }

  List<Partido> getPartidosFiltrados(String type) {
    // Filtrar partidos según la fecha actual
    if (type == 'hoy') {
      return misPartidos
          .where((partido) =>
              partido.fecha.day == now.day &&
              partido.fecha.month == now.month &&
              partido.fecha.year == now.year)
          .toList();
    } else if (type == 'ayer') {
      final yesterday = now.subtract(Duration(days: 1));
      return misPartidos
          .where((partido) =>
              partido.fecha.day == yesterday.day &&
              partido.fecha.month == yesterday.month &&
              partido.fecha.year == yesterday.year)
          .toList();
    } else if (type == 'manana') {
      final tomorrow = now.add(Duration(days: 1));
      return misPartidos
          .where((partido) =>
              partido.fecha.day == tomorrow.day &&
              partido.fecha.month == tomorrow.month &&
              partido.fecha.year == tomorrow.year)
          .toList();
    }
    return [];
  }

  String getFormattedDate(DateTime date) {
    final daysOfWeek = [
      'Lunes',
      'Martes',
      'Miércoles',
      'Jueves',
      'Viernes',
      'Sábado',
      'Domingo'
    ];
    final months = [
      'ENE',
      'FEB',
      'MAR',
      'ABR',
      'MAY',
      'JUN',
      'JUL',
      'AGO',
      'SEP',
      'OCT',
      'NOV',
      'DIC'
    ];
    return '${daysOfWeek[date.weekday - 1]} ${date.day} ${months[date.month - 1]}. ${date.year}';
  }

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

  DateTime getSelectedDate() {
    if (_selectedIndexDay == 0) {
      return now.subtract(Duration(days: 1));
    } else if (_selectedIndexDay == 1) {
      return now;
    } else {
      return now.add(Duration(days: 1));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "InterCarrera",
          style: TextStyle(fontSize: 16, color: Colors.white),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              // Navegar a la pantalla de añadir equipo
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AnadirEquipo()),
              );
            },
          ),
        ],
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
              getFormattedDate(getSelectedDate()),
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: Color(0xff000000),
              ),
            ),
          ),
        ),
        Column(
          children: getPartidosFiltrados(days[_selectedIndexDay].toLowerCase())
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
