import 'package:flutter/material.dart';
import 'package:kdksdkskdxd/entities/jugador.dart';

class JugadorWidget extends StatelessWidget {
  final String nombre;
  final int numCamiseta;
  final String imagenURL;

  JugadorWidget(
      {required this.nombre,
      required this.numCamiseta,
      required this.imagenURL});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(30, 6.5, 29.5, 6.5),
            width: double.infinity,
            height: 55,
            decoration: BoxDecoration(
              border: Border.all(color: Color(0xffd9d9d9)),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: double.infinity,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 15, 0),
                        width: 42,
                        height: 42,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                              imagenURL,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        nombre,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          height: 1.5,
                          color: Color(0xff000000),
                        ),
                      ),
                    ],
                  ),
                ),
                Spacer(),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 1, 0, 0),
                  child: Text(
                    numCamiseta.toString(),
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 16,
                      fontWeight: FontWeight.w900,
                      height: 1.2125,
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
