import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class CreatePSA extends StatefulWidget {
  CreatePSA({Key? key}) : super(key: key);

  @override
  State<CreatePSA> createState() => _CreatePSAState();
}

class _CreatePSAState extends State<CreatePSA> {
  final url = "http://10.0.2.2:3000/psa/getCarac";
  var _caracJson = [];

  void fetchCarac() async {
    try {
      final response = await get(Uri.parse(url));
      final jsonData = jsonDecode(response.body) as List;

      setState(() {
        _caracJson = jsonData;
      });

      print(_caracJson);
    } catch (err) {
      print(err);
    }
  }

  @override
  void initState() {
    super.initState();
    fetchCarac();
  }

  @override
  Widget build(BuildContext context) {
    String dropdownValue = 'Select Caracteristic';
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(),
        title: Text("Create PSA profile"),
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: _caracJson.length,
          itemBuilder: (context, i) {
            final post = _caracJson[i];
            print(post);
            return DropdownButton<String>(
              value: dropdownValue,
              icon: const Icon(Icons.arrow_downward),
              elevation: 16,
              style: const TextStyle(color: Colors.deepPurple),
              underline: Container(
                height: 2,
                color: Colors.deepPurpleAccent,
              ),
              onChanged: (String? newValue) {
                setState(() {
                  dropdownValue = newValue!;
                });
              },
              items: <String>['Select Caracteristic', 'Two', 'Free', 'Four']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            );
          }),
    );
  }
}
