import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:src/screens/create_PSA_screen.dart';

class CreatePsaName extends StatefulWidget {
  CreatePsaName({Key? key}) : super(key: key);

  @override
  State<CreatePsaName> createState() => _CreatePsaNameState();
}

Future<Response> sendPSA(String namePsa) {
  print(namePsa);
  var map = {"name": namePsa};

  return post(
    Uri.parse("http://10.0.2.2:3000/psa/savePsaName"),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(map),
  );
}

class _CreatePsaNameState extends State<CreatePsaName> {
  TextEditingController nomePSAcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ASA Psa Name"),
        centerTitle: true,
        backgroundColor: const Color(0xFF9DD6E2),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Center(
          child: Form(
            child: Column(
              children: [
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Nome do PSA",
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Quicksand',
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF537597),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: nomePSAcontroller,
                  maxLines: 1,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontFamily: 'Quicksand',
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                      color: Color(0xFFD3D3D3)),
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.fromLTRB(52, 20, 52, 20),
                      primary: const Color(0xFF77BECE),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12))),
                  onPressed: () {
                    sendPSA(nomePSAcontroller.text);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => CreatePSA()));
                  },
                  child: const Text(
                    "Registar Nome",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Roboto',
                        fontSize: 16,
                        color: Color(0xFFFFFFFF)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
