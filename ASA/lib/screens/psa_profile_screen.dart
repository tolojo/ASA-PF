import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PSAProfile extends StatefulWidget {
  String psaId;
  PSAProfile({required this.psaId});

  @override
  State<PSAProfile> createState() => _PSAProfileState(psaId);
}

class _PSAProfileState extends State<PSAProfile> {
  String psaId;
  _PSAProfileState(this.psaId);
  final url = "https://asa-pf.herokuapp.com/psa/id/";
  var _psaJson = [];
  String caracs = "";
  String nomePsa = "";

  Future<void> fetchPSA() async {
    try {
      final response = await http.get(Uri.parse(url + psaId));
      final jsonData = jsonDecode(response.body);
      setState(() {
        _psaJson = jsonData;
      });
      var psaAtivo = _psaJson[1];
      nomePsa = "${psaAtivo["psa_nome_provisorio"]}";
      for (var i = 0; i < 6; i++) {
        var caracAtivo = _psaJson[i];
        caracs +=
            "\n ${caracAtivo["tc_nome"]}: ${caracAtivo["caracteristicas_caracteristica"]} \n";
      }
    } catch (err) {
      print(err);
    }
  }

  @override
  void initState() {
    super.initState();
    fetchPSA();
  }

  @override
  Widget build(BuildContext context) {
    final post = _psaJson;
    if (post != null) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("ASA PSA Profile"),
          centerTitle: true,
          backgroundColor: const Color(0xFF9DD6E2),
        ),
        body: ListView(
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
                    nomePsa,
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
              children: <Widget>[
                ListTile(
                  title: Text(
                    caracs,
                    style: const TextStyle(
                        color: Color(0xFF537597),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Quicksand'),
                  ),
                ),
              ],
            ),
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
