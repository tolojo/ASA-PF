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
    return MaterialApp(
        theme: ThemeData.dark(),
        home: Scaffold(
          body: Text(
            "Nome: ${post["cidadao_nome"]}\nEmail: ${post["cidadao_email"]}\n\n",
            textAlign: TextAlign.justify,
            textScaleFactor: 2,
          ),
        ));
  }
}
