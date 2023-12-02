import 'package:flutter/material.dart';
import 'package:kdksdkskdxd/entities/equipo.dart';

class NavBarJugadoresEquipo extends StatefulWidget {
  const NavBarJugadoresEquipo({
    required this.equipoLocal,
    required this.equipoVisita,
    required this.onEquipoTapped, // Agrega esta línea
  });
  final Equipo equipoLocal;
  final Equipo equipoVisita;
  final Function(Equipo) onEquipoTapped; // Agrega esta línea

  @override
  _NavBarJugadoresEquipo createState() => _NavBarJugadoresEquipo();
}

class _NavBarJugadoresEquipo extends State<NavBarJugadoresEquipo> {
  int _selectedIndex = 0;

  late Equipo equipoLocal;
  late Equipo equipoVisita;

  @override
  void initState() {
    super.initState();
    equipoLocal = widget.equipoLocal;
    equipoVisita = widget.equipoVisita;
  }

  void _onContainerTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    widget.onEquipoTapped(index == 0 ? equipoLocal : equipoVisita);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 53,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: InkWell(
              onTap: () {
                _onContainerTapped(0);
              },
              child: Ink(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: _selectedIndex == 0
                          ? Colors.green
                          : Colors.transparent,
                      width: 2.0,
                    ),
                  ),
                ),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  height: double.infinity,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 10),
                        width: 27,
                        height: 27,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                              equipoLocal.imagenURL,
                            ),
                          ),
                        ),
                      ),
                      Text(
                        equipoLocal.nombreEquipo,
                        style: TextStyle(
                          fontFamily: 'Urbanist',
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          height: 1.5,
                          color: Color(0xff000000),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: InkWell(
              onTap: () {
                _onContainerTapped(1);
              },
              child: Ink(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: _selectedIndex == 1
                          ? Colors.green
                          : Colors.transparent,
                      width: 2.0,
                    ),
                  ),
                ),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  height: double.infinity,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        equipoVisita.nombreEquipo,
                        style: TextStyle(
                          fontFamily: 'Urbanist',
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          height: 1.5,
                          color: Color(0xff000000),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 10),
                        width: 27,
                        height: 27,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(equipoVisita.imagenURL),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
