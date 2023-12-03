import 'package:flutter/material.dart';
import 'package:kdksdkskdxd/app/pages/add_team_page.dart';
import 'package:kdksdkskdxd/app/pages/clasificacion_view.dart';
import 'package:kdksdkskdxd/app/pages/partidos_view.dart';
import 'package:kdksdkskdxd/app/pages/ranking_view.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final screens = [
      const MyHomePage(),
      const MyClasificationPage(),
      const MyRankingPage(),
      // const MyInfoPartidoPage()
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "InterCarrera",
          style: TextStyle(fontSize: 16, color: Colors.white),
        ),
        actions: [
          PopupMenuButton<int>(
            icon: Icon(Icons.menu),
            offset: Offset(0, 50),
            itemBuilder: (context) => [
              PopupMenuItem(
                value: 1,
                child: Row(
                  children: [
                    Icon(Icons.add, color: Colors.black),
                    SizedBox(width: 8),
                    Text('Añadir Equipo'),
                  ],
                ),
              ),
              PopupMenuItem(
                value: 2,
                child: Row(
                  children: [
                    Icon(Icons.add, color: Colors.black),
                    SizedBox(width: 8),
                    Text('Añadir Partido'),
                  ],
                ),
              ),
              PopupMenuItem(
                value: 3,
                child: Row(
                  children: [
                    Icon(Icons.add, color: Colors.black),
                    SizedBox(width: 8),
                    Text('Añadir Jugado'),
                  ],
                ),
              ),
            ],
            onSelected: (value) {
              switch (value) {
                case 1:
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AnadirEquipo()),
                  );
                  break;
                case 2:
                  break;
                case 3:
                  break;
              }
            },
          ),
        ],
      ),
      body: IndexedStack(
        index: selectedIndex,
        children: screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: selectedIndex,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.white,
        backgroundColor: Colors.black,
        onTap: (value) {
          setState(() {
            selectedIndex = value;
          });
        },
        elevation: 0,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.access_time_filled,
              size: 20,
            ),
            label: 'Partidos',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.emoji_events,
              size: 20,
            ),
            label: 'Clasificación',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.star,
              size: 20,
            ),
            label: 'Favoritos',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.bar_chart,
              size: 20,
            ),
            label: 'Ranking',
          ),
        ],
      ),
    );
  }
}
