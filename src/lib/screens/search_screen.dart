import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:src/screens/psa_profile_screen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final formkey = GlobalKey<FormState>();
  final url = "http://10.0.2.2:3000/psa/nome/";
  var _psaJson = null;
  TextEditingController searchController = TextEditingController();

  Future<void> fetchPSA(String nome) async {
    try {
      final response = await http.get(Uri.parse(url + searchController.text));
      final jsonData = jsonDecode(response.body);
      setState(() {
        _psaJson = jsonData;
      });
      print(_psaJson);
    } catch (err) {}
  }

  @override
  Widget build(BuildContext context) {
    while (_psaJson != null) {
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 0, vertical: 16),
                child: TextField(
                  key: formkey,
                  controller: searchController,
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
              ListView.builder(
                shrinkWrap: true,
                itemCount: _psaJson.length,
                itemBuilder: (context, i) {
                  final post = _psaJson[i];
                  return Card(
                    color: const Color.fromARGB(255, 223, 223, 223),
                    elevation: 15,
                    shadowColor: Colors.grey,
                    child: ListTile(
                      onTap: (() {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (_) => const PSAProfile(),
                        ));
                      }),
                      title: Text(
                        "${post["psa_nome_provisorio"]}",
                        textAlign: TextAlign.center,
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
              const SizedBox(
                height: 20,
              ),
              Material(
                elevation: 15,
                shadowColor: Colors.grey,
                borderRadius: BorderRadius.circular(15),
                child: ElevatedButton(
                  onPressed: () {
                    fetchPSA(searchController.text);
                    if (formkey.currentState!.validate()) {}
                  },
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
              ),
            ],
          ),
        ),
      );
    }

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
                key: formkey,
                controller: searchController,
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
                      color: Color(0xFF537597)),
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
            Material(
              elevation: 15,
              shadowColor: Colors.grey,
              borderRadius: BorderRadius.circular(15),
              child: ElevatedButton(
                onPressed: () {
                  fetchPSA(searchController.text);
                  if (formkey.currentState!.validate()) {}
                },
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
            ),
          ],
        ),
      ),
    );
  }
}
