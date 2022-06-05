import 'package:flutter/material.dart';
import 'package:src/screens/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Página Principal', 
      theme: ThemeData(scaffoldBackgroundColor: const Color(0xFF9DD6E2)),
      home: const LoginPage()
      );
  }
}
