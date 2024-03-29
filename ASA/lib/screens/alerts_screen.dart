import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:src/screens/alerts_map_screen.dart';
import 'package:src/screens/create_PSA_screen.dart';
import 'package:src/screens/create_PsaName_screen.dart';
import 'package:src/screens/create_alert_screen.dart';

class Alerta extends StatefulWidget {
  const Alerta({Key? key}) : super(key: key);

  @override
  State<Alerta> createState() => _AlertaState();
}

class _AlertaState extends State<Alerta> {
  final url = "https://asa-pf.herokuapp.com/alerta";
  var _alertsJson = [];

  void fetchAlertas() async {
    try {
      final response = await http.get(Uri.parse(url));
      final jsonData = jsonDecode(response.body) as List;

      setState(() {
        _alertsJson = jsonData;
      });
    } catch (err) {
      print(err);
    }
  }

  @override
  void initState() {
    super.initState();
    fetchAlertas();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ASA Alerts"),
        centerTitle: true,
        backgroundColor: const Color(0xFF9DD6E2),
      ),
      body: ListView.builder(
        itemCount: _alertsJson.length,
        itemBuilder: (context, i) {
          final post = _alertsJson[i];
          return Card(
            color: const Color.fromARGB(255, 223, 223, 223),
            elevation: 15,
            shadowColor: Colors.grey,
            child: ListTile(
              onTap: (() {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) =>
                      MapScreenAlert(alertaId: "${post["alerta_id"]}"),
                ));
              }),
              title: Text(
                "Nome: ${post["alerta_nome"]}\nDescricao:\n${post["alerta_descricao"]}\n\n\nCARREGE PARA VER MAIS",
                textAlign: TextAlign.left,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    fontFamily: 'Quicksand',
                    color: Color(0xFF537597)),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => CreateAlert()));
        },
        backgroundColor: const Color(0xFF9DD6E2),
        child: const Icon(Icons.add),
      ),
    );
  }
}
