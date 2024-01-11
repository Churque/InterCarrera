import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kdksdkskdxd/entities/equipo.dart';
import 'package:kdksdkskdxd/entities/equipo_estadisticas.dart';
import 'package:kdksdkskdxd/entities/jugador.dart';
import 'package:kdksdkskdxd/entities/jugador_estadisticas.dart';

class AnadirEquipo extends StatefulWidget {
  const AnadirEquipo({Key? key}) : super(key: key);

  @override
  State<AnadirEquipo> createState() => _AnadirEquipoState();
}

class _AnadirEquipoState extends State<AnadirEquipo> {
  final TextEditingController _nombreController = TextEditingController();
  final TextEditingController _urlController = TextEditingController();
  final TextEditingController _nombreJugadorController =
      TextEditingController();
  final TextEditingController _numCamisetaController = TextEditingController();

  final List<Jugador> jugadores = [];

  void _agregarJugador() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Agregar Jugador'),
          content: Column(
            children: [
              TextField(
                controller: _nombreJugadorController,
                decoration: InputDecoration(labelText: 'Nombre del Jugador'),
              ),
              TextField(
                controller: _numCamisetaController,
                decoration: InputDecoration(
                  labelText: 'Número de Camiseta',
                ),
                keyboardType: TextInputType.number,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                _validarYAgregarJugador();
              },
              child: Text('Agregar'),
            ),
          ],
        );
      },
    );
  }

  void _validarYAgregarJugador() {
    String nombreJugador = _nombreJugadorController.text;
    String numCamiseta = _numCamisetaController.text;
    String id = (jugadores.length + 1).toString();
    if (nombreJugador.isNotEmpty && numCamiseta.isNotEmpty) {
      int numCamisetaInt = int.tryParse(numCamiseta) ?? 0;

      Jugador nuevoJugador = Jugador(
        id: id,
        equipoID:
            '', // Deberás asignar este valor según la estructura de tu aplicación
        nombre: nombreJugador,
        estadisticas: JugadorEstadisticas(goles: 0, asistencias: 0),
        numCamiseta: numCamisetaInt,
        imagenURL:
            'https://aurora-israel.co.il/wp-content/uploads/2022/05/mbappe.jpg',
      );

      setState(() {
        jugadores.add(nuevoJugador);
      });

      Navigator.of(context).pop();
      _nombreJugadorController.clear();
      _numCamisetaController.clear();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Por favor, complete todos los campos del jugador'),
        ),
      );
    }
  }

  void _anadirEquipo() async {
    String nombreEquipo = _nombreController.text;
    String urlEquipo = _urlController.text;

    if (nombreEquipo.isNotEmpty) {
      // Genera un ID único para el equipo
      String idEquipo =
          FirebaseFirestore.instance.collection('equipos').doc().id;

      Equipo nuevoEquipo = Equipo(
        id: idEquipo,
        posicion: 1,
        nombreEquipo: nombreEquipo,
        imagenURL: urlEquipo,
        estadisticas: EquipoEstadisticas(
          pts: 0,
          pj: 0,
          pg: 0,
          pe: 0,
          pp: 0,
          difGoles: '+0',
        ),
        jugadores: jugadores,
      );

      List<Map<String, dynamic>> jugadoresMapList = jugadores.map((jugador) {
        // Genera un ID único para cada jugador
        String idJugador = "$idEquipo-${jugador.numCamiseta}";

        // Actualiza el equipoID
        jugador.equipoID = idEquipo;

        return jugador.toMap()..['id'] = idJugador;
      }).toList();

      Map<String, dynamic> equipoData = {
        'id': nuevoEquipo.id,
        'posicion': nuevoEquipo.posicion,
        'nombreEquipo': nuevoEquipo.nombreEquipo,
        'imagenURL': nuevoEquipo.imagenURL,
        'estadisticas': {
          'pts': nuevoEquipo.estadisticas.pts,
          'pj': nuevoEquipo.estadisticas.pj,
          'pg': nuevoEquipo.estadisticas.pg,
          'pe': nuevoEquipo.estadisticas.pe,
          'pp': nuevoEquipo.estadisticas.pp,
          'difGoles': nuevoEquipo.estadisticas.difGoles,
        },
        'jugadores': jugadoresMapList,
      };

      // Utiliza set para establecer un documento con un ID específico
      await FirebaseFirestore.instance
          .collection('equipos')
          .doc(idEquipo)
          .set(equipoData);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Equipo añadido correctamente'),
        ),
      );

      _nombreController.clear();
      _urlController.clear();
      jugadores.clear();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Por favor, ingrese los datos del equipo'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Añadir Equipo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _nombreController,
              decoration: InputDecoration(labelText: 'Nombre del equipo'),
            ),
            TextField(
              controller: _urlController,
              decoration: InputDecoration(labelText: 'URL de la imagen'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _agregarJugador,
              child: Text('Agregar Jugador'),
            ),
            SizedBox(height: 16.0),
            Expanded(
              child: ListView.builder(
                itemCount: jugadores.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(jugadores[index].nombre),
                    subtitle: Text('Número: ${jugadores[index].numCamiseta}'),
                  );
                },
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _anadirEquipo,
              child: Text('Añadir Equipo'),
            ),
          ],
        ),
      ),
    );
  }
}
