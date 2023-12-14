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
  // Controladores para el formulario del jugador
  final TextEditingController _nombreJugadorController =
      TextEditingController();
  final TextEditingController _numCamisetaController = TextEditingController();

  final List<Jugador> jugadores = []; // Lista de jugadores del equipo

  // Agrega controladores para otros campos según sea necesario
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
                decoration: InputDecoration(labelText: 'Número de Camiseta'),
                keyboardType: TextInputType.number,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Cerrar el diálogo
              },
              child: Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                // Validar y agregar el jugador
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

    if (nombreJugador.isNotEmpty && numCamiseta.isNotEmpty) {
      // Convertir el número de camiseta a un entero
      int numCamisetaInt = int.tryParse(numCamiseta) ?? 0;

      // Crear una nueva instancia de Jugador
      Jugador nuevoJugador = Jugador(
        id: jugadores.length +
            1, // Asegurarse de que cada jugador tenga un ID único
        equipoID: 1,
        nombre: nombreJugador,
        estadisticas: JugadorEstadisticas(goles: 0, asistencias: 0),
        numCamiseta: numCamisetaInt,
        imagenURL: 'https://ruta/de/la/imagen.png',
      );

      setState(() {
        jugadores.add(nuevoJugador);
      });

      Navigator.of(context).pop(); // Cerrar el diálogo

      // Limpiar los controladores del formulario del jugador
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
    // Obtén los valores ingresados por el usuario
    String nombreEquipo = _nombreController.text;
    String urlEquipo = _nombreController.text;
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
        jugadores: jugadores,
      );
      List<Map<String, dynamic>> jugadoresMapList =
          jugadores.map((jugador) => jugador.toMap()).toList();

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
        'jugadores': jugadoresMapList,
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
      _urlController.clear();
      jugadores
          .clear(); // Limpiar la lista de jugadores después de agregar el equipo
      // Limpia otros campos según sea necesario
    } else {
      // Muestra un mensaje de error si el nombre del equipo está vacío
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
