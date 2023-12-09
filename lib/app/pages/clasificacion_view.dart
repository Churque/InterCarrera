import 'package:flutter/material.dart';
import 'package:kdksdkskdxd/app/appstate.dart';
import 'package:kdksdkskdxd/app/widgets/equipo_info.dart';
import 'package:kdksdkskdxd/entities/equipo.dart';
import 'package:kdksdkskdxd/entities/grupo.dart';
import 'package:provider/provider.dart';

class MyClasificationPage extends StatefulWidget {
  //const MyClasificationPage({super.key});
  const MyClasificationPage({Key? key}) : super(key: key);

  @override
  State<MyClasificationPage> createState() => _MyClasificationPage();
}

class _MyClasificationPage extends State<MyClasificationPage> {
  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              children: [
                for (var grupo in tusGrupos) GrupoWidget(grupo: grupo),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class GrupoWidget extends StatelessWidget {
  final Grupo grupo;

  const GrupoWidget({required this.grupo});

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);
    final jugadores = appState.jugadores;
    final equipos = appState.equipos;

    grupo.equipos.sort();

    List<Equipo> equiposOrdenados = List.from(grupo.equipos);
    equiposOrdenados.sort();

    for (int i = 0; i < equiposOrdenados.length; i++) {
      equiposOrdenados[i].posicion = i + 1;
    }
    return Column(
      children: [
        GrupoInfoWidget(groupName: grupo.nombre),
        for (var equipo in grupo.equipos) EquipoInfoWidget(equipo: equipo),
      ],
    );
  }
}

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
