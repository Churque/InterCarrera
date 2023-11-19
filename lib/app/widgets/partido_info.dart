import 'package:flutter/material.dart';
import 'package:kdksdkskdxd/entities/partido.dart';

class PartidoInfo extends StatelessWidget {
  final Partido partido;

  PartidoInfo({required this.partido});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(35.5, 33, 35.5, 32),
      width: double.infinity,
      height: 139,
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xffcccccc)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 69,
            height: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(9.5, 0, 9.5, 10),
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(partido.local.imagenURL),
                    ),
                  ),
                ),
                Text(
                  partido.local.nombreEquipo,
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff000000),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 40.5,
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0, 2, 0, 3),
            height: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
                  child: Text(
                    partido.hora, // Ajusta cómo se muestra la hora
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: Color(0xff000000),
                    ),
                  ),
                ),
                Text(
                  partido.cancha,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff015c1a),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 40.5,
          ),
          Container(
            width: 69,
            height: 138,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(9.5, 0, 9.5, 10),
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(partido.visita.imagenURL),
                    ),
                  ),
                ),
                Text(
                  partido.visita.nombreEquipo,
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff000000),
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
