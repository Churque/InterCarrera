import 'package:flutter/material.dart';
import 'package:kdksdkskdxd/entities/equipo.dart';
import 'package:kdksdkskdxd/entities/partido.dart';

class PartidoInfo extends StatelessWidget {
  final Partido partido;

  PartidoInfo({required this.partido});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 139,
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xffcccccc)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildEquipoContainer(partido.local),
          SizedBox(
              width: 40.5), // Ajusta el ancho del espacio entre contenedores
          _buildHoraCanchaContainer(partido.hora, partido.cancha),
          SizedBox(
              width: 40.5), // Ajusta el ancho del espacio entre contenedores
          _buildEquipoContainer(partido.visita),
        ],
      ),
    );
  }

  Widget _buildEquipoContainer(Equipo equipo) {
    return Container(
      width: 69,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(9.5, 0, 9.5, 10),
            height: 48,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(equipo.imagenURL),
              ),
            ),
          ),
          Text(
            equipo.nombreEquipo,
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w400,
              color: Color(0xff000000),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHoraCanchaContainer(String hora, String cancha) {
    return Container(
      height: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 20),
            child: Text(
              hora,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: Color(0xff000000),
              ),
            ),
          ),
          Text(
            cancha,
            style: TextStyle(
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
