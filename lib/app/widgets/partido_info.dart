import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kdksdkskdxd/app/pages/info_partido_view.dart';
import 'package:kdksdkskdxd/entities/equipo.dart';
import 'package:kdksdkskdxd/entities/partido.dart';

import 'dart:async';

class PartidoInfo extends StatefulWidget {
  final Partido partido;

  PartidoInfo({required this.partido});

  @override
  _PartidoInfoState createState() => _PartidoInfoState();
}

class _PartidoInfoState extends State<PartidoInfo> {
  late bool partidoEnCurso;

  @override
  void initState() {
    super.initState();
    partidoEnCurso =
        widget.partido.live || DateTime.now().isAfter(widget.partido.fecha);
    _startTimer();
  }

  void _startTimer() {
    const oneMinute = Duration(seconds: 5);
    Timer.periodic(oneMinute, (timer) {
      setState(() {
        widget.partido.live = DateTime.now().isAfter(widget.partido.fecha);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MyInfoPartidoPage(partido: widget.partido),
          ),
        );
      },
      child: Container(
        width: double.infinity,
        height: 139,
        decoration: BoxDecoration(
          border: Border.all(color: Color(0xffcccccc)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildEquipoContainer(widget.partido.local),
            SizedBox(width: 40.5),
            widget.partido.live
                ? _buildPartidoEnVivo(widget.partido.fecha)
                : _buildHoraCanchaContainer(
                    widget.partido.fecha, widget.partido.cancha),
            SizedBox(width: 40.5),
            _buildEquipoContainer(widget.partido.visita),
          ],
        ),
      ),
    );
  }

  Widget _buildEquipoContainer(Equipo equipo) {
    return Container(
      //margin: EdgeInsets.only(right: 10),
      width: 80,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(equipo.imagenURL),
              ),
            ),
          ),
          SizedBox(height: 5),
          Text(
            equipo.nombreEquipo,
            style: TextStyle(
              fontFamily: 'Urbanist',
              fontSize: 10,
              fontWeight: FontWeight.w400,
              color: Color(0xff000000),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPartidoEnVivo(DateTime fechaInicio) {
    Duration tiempoTranscurrido = DateTime.now().difference(fechaInicio);
    int minutosTranscurridos = tiempoTranscurrido.inMinutes;

    int tiempoT = minutosTranscurridos ~/ 25;
    //int minutosRestantes = minutosTranscurridos % 45;

    String tiempo = ' ${tiempoT + 1}T $minutosTranscurridos’';
    return Container(
      width: 100,
      height: double.infinity,
      margin: EdgeInsets.only(bottom: 30),
      decoration: BoxDecoration(
        color: Color(0xffffffff),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            tiempo,
            textAlign: TextAlign.start,
            style: TextStyle(
              fontFamily: 'Urbanist',
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: Color(0xff000000),
            ),
          ),
          SizedBox(height: 10),
          Container(
            width: double.infinity,
            height: 50,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 45,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    color: Color(0xff015c1a),
                  ),
                  child: Center(
                    child: Text(
                      '0',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Urbanist',
                        fontSize: 24,
                        fontWeight: FontWeight.w400,
                        color: Color(0xffffffff),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 5),
                Container(
                  width: 45,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    color: Color(0xff015c1a),
                  ),
                  child: Center(
                    child: Text(
                      '0',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Urbanist',
                        fontSize: 24,
                        fontWeight: FontWeight.w400,
                        color: Color(0xffffffff),
                      ),
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

  Widget _buildHoraCanchaContainer(DateTime time, String cancha) {
    String formattedTime = DateFormat.Hm().format(time);

    return Container(
      width: 100,
      height: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 20),
            child: Text(
              formattedTime,
              style: TextStyle(
                fontFamily: 'Urbanist',
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: Color(0xff000000),
              ),
            ),
          ),
          Text(
            cancha,
            style: TextStyle(
              fontFamily: 'Urbanist',
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: Color(0xff015c1a),
            ),
          ),
        ],
      ),
    );
  }
}
