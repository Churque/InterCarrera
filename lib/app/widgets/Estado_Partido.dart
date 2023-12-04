import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kdksdkskdxd/entities/partido.dart';

class PartidoWidgets {
  static Widget buildPartidoEnVivo(Partido partido) {
    DateTime fechaInicio = partido.fecha;
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

  static Widget buildPartidoFinalizado(Partido partido) {
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

  static Widget buildHoraCanchaContainer(DateTime time, String cancha) {
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
