import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kdksdkskdxd/app/widgets/Estado_Partido.dart';
import 'package:kdksdkskdxd/entities/partido.dart';

class MatchInfoRow extends StatefulWidget {
  final Partido partido;

  MatchInfoRow({required this.partido});

  @override
  _MatchInfoRowState createState() => _MatchInfoRowState();
}

class _MatchInfoRowState extends State<MatchInfoRow> {
  late bool partidoEnCurso;
  late Timer _timer;
  late Partido partido;

  @override
  void initState() {
    super.initState();
    //widget.partido.live = DateTime.now().isAfter(widget.partido.fecha);
    partido = widget.partido;
    _timer = _startTimer();
  }

  Timer _startTimer() {
    const oneMinute = Duration(seconds: 5);
    return Timer.periodic(oneMinute, (timer) {
      setState(() {
        widget.partido.live = DateTime.now().isAfter(widget.partido.fecha);
        Duration tiempoTranscurrido =
            DateTime.now().difference(widget.partido.fecha);
        int minutosTranscurridos = tiempoTranscurrido.inMinutes;

        if (minutosTranscurridos >= 50) {
          widget.partido.live = false;
          widget.partido.finalizado = true;
          timer.cancel();
        }
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _MatchInfoCard(
          image: widget.partido.local.imagenURL,
          teamName: widget.partido.local.nombreEquipo,
        ),
        _buildEstadoPartido(widget.partido),
        _MatchInfoCard(
          image: widget.partido.visita.imagenURL,
          teamName: widget.partido.visita.nombreEquipo,
        ),
      ],
    );
  }
/*
  Widget _buildEstadoPartido() {
    if (partido.finalizado) {
      return buildPartidoFinalizado();
    } else if (partido.live) {
      return _buildPartidoEnVivo(partido.fecha);
    } else {
      return _MatchTimeAndLocation(
          time: partido.fecha,
          location: partido.cancha,
          partido: widget.partido);
    }
  }
*/

  Widget _buildEstadoPartido(Partido partido) {
    if (partido.finalizado) {
      return PartidoWidgets.buildPartidoFinalizado(partido);
    } else if (partido.live) {
      return PartidoWidgets.buildPartidoEnVivo(partido);
    } else {
      return PartidoWidgets.buildHoraCanchaContainer(
          partido.fecha, partido.cancha);
    }
  }

  Widget _buildPartidoEnVivo(DateTime fechaInicio) {
    Duration tiempoTranscurrido = DateTime.now().difference(fechaInicio);
    int minutosTranscurridos = tiempoTranscurrido.inMinutes;

    int tiempoT = minutosTranscurridos ~/ 25;
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
                      partido.golesLocal.toString(),
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
                      partido.golesVisita.toString(),
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

  Widget buildPartidoFinalizado() {
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
            'Final',
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
                    color: Color(0xffd9d9d9),
                  ),
                  child: Center(
                    child: Text(
                      partido.golesLocal.toString(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Urbanist',
                        fontSize: 24,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff000000),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 5),
                Container(
                  width: 45,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    color: Color(0xffd9d9d9),
                  ),
                  child: Center(
                    child: Text(
                      partido.golesVisita.toString(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Urbanist',
                        fontSize: 24,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff000000),
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

/*
  Widget partidoinfocard(){

  }
  */
}

class _MatchInfoCard extends StatelessWidget {
  final String image;
  final String teamName;

  _MatchInfoCard({required this.image, required this.teamName});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 10),
            width: 60,
            height: 75,
            child: Image.network(
              image,
              width: 60,
              height: 75,
            ),
          ),
          Text(
            teamName,
            style: TextStyle(
              fontFamily: 'Urbanist',
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: Color(0xff000000),
            ),
          ),
        ],
      ),
    );
  }
}

class _MatchTimeAndLocation extends StatelessWidget {
  final DateTime time;
  final String location;
  final Partido partido;

  _MatchTimeAndLocation({
    required this.time,
    required this.location,
    required this.partido,
  });

  @override
  Widget build(BuildContext context) {
    String formattedTime = DateFormat.Hm().format(time);
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            formattedTime,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Urbanist',
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: Color(0xff000000),
            ),
          ),
          SizedBox(height: 10),
          Text(
            location,
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
