import 'package:flutter/material.dart';

class NavigationModel extends ChangeNotifier {
  int selectedIndexPage = 0;

  void updateSelectedIndex(int index) {
    selectedIndexPage = index;
    notifyListeners();
  }
}

class CustomBottomNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  CustomBottomNavigationBar({
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      color: Colors.black,
      child: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
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
              Icons.bar_chart,
              size: 20,
            ),
            label: 'Ranking',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.star,
              size: 20,
            ),
            label: 'Favoritos',
          ),
        ],
        type: BottomNavigationBarType.fixed,
        currentIndex: selectedIndex,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.white,
        backgroundColor: Colors.black,
        onTap: onItemTapped,
      ),
    );
  }
}


/*
class BNavigator extends StatefulWidget {
  const BNavigator({Key? key}) : super(key: key);

  @override
  _BNavigatorState createState() => _BNavigatorState();
}

class _BNavigatorState extends State<BNavigator> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: index,
      onTap: (int i) {
        setState(() {
          index = i;
        });
      },
      //height: 60,
      //color: Colors.black,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.green,
      unselectedItemColor: Colors.white,
      backgroundColor: Colors.black,

      items: const <BottomNavigationBarItem>[
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
    );
  }
}

*/