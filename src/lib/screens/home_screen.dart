import 'package:flutter/material.dart';
import 'create_PsaName_screen.dart';
import 'package:fluttericon/entypo_icons.dart';

final myIcons = Icon(Entypo.user_add);

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
        backgroundColor: const Color(0xFF9DD6E2),
      ),
      body: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: const <Widget>[
                CircleAvatar(
                  minRadius: 30.0,
                  child: CircleAvatar(
                    radius: 30.0,
                    backgroundImage:
                        AssetImage("assets/images/Group 193profilepic.jpg"),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Procure sem-abrigo na área. Ajude o próximo.",
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'Quicksand',
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF537597),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 16),
              child: TextField(
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(vertical: 30.0),
                  fillColor: const Color.fromARGB(255, 223, 223, 223),
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(
                      width: 0,
                      style: BorderStyle.none,
                    ),
                  ),
                ),
              ),
            ),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Sinalizar sem-abrigo",
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'Quicksand',
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF656565),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 16),
              child: TextField(
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(vertical: 30.0),
                  fillColor: const Color.fromARGB(255, 223, 223, 223),
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(
                      width: 0,
                      style: BorderStyle.none,
                    ),
                  ),
                ),
              ),
            ),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Pedir ajuda urgente                 Pedir ajuda",
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'Quicksand',
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF656565),
                ),
              ),
            ),
            Material(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.fromLTRB(50, 20, 50, 20),
                        primary: const Color(0xFFE9E8E8),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12))),
                    child: const Icon(Icons.warning_rounded,
                        color: Color.fromARGB(255, 255, 0, 0), size: 50),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.fromLTRB(52, 20, 52, 20),
                        primary: const Color(0xFFE9E8E8),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12))),
                    child: const Icon(Icons.warning_rounded,
                        color: Color.fromARGB(255, 255, 0, 0), size: 50),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Criar Perfil                                 Doar bens",
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'Quicksand',
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF656565),
                ),
              ),
            ),
            Material(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => CreatePsaName()));
                    },
                    style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.fromLTRB(50, 20, 50, 20),
                        primary: const Color(0xFFE9E8E8),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12))),
                    child: const Icon(Icons.warning_rounded,
                        color: Color.fromARGB(255, 255, 0, 0), size: 50),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.fromLTRB(52, 20, 52, 20),
                        primary: const Color(0xFFE9E8E8),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12))),
                    child: const Icon(Icons.warning_rounded,
                        color: Color.fromARGB(255, 255, 0, 0), size: 50),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
