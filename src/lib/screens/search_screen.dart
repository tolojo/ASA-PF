import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
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
                  prefixIcon: const Icon(Icons.manage_search,
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
              height: 200,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                 const Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Pesquise por um sem-abrigo",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Quicksand',
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF656565),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
