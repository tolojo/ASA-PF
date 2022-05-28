import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UserProfile extends StatefulWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  final userId = "1";
  final url = "http://10.0.2.2:3000/cidadao/";
  var _cidadaoJson;

  Future<void> fetchCidadao() async {
    try {
      final response = await http.get(Uri.parse(url + userId));
      final jsonData = jsonDecode(response.body);
      setState(() {
        _cidadaoJson = jsonData;
      });
      _cidadaoJson = jsonData;
    } catch (err) {}
  }

  @override
  void initState() {
    super.initState();
    fetchCidadao();
  }

  @override
  Widget build(BuildContext context) {
    final post = _cidadaoJson;
    return Scaffold(
      appBar: AppBar(
        title: const Text("ASA Profile"),
        centerTitle: true,
        backgroundColor: const Color(0xFF9DD6E2),
      ),
      body:  ListView(
          children: <Widget>[
            Container(
              color: const Color(0xFFCEE9F3),
              height: 250,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const<Widget>[
                      CircleAvatar(
                        minRadius: 75.0,
                        child: CircleAvatar(
                          radius: 75.0,
                          backgroundImage:
                              AssetImage("assets/images/Group 193profilepic.jpg"),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "${post["cidadao_nome"]}",
                    style: const TextStyle(
                      fontSize: 24,
                      fontFamily: 'Quicksand',
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF537597),
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: const <Widget>[
                 ListTile(
                  title: Text(
                    'Editar Perfil',
                    style: TextStyle(
                      color: Color(0xFF537597),
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Quicksand'
                    ),
                  ),
                ),
              ],
            ),
            const Divider(),
            Column(
              children: const <Widget>[
                 ListTile(
                  title: Text(
                    'Definições',
                    style: TextStyle(
                      color: Color(0xFF537597),
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Quicksand'
                    ),
                  ),
                ),
              ],
            ),
            const Divider(),
            Column(
              children: const <Widget>[
                 ListTile(
                  title: Text(
                    'Terminar Sessão',
                    style: TextStyle(
                      color: Color(0xFF537597),
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Quicksand'
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
    );
  }


}
