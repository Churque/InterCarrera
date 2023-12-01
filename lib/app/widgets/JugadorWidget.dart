import 'package:flutter/material.dart';
//import 'package:kdksdkskdxd/entities/jugador.dart';

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
            padding: EdgeInsets.symmetric(horizontal: 20),
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
                        width: 25,
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
                  child: Text(
                    numCamiseta.toString(),
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 16,
                      fontWeight: FontWeight.w900,
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
