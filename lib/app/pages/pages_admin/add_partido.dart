import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:kdksdkskdxd/entities/equipo.dart';
import 'package:kdksdkskdxd/entities/partido.dart';

class MyAddPartidoPage extends StatefulWidget {
  const MyAddPartidoPage();

  @override
  _MyAddPartidoPage createState() => _MyAddPartidoPage();
}

class _MyAddPartidoPage extends State<MyAddPartidoPage> {
  int selectedEquipoLocalIndex = -1;
  int selectedEquipoVisitaIndex = -1;
  Equipo? selectedEquipoLocal;
  Equipo? selectedEquipoVisita;

  final _dateController = TextEditingController();
  final _timeController = TextEditingController();
  final _canchaController = TextEditingController();
  int selectedTeamIndex = 0;

  bool showTeamsList = false;

  List<String> canchaOptions = [
    "Cancha 1",
    "Cancha 2",
    "Cancha 3",
    "Cancha 4"
  ]; // Replace with your actual options

  @override
  void initState() {
    super.initState();
    _canchaController.text = canchaOptions.first;
  }

  @override
  void dispose() {
    _dateController.dispose();
    _timeController.dispose();
    super.dispose();
  }

  List<Equipo> get equiposDisponibles {
    return misEquipos
        .where((equipo) =>
            equipo != selectedEquipoLocal && equipo != selectedEquipoVisita)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            Container(
              height: 105,
              child: AppBar(
                title: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Crear Partido'),
                  ],
                ),
                centerTitle: true,
                shape: ContinuousRectangleBorder(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 90),
              child: Card(
                margin: EdgeInsets.symmetric(horizontal: 20),
                elevation: 12,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Container(
                  padding: EdgeInsets.fromLTRB(20, 32, 20, 32),
                  width: double.infinity,
                  height: 108,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      buildBotonAgregarEquipo(-10),
                      buildBotonAgregarEquipo(-9),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 210, horizontal: 20),
              child: ListView(
                shrinkWrap: true,
                children: [
                  buildFormFecha(),
                  const SizedBox(height: 25),
                  buildFormHora(),
                  const SizedBox(height: 25),
                  buildFormCancha(),
                  const SizedBox(height: 30),
                  buildSavePartido(),
                  const SizedBox(height: 20),
                  buildCancelarPartido(),
                ],
              ),
            ),
            if (showTeamsList) buildTeamsList(),
          ],
        ),
      ),
    );
  }

  Widget buildCancelarPartido() {
    return GestureDetector(
      onTap: () {
        print('Volver');
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        width: double.infinity,
        height: 60,
        decoration: BoxDecoration(
          color: Color(0xffd9d9d9),
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Color(0x3f000000),
              offset: Offset(0, 4),
              blurRadius: 2,
            ),
          ],
        ),
        child: Center(
          child: Text(
            'Cancelar',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Urbanist',
              fontSize: 20,
              fontWeight: FontWeight.w600,
              height: 1.2,
              color: Color(0xff000000),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildSavePartido() {
    return GestureDetector(
      onTap: () {
        String tiempo = _timeController.text;
        List<String> partesTiempo = tiempo.split(':');
        TimeOfDay hora = TimeOfDay(
          hour: int.parse(partesTiempo[0]),
          minute: int.parse(partesTiempo[1]),
        );
        String cancha = _canchaController.text;
        DateTime fecha = DateTime.parse(_dateController.text);

        DateTime fechaYHora = DateTime(
          fecha.year,
          fecha.month,
          fecha.day,
          hora.hour,
          hora.minute,
        );

        Partido nuevoPartido = Partido(
          id: 0,
          local: selectedEquipoLocal!,
          visita: selectedEquipoVisita!,
          cancha: cancha,
          fecha: fechaYHora,
          live: false,
          finalizado: false,
          golesLocal: 0,
          golesVisita: 0,
        );

        misPartidos.add(nuevoPartido);
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        width: double.infinity,
        height: 60,
        decoration: BoxDecoration(
          color: Color(0xff015c1a),
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Color(0x3f000000),
              offset: Offset(0, 4),
              blurRadius: 2,
            ),
          ],
        ),
        child: Center(
          child: Text(
            'Crear Partido',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Urbanist',
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Color(0xffffffff),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildBotonAgregarEquipo(int index) {
    String buttonText = index == -10 ? 'Añadir Equipo L' : 'Añadir Equipo V';

    return InkWell(
      onTap: () {
        setState(() {
          showTeamsList = !showTeamsList;
          selectedTeamIndex = index;
        });
      },
      child: index == -10
          ? selectedEquipoLocal != null
              ? buildEquipoSeleccionado(selectedEquipoLocal!)
              : buildButtonTeams(buttonText)
          : selectedEquipoVisita != null
              ? buildEquipoSeleccionado(selectedEquipoVisita!)
              : buildButtonTeams(buttonText),
    );
  }

  Widget buildButtonTeams(String buttonText) {
    return Container(
      width: 135,
      height: double.infinity,
      decoration: BoxDecoration(
        color: Color(0xff015c1a),
        borderRadius: BorderRadius.circular(6),
        boxShadow: [
          BoxShadow(
            color: Color(0x3f000000),
            offset: Offset(0, 4),
            blurRadius: 2,
          ),
        ],
      ),
      child: Center(
        child: Text(
          buttonText,
          style: TextStyle(
            fontFamily: 'Urbanist',
            fontSize: 14,
            fontWeight: FontWeight.w600,
            height: 1.5,
            color: Color(0xffffffff),
          ),
        ),
      ),
    );
  }

  Widget buildEquipoSeleccionado(Equipo equipo) {
    return Container(
      width: 155,
      height: 30,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(equipo.imagenURL),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 9),
            child: Text(
              equipo.nombreEquipo,
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 16,
                fontWeight: FontWeight.w600,
                height: 1.5,
                color: Color(0xff000000),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildTeamsList() {
    double leftPosition = 22;
    if (selectedTeamIndex == -9) {
      leftPosition += 180.0;
    }

    return Positioned(
      left: leftPosition,
      top: 158,
      child: Container(
        padding: EdgeInsets.fromLTRB(0, 15, 0, 15),
        width: 170,
        height: 284,
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 255, 255, 255),
          boxShadow: [
            BoxShadow(
              color: Color(0x3f000000),
              offset: Offset(0, 4),
              blurRadius: 10,
            ),
          ],
          border: Border.all(
            color: Color.fromRGBO(83, 83, 83, 0.612),
            width: 2.0,
          ), // Añadir borde negro
        ),
        child: SingleChildScrollView(
          child: Column(
            children: buildEquipoSelectList(),
          ),
        ),
      ),
    );
  }

  List<Widget> buildEquipoSelectList() {
    List<Widget> equipoSelectWidgets = [];

    for (int i = 0; i < equiposDisponibles.length; i++) {
      equipoSelectWidgets.add(buildEquipoSelect(i, equiposDisponibles[i]));
    }

    return equipoSelectWidgets;
  }

  Widget buildEquipoSelect(int equipoIndex, Equipo equipo) {
    return GestureDetector(
      onTap: () {
        setState(() {
          if (selectedTeamIndex == -10) {
            selectedEquipoLocal = equipo;
            selectedEquipoLocalIndex = equipoIndex;
          } else {
            selectedEquipoVisita = equipo;
            selectedEquipoVisitaIndex = equipoIndex;
          }
        });
      },
      child: Container(
        padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
        width: double.infinity,
        decoration: BoxDecoration(color: Color.fromARGB(255, 255, 255, 255)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(right: 10),
              width: 25,
              height: 25,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.5),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(equipo.imagenURL),
                ),
              ),
            ),
            Text(
              equipo.nombreEquipo,
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 13,
                fontWeight: FontWeight.w400,
                height: 1.5,
                color: Color(0xff000000),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildFormCancha() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Cancha:',
          style: TextStyle(),
        ),
        const SizedBox(height: 10),
        CustomDropdown(
          options: canchaOptions,
          value: _canchaController.text,
          onChanged: (String? newValue) {
            setState(() {
              _canchaController.text = newValue ?? "";
            });
          },
        ),
      ],
    );
  }

  Widget buildFormFecha() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Fecha:',
          style: TextStyle(),
        ),
        const SizedBox(height: 10),
        Container(
          child: MyTextField(
            myController: _dateController,
            fieldName: "fecha",
            myIcon: Icons.date_range_rounded,
            prefixIconColor: Color(0xff015c1a),
            onTap: () {
              showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(2022),
                lastDate: DateTime(2030),
                builder: (BuildContext context, Widget? child) {
                  return Localizations(
                    locale: const Locale('es', ''),
                    delegates: const [
                      GlobalMaterialLocalizations.delegate,
                      GlobalWidgetsLocalizations.delegate,
                    ],
                    child: child!,
                  );
                },
              ).then((pickedDate) {
                if (pickedDate != null) {
                  _dateController.text =
                      DateFormat('yyyy-MM-dd').format(pickedDate);
                }
              });
            },
          ),
        ),
      ],
    );
  }

  Widget buildFormHora() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Hora:',
          style: TextStyle(),
        ),
        const SizedBox(height: 10),
        Container(
          child: MyTextField(
            myController: _timeController,
            fieldName: "hora",
            myIcon: Icons.timer_sharp,
            prefixIconColor: Color(0xff015c1a),
            onTap: () {
              showTimePicker(
                context: context,
                initialTime: TimeOfDay.now(),
              ).then((pickedTime) {
                if (pickedTime != null) {
                  _timeController.text =
                      '${pickedTime.hour}:${pickedTime.minute}';
                }
              });
            },
          ),
        ),
      ],
    );
  }
}

class MyTextField extends StatelessWidget {
  MyTextField({
    Key? key,
    required this.fieldName,
    required this.myController,
    this.myIcon = Icons.verified_user_outlined,
    this.prefixIconColor = Colors.blueAccent,
    this.onTap, // Nueva propiedad onTap
  });

  final TextEditingController myController;
  String fieldName;
  final IconData myIcon;
  Color prefixIconColor;
  final VoidCallback? onTap; // Nuevo tipo de propiedad onTap

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: myController,
      onTap: onTap,
      readOnly: true,
      focusNode: FocusNode(), // Deshabilita el enfoque

      enableInteractiveSelection: false,
      decoration: InputDecoration(
        labelText: fieldName,
        prefixIcon: Icon(myIcon, color: prefixIconColor),
        border: const OutlineInputBorder(),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xff015c1a)),
        ),
        labelStyle: const TextStyle(color: Color.fromRGBO(83, 83, 83, 0.612)),
      ),
    );
  }
}

class CustomDropdown extends StatefulWidget {
  final List<String> options;
  final String value;
  final ValueChanged<String?> onChanged;

  const CustomDropdown({
    Key? key,
    required this.options,
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  @override
  _CustomDropdownState createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  bool _isDropdownOpen = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                _isDropdownOpen = !_isDropdownOpen;
              });
            },
            child: Container(
              width: double.infinity,
              height: 60,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Color.fromRGBO(
                      83, 83, 83, 0.530), // Cambia según tus necesidades
                ),
                borderRadius: BorderRadius.circular(4.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.stadium_sharp, color: Color(0xff015c1a)),
                    const SizedBox(width: 14),
                    Text(widget.value),
                    Icon(Icons.arrow_drop_down),
                  ],
                ),
              ),
            ),
          ),
          if (_isDropdownOpen)
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Color.fromRGBO(
                      83, 83, 83, 0.612), // Cambia según tus necesidades
                ),
                borderRadius: BorderRadius.circular(4.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: widget.options.map((String option) {
                  return GestureDetector(
                    onTap: () {
                      widget.onChanged(option);
                      setState(() {
                        _isDropdownOpen = false;
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        option,
                        textAlign:
                            TextAlign.center, // Alinea el texto a la izquierda
                        style: TextStyle(
                          fontFamily: 'Urbanist',
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          height: 1.5,
                          color: Color.fromRGBO(1, 1, 1, 0.612),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
        ],
      ),
    );
  }
}
