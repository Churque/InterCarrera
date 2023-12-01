import 'package:flutter/material.dart';
import 'package:kdksdkskdxd/app/pages/clasificacion_view.dart';
import 'package:kdksdkskdxd/app/pages/info_partido_view.dart';
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
    final colors = Theme.of(context).colorScheme;

    final screens = [
      const MyHomePage(),
      const MyClasificationPage(),
      const MyRankingPage(),
      const MyInfoPartidoPage()
    ];

    return Scaffold(
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
