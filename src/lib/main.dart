import 'package:flutter/material.dart';
import 'package:src/screens/alerts_screen.dart';

const userId = 1;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Página Principal',
      theme: ThemeData.dark(),
      home: Alerta(),
    );
  }
}
