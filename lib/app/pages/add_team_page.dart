import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kdksdkskdxd/entities/equipo.dart';
import 'package:kdksdkskdxd/entities/equipo_estadisticas.dart';
import 'package:kdksdkskdxd/entities/jugador.dart';

class AnadirEquipo extends StatefulWidget {
  const AnadirEquipo({Key? key}) : super(key: key);

  @override
  State<AnadirEquipo> createState() => _AnadirEquipoState();
}

class _AnadirEquipoState extends State<AnadirEquipo> {
  final TextEditingController _nombreController = TextEditingController();

  // Agrega controladores para otros campos según sea necesario

  void _anadirEquipo() async {
    // Obtén los valores ingresados por el usuario
    String nombreEquipo = _nombreController.text;
    // Obtén otros valores según sea necesario

    // Validación simple (puedes agregar validaciones más robustas según tus requisitos)

    if (nombreEquipo.isNotEmpty) {
      // Crea una nueva instancia de Equipo
      Equipo nuevoEquipo = Equipo(
        id: 1,
        posicion: 1,
        nombreEquipo: nombreEquipo,
        imagenURL:
            'https://assets.stickpng.com/images/584a9b3bb080d7616d298777.png',
        estadisticas: EquipoEstadisticas(
          pts: 0,
          pj: 0,
          pg: 0,
          pe: 0,
          pp: 0,
          difGoles: '+0',
        ),
        //misJugadores600,
        jugadores: [],
      );

      // Convierte la instancia de Equipo a un mapa para almacenarlo en Firestore
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
        'jugadores': nuevoEquipo.jugadores,
        // Agrega otros campos específicos según sea necesario
      };

      // Crea un nuevo documento en la colección 'equipos' de Firestore
      DocumentReference nuevoEquipoRef = await FirebaseFirestore.instance
          .collection('equipos')
          .add(equipoData);

      // Actualiza el ID del equipo con el ID asignado por Firestore
      nuevoEquipo.id = nuevoEquipoRef.id as int;

      // Muestra un mensaje o realiza otras acciones después de añadir el equipo
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Equipo añadido correctamente'),
        ),
      );

      // Limpia los campos del formulario después de añadir el equipo
      _nombreController.clear();
      // Limpia otros campos según sea necesario
    } else {
      // Muestra un mensaje de error si el nombre del equipo está vacío
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Por favor, ingrese el nombre del equipo'),
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
            // Agrega otros campos según sea necesario

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
