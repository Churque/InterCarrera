import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class MyAddPartidoPage extends StatefulWidget {
  const MyAddPartidoPage();

  @override
  _MyAddPartidoPage createState() => _MyAddPartidoPage();
}

class _MyAddPartidoPage extends State<MyAddPartidoPage> {
  final _dateController = TextEditingController();
  final _timeController = TextEditingController();
  final _canchaController = TextEditingController();
  @override
  void dispose() {
    _dateController.dispose();
    _timeController.dispose();
    super.dispose();
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
                      buildBotonAgregarEquipo(),
                      buildBotonAgregarEquipo(),
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
                  MyTextField(
                    myController: _dateController,
                    fieldName: "Fecha",
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
                  const SizedBox(height: 20),
                  MyTextField(
                    myController: _timeController,
                    fieldName: "Hora",
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
                  const SizedBox(height: 20),
                  MyTextField(
                    myController: _canchaController,
                    fieldName: "Cancha",
                    myIcon: Icons.stadium_sharp,
                    prefixIconColor: Color(0xff015c1a),
                    //  label: "Cancha"
                  ),
                  const SizedBox(height: 20.0),
                  myBtn(context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildBotonAgregarEquipo() {
    return InkWell(
        onTap: () {
          print('ola');
        },
        child: Container(
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
              'Agregar Equipo',
              style: TextStyle(
                fontFamily: 'Urbanist',
                fontSize: 14,
                fontWeight: FontWeight.w600,
                height: 1.5,
                color: Color(0xffffffff),
              ),
            ),
          ),
        ));
  }

  Widget myBtn(BuildContext context) {
    return Container();
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
      decoration: InputDecoration(
        labelText: fieldName,
        prefixIcon: Icon(myIcon, color: prefixIconColor),
        border: const OutlineInputBorder(),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.deepPurple.shade300),
        ),
        labelStyle: const TextStyle(color: Color.fromRGBO(83, 83, 83, 0.612)),
      ),
    );
  }
}

/*
Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Crear Partido",
          style: TextStyle(fontSize: 16, color: Colors.white),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: Container(),
        ),
        shape: ContinuousRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(50),
            bottomRight: Radius.circular(50),
          ),
        ),
      ),
      body: SingleChildScrollView(
        // Ajusta el valor según tus necesidades
       Material(
  elevation: 4.0, // Ajusta según tus necesidades
  child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Container(
          margin: EdgeInsets.only(top: 5), // Ajusta el valor según tus necesidades
          padding: EdgeInsets.fromLTRB(20, 32, 20, 32),
          width: double.infinity,
          height: 108,
          decoration: BoxDecoration(
            color: Color(0xffffffff),
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Color(0x3f000000),
                offset: Offset(0, 4),
                blurRadius: 2,
              ),
            ],
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildBotonAgregarEquipo(),
              buildBotonAgregarEquipo(),
            ],
          ),
        ),
      ),
    ],
  ),
)
      ),
    );
  }

  Widget buildBotonAgregarEquipo() {
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
          'Agregar Equipo',
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

  Widget buildDeletePartido() {
    return Container(
      width: double.infinity,
      height: 55,
      decoration: BoxDecoration(
        color: Color(0xffd9d9d9),
        borderRadius: BorderRadius.circular(52),
      ),
      child: Center(
        child: Text(
          'Cancelar Partido',
          style: TextStyle(
            fontFamily: 'Urbanist',
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Color(0xff000000),
          ),
        ),
      ),
    );
  }
  */
