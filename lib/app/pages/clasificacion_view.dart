import 'package:flutter/material.dart';
import 'package:kdksdkskdxd/app/appstate.dart';
import 'package:kdksdkskdxd/app/widgets/equipo_info.dart';
import 'package:kdksdkskdxd/entities/equipo.dart';
import 'package:kdksdkskdxd/entities/grupo.dart';
import 'package:kdksdkskdxd/servicios/servicios_bd.dart';
import 'package:provider/provider.dart';

class AppState extends ChangeNotifier {
  final EquiposService equiposService = EquiposService();
  List<Grupo>? tusGrupos;

  Future<List<Grupo>> obtenerGrupos() async {
    try {
      if (tusGrupos == null) {
        // Obtener equipos solo si aún no se han obtenido
        List<Equipo> equipos = await equiposService.obtenerEquipos();

        // Lógica para agrupar los equipos en grupos (puedes ajustar según tus necesidades)
        // Por ejemplo, aquí se agrupan en grupos de 4 equipos
        tusGrupos = [];
        for (int i = 0; i < equipos.length; i += 4) {
          int endIndex = i + 4;
          if (endIndex > equipos.length) {
            endIndex = equipos.length;
          }
          tusGrupos!.add(Grupo(
            nombre: 'GRUPO ${String.fromCharCode(65 + i ~/ 4)}',
            id: i ~/ 4 + 1,
            equipos: equipos.sublist(i, endIndex),
          ));
        }
      }

      return tusGrupos!;
    } catch (e) {
      throw Exception('Error al obtener grupos: $e');
    }
  }
}

class MyClasificationPage extends StatelessWidget {
  const MyClasificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);

    return Scaffold(
      body: FutureBuilder<List<Grupo>>(
        future: appState.obtenerGrupos(),
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
    // Implementa la lógica para mostrar la información del grupo
    return Container(
        // ... tus widgets aquí para mostrar la información del grupo
        );
  }
}

// Resto del código sin cambios

class GrupoInfoWidget extends StatelessWidget {
  final String groupName;

  GrupoInfoWidget({required this.groupName});

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
                groupName,
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
