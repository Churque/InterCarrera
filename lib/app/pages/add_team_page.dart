import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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
      // Crea un nuevo documento en la colección 'equipos' de Firestore
      await FirebaseFirestore.instance.collection('equipos').add({
        'nombreEquipo': nombreEquipo,
        // Agrega otros campos según sea necesario
      });

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
