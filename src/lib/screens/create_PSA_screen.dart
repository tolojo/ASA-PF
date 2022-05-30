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

  Future<Response> sendPSA(List form) {
    print(form);

    return post(
      Uri.parse("http://10.0.2.2:3000/psa/savePsa"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(form),
    );
  }

  @override
  void initState() {
    super.initState();
    fetchCarac();
  }

  Widget build(context) {
    String name = "";
    int i = 0;
    String dropdownValue = "";
    print(_caracJson);

    while (_caracJson == null) {
      return Scaffold(
        appBar: AppBar(
          leading: BackButton(),
          title: Text("Create PSA profile"),
          centerTitle: true,
        ),
        body: Center(child: Text("loading")),
      );
    }

    while (_caracJson != null) {
      final post = _caracJson[0];
      final post1 = _caracJson[1];
      final post2 = _caracJson[2];
      final post3 = _caracJson[3];
      final post4 = _caracJson[4];
      final post5 = _caracJson[5];
      final post6 = _caracJson[6];
      final post7 = _caracJson[7];
      final post8 = _caracJson[8];
      final post9 = _caracJson[9];
      final post10 = _caracJson[10];
      final post11 = _caracJson[11];

      String val1 = "";
      String val2 = "";
      String val3 = "";
      String val4 = "";
      String val5 = "";
      String val6 = "";
      var form = [];
      return Scaffold(
          appBar: AppBar(
            leading: BackButton(),
            title: Text("Create PSA profile"),
            centerTitle: true,
          ),
          body: Center(
            child: Column(
              children: [
                Padding(
                    padding: EdgeInsets.all(15.0),
                    child: DropdownButton(
                      items: [
                        DropdownMenuItem(
                            value: 1,
                            child: Center(
                                child: Text(
                                    "${post["caracteristicas_caracteristica"]}"))),
                        DropdownMenuItem(
                            value: 2,
                            child: Center(
                                child: Text(
                                    "${post1["caracteristicas_caracteristica"]}")))
                      ],
                      hint: Text("caracteristica"),
                      onChanged: (_value) => {
                        val1 = _value.toString(),
                        print(val1),
                        form.add(val1),
                      },
                    )),
                Padding(
                    padding: EdgeInsets.all(15.0),
                    child: DropdownButton(
                      items: [
                        DropdownMenuItem(
                            value: 3,
                            child: Center(
                                child: Text(
                                    "${post2["caracteristicas_caracteristica"]}"))),
                        DropdownMenuItem(
                            value: 4,
                            child: Center(
                                child: Text(
                                    "${post3["caracteristicas_caracteristica"]}")))
                      ],
                      onChanged: (_value) => {
                        val2 = _value.toString(),
                        print(val2),
                        form.add(val2)
                      },
                    )),
                Padding(
                    padding: EdgeInsets.all(15.0),
                    child: DropdownButton(
                      items: [
                        DropdownMenuItem(
                            value: 5,
                            child: Center(
                                child: Text(
                                    "${post4["caracteristicas_caracteristica"]}"))),
                        DropdownMenuItem(
                            value: 6,
                            child: Center(
                                child: Text(
                                    "${post5["caracteristicas_caracteristica"]}")))
                      ],
                      onChanged: (_value) => {
                        val3 = _value.toString(),
                        print(val3),
                        form.add(val3),
                      },
                    )),
                Padding(
                    padding: EdgeInsets.all(15.0),
                    child: DropdownButton(
                      items: [
                        DropdownMenuItem(
                            value: 7,
                            child: Center(
                                child: Text(
                                    "${post6["caracteristicas_caracteristica"]}"))),
                        DropdownMenuItem(
                            value: 8,
                            child: Center(
                                child: Text(
                                    "${post7["caracteristicas_caracteristica"]}")))
                      ],
                      onChanged: (_value) => {
                        val4 = _value.toString(),
                        print(val4),
                        form.add(val4),
                      },
                    )),
                Padding(
                    padding: EdgeInsets.all(15.0),
                    child: DropdownButton(
                      items: [
                        DropdownMenuItem(
                            value: 9,
                            child: Center(
                                child: Text(
                                    "${post8["caracteristicas_caracteristica"]}"))),
                        DropdownMenuItem(
                            value: 10,
                            child: Center(
                                child: Text(
                                    "${post9["caracteristicas_caracteristica"]}")))
                      ],
                      onChanged: (_value) => {
                        val5 = _value.toString(),
                        print(val5),
                        form.add(val5),
                      },
                    )),
                Padding(
                    padding: EdgeInsets.all(15.0),
                    child: DropdownButton(
                      items: [
                        DropdownMenuItem(
                            value: 11,
                            child: Center(
                                child: Text(
                                    "${post10["caracteristicas_caracteristica"]}"))),
                        DropdownMenuItem(
                            value: 12,
                            child: Center(
                                child: Text(
                                    "${post11["caracteristicas_caracteristica"]}")))
                      ],
                      onChanged: (_value) => {
                        val6 = _value.toString(),
                        print(val6),
                        form.add(val6),
                      },
                    )),
                TextButton(
                    onPressed: () {
                      sendPSA(form);
                    },
                    child: Text("Send PSA"))
              ],
            ),
          ));
    }

    return Scaffold(
      appBar: AppBar(
        leading: BackButton(),
        title: Text("Create PSA profile"),
        centerTitle: true,
      ),
      body: Center(child: Text("loading")),
    );
  }
}
