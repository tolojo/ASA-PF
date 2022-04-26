import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:src/screens/alerts_map_screen.dart';
import 'package:src/screens/home.dart';

class Alerta extends StatefulWidget {
  Alerta({Key? key}) : super(key: key);

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
    } catch (err) {}
  }

  @override
  void initState() {
    super.initState();
    fetchAlertas();
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
                return Card(
                    child: ListTile(
                        onTap: (() {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => MapScreenAlert(
                                alertaId: "${post["alerta_id"]}"),
                          ));
                        }),
                        title: Text(
                            "Nome: ${post["alerta_nome"]}\nDescricao: ${post["alerta_descricao"]}\n\n\nCARREGE PARA VER MAIS",
                            textAlign: TextAlign.center)));
              }),
        ));
  }
}
