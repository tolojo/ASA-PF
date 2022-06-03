import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final url = "http://10.0.2.2:3000/psa/";
  var _psaJson;

  Future<void> fetchCidadao() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final userId = prefs.getString('id');
    print(userId);
    try {
      final response = await http.get(Uri.parse(url + userId!));
      final jsonData = jsonDecode(response.body);
      setState(() {
        _psaJson = jsonData;
      });
      _psaJson = jsonData;
    } catch (err) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ASA Search"),
        centerTitle: true,
        backgroundColor: const Color(0xFF9DD6E2),
      ),
      body: Container(
        margin: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 16),
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search,
                      color: Color(0xFF9DD6E2), size: 30),
                  contentPadding: const EdgeInsets.symmetric(vertical: 30.0),
                  fillColor: const Color.fromARGB(255, 223, 223, 223),
                  filled: true,
                  hintText: "Pesquise Aqui",
                  hintStyle: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      fontFamily: 'Quicksand',
                      color: Color(0xFF656565)),
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
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.fromLTRB(150, 20, 150, 20),
                  primary: const Color(0xFF77BECE),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12))),
              child: const Text(
                'Pesquisar',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Roboto',
                    fontSize: 20,
                    color: Color(0xFFFFFFFF)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
