import 'package:flutter/material.dart';

class NavBarJugadoresEquipo extends StatefulWidget {
  @override
  _NavBarJugadoresEquipo createState() => _NavBarJugadoresEquipo();
}

class _NavBarJugadoresEquipo extends State<NavBarJugadoresEquipo> {
  int _selectedIndex = -1;

  void _onContainerTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
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

                print('Clic en Villareal CF');
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
                                'https://assets.stickpng.com/images/584a9b57b080d7616d298779.png'),
                          ),
                        ),
                      ),
                      Text(
                        'VILLAREAL CF',
                        style: TextStyle(
                          fontFamily: 'Poppins',
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
                // Lógica para manejar el clic en Girona FC
                print('Clic en Girona FC');
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
                        'GIRONA FC',
                        style: TextStyle(
                          fontFamily: 'Poppins',
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
                            image: NetworkImage(
                                'https://upload.wikimedia.org/wikipedia/en/7/7a/Girona_FC_new_logo.png'),
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
