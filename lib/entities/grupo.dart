import 'package:flutter/material.dart';
import 'package:kdksdkskdxd/entities/equipo.dart';
import 'package:kdksdkskdxd/servicios/servicios_bd.dart';

final EquiposService equiposService = EquiposService();

class Grupo {
  final List<Equipo> equipos;
  final String nombre;
  final int id;

  Grupo({
    required this.equipos,
    required this.nombre,
    required this.id,
  });
}

class TuWidget extends StatefulWidget {
  @override
  _TuWidgetState createState() => _TuWidgetState();
}

class _TuWidgetState extends State<TuWidget> {
  late List<Grupo> tusGrupos;

  @override
  void initState() {
    super.initState();
    inicializarGrupos();
  }

  Future<void> inicializarGrupos() async {
    try {
      List<Equipo> equipos = await equiposService.obtenerEquipos();

      setState(() {
        tusGrupos = [
          Grupo(nombre: 'GRUPO A', id: 1, equipos: equipos),
          Grupo(nombre: 'GRUPO B', id: 1, equipos: equipos.sublist(5, 10)),
          Grupo(nombre: 'GRUPO C', id: 1, equipos: equipos.sublist(11, 13)),
        ];
      });
    } catch (e) {
      // Maneja los errores según sea necesario
      print('Error al inicializar grupos: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    if (tusGrupos == null) {
      return CircularProgressIndicator();
    }

    // Ahora puedes usar tusGrupos en tu interfaz de usuario
    return Scaffold(
      appBar: AppBar(
        title: Text('Tus Grupos'),
      ),
      body: ListView.builder(
        itemCount: tusGrupos.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(tusGrupos[index].nombre),
            // Otras propiedades del grupo según tus necesidades
          );
        },
      ),
    );
  }
}
