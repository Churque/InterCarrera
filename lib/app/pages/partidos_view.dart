import 'package:flutter/material.dart';
import 'package:kdksdkskdxd/app/widgets/BottomNavigationBar.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage();

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndexDay = 0;
  int _selectedIndexPage = 0;
  final List<String> days = ["Ayer", "Hoy", "Mañana"];

  void _onDayTapped(int index) {
    setState(() {
      _selectedIndexDay = index;
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndexPage = index;
      if (index == 0) {
        Navigator.pushNamed(context, '/');
      }
      if (index == 1) {
        // Si se hace clic en "Clasificación", navega a la página de clasificación
        Navigator.pushNamed(context, '/clasificacion');
      }
      if (index == 2) {
        Navigator.pushNamed(context, '/favoritos');
      }
      if (index == 3) {
        Navigator.pushNamed(context, '/ranking');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "InterCarrera",
          style: TextStyle(fontSize: 16, color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            buildDayTabs(),
            buildPartidosSection(),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        selectedIndex: _selectedIndexPage,
        onItemTapped: _onItemTapped,
      ),
    );
  }

  Widget buildDayTabs() {
    return Container(
      height: 37,
      child: Row(
        children: [
          for (var i = 0; i < days.length; i++)
            InkWell(
              onTap: () {
                _onDayTapped(i);
              },
              child: Container(
                width: MediaQuery.of(context).size.width / 3,
                padding: EdgeInsets.symmetric(vertical: 8),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: i == _selectedIndexDay
                          ? Colors.green
                          : Colors.transparent,
                      width: 2.0,
                    ),
                  ),
                ),
                child: Center(
                  child: Text(
                    days[i],
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget buildPartidosSection() {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.all(9),
          width: double.infinity,
          height: 36,
          child: Center(
            child: Text(
              'Partidos',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400,
                color: Color(0xff000000),
              ),
            ),
          ),
        ),
        Container(
          width: double.infinity,
          height: 26,
          decoration: BoxDecoration(
            color: Color(0xffd9d9d9),
          ),
          child: Center(
            child: Text(
              'Lunes 25 SEP. 2023',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: Color(0xff000000),
              ),
            ),
          ),
        ),
        CustomContainer(),
        CustomContainer(),
        CustomContainer(),
        CustomContainer(),
        CustomContainer(),
      ],
    );
  }
}

class CustomContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.fromLTRB(35.5, 33, 35.5, 32),
        width: double.infinity,
        height: 139,
        decoration: BoxDecoration(
          border: Border.all(color: Color(0xffcccccc)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 69,
              height: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(9.5, 0, 9.5, 10),
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                          'https://assets.stickpng.com/images/584a9b57b080d7616d298779.png',
                        ),
                      ),
                    ),
                  ),
                  Text(
                    'VILAREAL CF',
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff000000),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 40.5,
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 2, 0, 3),
              height: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
                    child: Text(
                      '15:00',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: Color(0xff000000),
                      ),
                    ),
                  ),
                  Text(
                    'Cancha N°1',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff015c1a),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 40.5,
            ),
            Container(
              width: 69,
              height: 138,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(9.5, 0, 9.5, 10),
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                          'https://upload.wikimedia.org/wikipedia/en/7/7a/Girona_FC_new_logo.png',
                        ),
                      ),
                    ),
                  ),
                  Text(
                    'GIRONA FC',
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff000000),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
