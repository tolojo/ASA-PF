import 'package:flutter/material.dart';
import 'package:src/screens/search_screen.dart';
import 'package:src/screens/user_profile_screen.dart';
import 'alerts_screen.dart';
import 'home_screen.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final screens = [
    const HomeScreen(),
    const Alerta(),
    const SearchScreen(),
    const UserProfile(),
  ];

  int _selectedIndex = 0;

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Alertas',
      style: optionStyle,
    ),
    Text(
      'Index 2: Search',
      style: optionStyle,
    ),
    Text(
      'Index 3: Profile',
      style: optionStyle,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: screens[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
            showSelectedLabels: false,
            showUnselectedLabels: false,
            backgroundColor: const Color(0xFF9DD6E2),
            type: BottomNavigationBarType.fixed,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home, color: Color(0xFFFFFFFF), size: 30),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.warning, color: Color(0xFFFFFFFF), size: 30),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.manage_search,
                    color: Color(0xFFFFFFFF), size: 30),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.supervised_user_circle,
                    color: Color(0xFFFFFFFF), size: 30),
                label: '',
              ),
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: Colors.blue,
            onTap: (index) {
              _selectedIndex = index;
              setState(() {});
            }),
      ),
    );
  }
}
