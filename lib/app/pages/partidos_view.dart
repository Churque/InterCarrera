import 'dart:async';
import 'package:flutter/material.dart';
import 'package:kdksdkskdxd/app/widgets/partido_info.dart';
import 'package:kdksdkskdxd/entities/partido.dart';

class MyHomePage extends StatefulWidget {
  //const MyHomePage();
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndexDay = 1;
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
    Timer.periodic(Duration(seconds: 1), (Timer timer) {
      setState(() {
        now = DateTime.now();
      });
    });
    now = DateTime.now();
  }

  List<Partido> getPartidosFiltrados(String type) {
    //filtrar partidos según la fecha
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
    } else if (type == 'mañana') {
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            buildDayTabs(),
            buildPartidosSection(),
          ],
        ),
      ),
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
                fontFamily: 'Urbanist',
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
                fontFamily: 'Urbanist',
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: Color(0xff000000),
              ),
            ),
          ),
        ),
        Column(
          children: [
            for (var partido
                in getPartidosFiltrados(days[_selectedIndexDay].toLowerCase())
                  ..sort((a, b) => a.fecha.compareTo(b.fecha)))
              PartidoInfo(partido: partido),
          ].reversed.toList(),
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
                      fontFamily: 'Urbanist',
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
