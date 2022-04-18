import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Alerta extends StatefulWidget {
  Alerta({Key? key}) : super(key: key);

  @override
  State<Alerta> createState() => _AlertaState();
}

class _AlertaState extends State<Alerta> {
  final url = "http://10.0.2.2:3000/alerta";
  var _alertsJson = [];

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

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void fecthAlertas() async {
    try {
      final response = await http.get(Uri.parse(url));
      final jsonData = jsonDecode(response.body) as List;

      setState(() {
        _alertsJson = jsonData;
      });
      print(jsonData);
    } catch (err) {}
  }

  @override
  void initState() {
    super.initState();
    fecthAlertas();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData.dark(),
        home: Scaffold(
          body: ListView.builder(
              itemCount: _alertsJson.length,
              itemBuilder: (context, i) {
                final post = _alertsJson[i];
                return Text(
                    "Nome: ${post["alerta_nome"]}\nDescricao: ${post["alerta_descricao"]}\n\n",
                    textAlign: TextAlign.center);
              }),
          bottomNavigationBar: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
                backgroundColor: Colors.red,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.warning),
                label: 'Alertas',
                backgroundColor: Colors.green,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.manage_search),
                label: 'Search',
                backgroundColor: Colors.pink,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.supervised_user_circle),
                label: 'Profile',
                backgroundColor: Colors.purple,
              ),
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: Colors.amber[800],
            onTap: _onItemTapped,
          ),
        ));
  }
}
