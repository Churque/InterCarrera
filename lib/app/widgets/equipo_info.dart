import 'package:flutter/material.dart';
import 'package:kdksdkskdxd/entities/equipo.dart';

class EquipoInfoWidget extends StatelessWidget {
  final Equipo equipo;

  EquipoInfoWidget({required this.equipo});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(17.5, 7.63, 10.17, 7.63),
      decoration: BoxDecoration(
        color: Color(0xffffffff),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(
                    right: 11,
                  ),
                  child: Text(
                    equipo.posicion.toString(),
                    style: TextStyle(
                      fontFamily: 'Urbanist',
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      height: 1.5,
                      color: Color(0xff000000),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    right: 11,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 15,
                        height: 15,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7.5),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(equipo.imagenURL),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          left: 11,
                        ),
                        child: Text(
                          equipo.nombreEquipo,
                          style: TextStyle(
                            fontFamily: 'Urbanist',
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                            height: 1.5,
                            color: Color(0xff000000),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: Row(
              children: [
                for (dynamic stat in equipo.estadisticas.toList())
                  Container(
                    margin: EdgeInsets.only(
                      right: 20,
                    ),
                    child: Text(
                      stat.toString(),
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        fontFamily: 'Urbanist',
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                        height: 1.5,
                        color: Color(0xff000000),
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
}
