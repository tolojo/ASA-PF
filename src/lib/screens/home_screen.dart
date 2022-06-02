import 'package:flutter/material.dart';

import 'create_PsaName_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("ASA Homepage"),
          centerTitle: true,
          backgroundColor: const Color(0xFF9DD6E2),),
          floatingActionButton: FloatingActionButton(
          onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => CreatePsaName()));
        },
        backgroundColor: const Color(0xFF9DD6E2),
        child: const Icon(Icons.add),
      ),
    );
    body: ;
  }
}