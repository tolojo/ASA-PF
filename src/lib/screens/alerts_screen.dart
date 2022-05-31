import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:src/screens/alerts_map_screen.dart';
import 'package:src/screens/create_PSA_screen.dart';
import 'package:src/screens/create_PsaName_screen.dart';

class Alerta extends StatefulWidget {
  const Alerta({Key? key}) : super(key: key);

  @override
  State<Alerta> createState() => _AlertaState();
}

class _AlertaState extends State<Alerta> {
  final url = "http://10.0.2.2:3000/alerta";
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
                child: ListTile(
                    onTap: (() {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            MapScreenAlert(alertaId: "${post["alerta_id"]}"),
                      ));
                    }),
                    title: Text(
                        "Nome: ${post["alerta_nome"]}\nDescricao: ${post["alerta_descricao"]}\n\n\nCARREGE PARA VER MAIS",
                        textAlign: TextAlign.center)));
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => CreatePsaName()));
        },
        backgroundColor: const Color(0xFF9DD6E2),
        child: const Icon(Icons.add),
      ),
    );
  }
}
