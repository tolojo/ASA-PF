import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:src/screens/home.dart';

class CreatePSA extends StatefulWidget {
  CreatePSA({Key? key}) : super(key: key);

  @override
  State<CreatePSA> createState() => _CreatePSAState();
}

class _CreatePSAState extends State<CreatePSA> {
  final url = "http://10.0.2.2:3000/psa/getCarac";
  var _caracJson = null;

  void fetchCarac() async {
    try {
      final response = await get(Uri.parse(url));
      final jsonData = jsonDecode(response.body) as List;

      setState(() {
        _caracJson = jsonData;
      });
    } catch (err) {
      print(err);
    }
  }

  Future<Response> sendPSA(List form) {
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

  int? sValue1 = 1;
  int? sValue2 = 3;
  int? sValue3 = 5;
  int? sValue4 = 7;
  int? sValue5 = 9;
  int? sValue6 = 11;

  var form = [];
  Widget build(context) {
    while (_caracJson == null) {
      return Scaffold(
        appBar: AppBar(
          leading: const BackButton(),
          title: const Text("Create PSA profile"),
          centerTitle: true,
        ),
        body: const Center(child: Text("loading")),
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

      return Scaffold(
        appBar: AppBar(
          leading: const BackButton(),
          title: const Text("Create PSA Profile"),
          centerTitle: true,
          backgroundColor: const Color(0xFF9DD6E2),
        ),
        body: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Cor dos Olhos",
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'Quicksand',
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF537597),
                        ),
                      ),
                    ),
                    DropdownButton(
                      value: sValue1,
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
                      onChanged: (int? _value) => {
                        setState(() {
                          sValue1 = _value!;
                        }),
                        print(val1),
                        val1 = _value.toString(),
                        form.add(val1),
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Estatura",
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'Quicksand',
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF537597),
                        ),
                      ),
                    ),
                    DropdownButton(
                      value: sValue2,
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
                      onChanged: (int? _value) => {
                        setState(() {
                          sValue2 = _value!;
                        }),
                        val2 = _value.toString(),
                        print(val2),
                        form.add(val2)
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Cor do Cabelo",
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'Quicksand',
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF537597),
                        ),
                      ),
                    ),
                    DropdownButton(
                      value: sValue3,
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
                      onChanged: (int? _value) => {
                        setState(() {
                          sValue3 = _value!;
                        }),
                        val3 = _value.toString(),
                        print(val3),
                        form.add(val3),
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Idade Aparente",
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'Quicksand',
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF537597),
                        ),
                      ),
                    ),
                    DropdownButton(
                      value: sValue4,
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
                      onChanged: (int? _value) => {
                        setState(() {
                          sValue4 = _value!;
                        }),
                        val4 = _value.toString(),
                        print(val4),
                        form.add(val4),
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Acessorios",
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'Quicksand',
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF537597),
                        ),
                      ),
                    ),
                    DropdownButton(
                      value: sValue5,
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
                      onChanged: (int? _value) => {
                        setState(() {
                          sValue5 = _value!;
                        }),
                        val5 = _value.toString(),
                        print(val5),
                        form.add(val5),
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Tonalidade da Pele",
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'Quicksand',
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF537597),
                        ),
                      ),
                    ),
                    DropdownButton(
                      value: sValue6,
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
                      onChanged: (int? _value) => {
                        setState(() {
                          sValue6 = _value!;
                        }),
                        val6 = _value.toString(),
                        print(val6),
                        form.add(val6),
                      },
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.fromLTRB(52, 20, 52, 20),
                    primary: const Color(0xFF77BECE),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12))),
                onPressed: () {
                  sendPSA(form);
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => const Home()));
                },
                child: const Text(
                  "Submeter",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Roboto',
                    fontSize: 20,
                    color: Color(0xFFFFFFFF),
                  ),
                ),
              )
            ],
          ),
        ),
      );
    }

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
