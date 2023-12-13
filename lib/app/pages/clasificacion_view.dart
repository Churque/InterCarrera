import 'package:flutter/material.dart';
import 'package:kdksdkskdxd/app/appstate.dart';
import 'package:kdksdkskdxd/app/widgets/equipo_info.dart';
import 'package:kdksdkskdxd/entities/grupo.dart';
import 'package:provider/provider.dart';

class MyClasificationPage extends StatelessWidget {
  const MyClasificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<List<Grupo>>(
        stream: obtenerGrupos(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            List<Grupo>? tusGrupos = snapshot.data;

            return SingleChildScrollView(
              child: Column(
                children: [
                  Column(
                    children: [
                      for (var grupo in tusGrupos ?? [])
                        GrupoWidget(grupo: grupo),
                    ],
                  )
                ],
              ),
            );
          }
        },
      ),
    );
  }
}

class GrupoWidget extends StatelessWidget {
  final Grupo grupo;

  const GrupoWidget({required this.grupo});

  @override
  Widget build(BuildContext context) {
    // Puedes implementar la lógica específica del GrupoWidget aquí
    // Por ejemplo, puedes utilizar el widget GrupoInfoWidget y EquipoInfoWidget según sea necesario
    return Column(
      children: [
        GrupoInfoWidget(grupo: grupo),
        for (var equipo in grupo.equipos) EquipoInfoWidget(equipo: equipo),
      ],
    );
  }
}
// Resto del código sin cambios

class GrupoInfoWidget extends StatelessWidget {
  final Grupo grupo;

  GrupoInfoWidget({required this.grupo});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 37,
      decoration: BoxDecoration(
        color: Color(0xff015c1a),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              margin: EdgeInsets.fromLTRB(44, 0, 0, 0),
              child: Text(
                grupo.nombre,
                style: TextStyle(
                  fontFamily: 'Urbanist',
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                  height: 1.5,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(left: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  for (dynamic stat in ['PTS', 'PJ', 'PG', 'PE', 'PP', 'DG'])
                    Expanded(
                      child: Container(
                        child: Text(
                          stat,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
