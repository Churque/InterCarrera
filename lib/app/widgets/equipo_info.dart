import 'package:flutter/material.dart';

class EquipoInfoWidget extends StatelessWidget {
  final int posicion;
  final String nombreEquipo;
  final String imagenURL;
  final List<int> estadisticas;

  EquipoInfoWidget({
    required this.posicion,
    required this.nombreEquipo,
    required this.imagenURL,
    required this.estadisticas,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(17.5, 7.63, 10.17, 7.63),
      decoration: BoxDecoration(
        color: Color(0xffffffff),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
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
                    posicion.toString(),
                    style: TextStyle(
                      fontFamily: 'Poppins',
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
                            image: NetworkImage(imagenURL),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          left: 11,
                        ),
                        child: Text(
                          nombreEquipo,
                          style: TextStyle(
                            fontFamily: 'Poppins',
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
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                for (int stat in estadisticas)
                  Container(
                    margin: EdgeInsets.only(
                      right: 22,
                    ),
                    child: Text(
                      stat.toString(),
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        fontFamily: 'Poppins',
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
