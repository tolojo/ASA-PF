import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  final url = "http://10.0.2.2:3000/cidadao/";
  var _cidadaoJson;
  final bool _isLoading = false;

  Future<void> fetchCidadao() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final userId = prefs.getString('id');
    print(userId);
    try {
      final response = await http.get(Uri.parse(url + userId!));
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
    if (post != null) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("ASA Profile"),
          centerTitle: true,
          backgroundColor: const Color(0xFF9DD6E2),
        ),
        body: _isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView(
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
                          children: const <Widget>[
                            CircleAvatar(
                              minRadius: 75.0,
                              child: CircleAvatar(
                                radius: 75.0,
                                backgroundImage: AssetImage(
                                    "assets/images/Group 193profilepic.jpg"),
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
                              fontFamily: 'Quicksand'),
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
                              fontFamily: 'Quicksand'),
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
                              fontFamily: 'Quicksand'),
                        ),
                      ),
                    ],
                  )
                ],
              ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          leading: const BackButton(),
          title: const Text("Create PSA profile"),
          centerTitle: true,
        ),
        body: const Center(child: Text("loading")),
      );
    }
  }
}
