import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlng/latlng.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:src/screens/alerts_screen.dart';
import 'package:src/screens/home.dart';

class CreateAlert extends StatefulWidget {
  CreateAlert({Key? key}) : super(key: key);

  @override
  State<CreateAlert> createState() => _CreateAlertState();
}

class _CreateAlertState extends State<CreateAlert> {
  String urlPsa = "https://asa-pf.herokuapp.com/psa";
  String urlAlerta = "https://asa-pf.herokuapp.com/alerta";
  var _PsaJson = null;
  var psaIds = [];
  var psaNomes = [];
  var tAlertaIds = [];
  var tAlertaNomes = [];
  late Position position;
  late var nomeAlerta, descricaoAlerta;
  TextEditingController nomeAlertaController = TextEditingController();
  TextEditingController descricaoAlertaController = TextEditingController();

  List<DropdownMenuItem<String>> menuItems = [];
  List<DropdownMenuItem<String>> menuTAlertaItems = [];
  String? sValue = "1";
  String? tValue = "1";
  late var userId;

  Future<void> fetchUserID() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    userId = prefs.getString('id');
    print("User ID:" + userId);
  }

  void fetchPSA() async {
    try {
      final response = await get(Uri.parse(urlPsa));
      final jsonData = jsonDecode(response.body) as List;

      for (int i = 0; i < jsonData.length; i++) {
        var psaAux = jsonData[i];
        psaIds.add(psaAux["psa_id"]);
        psaNomes.add(psaAux["psa_nome_provisorio"]);
      }
      for (int i = 0; i < psaIds.length; i++) {
        menuItems.add(DropdownMenuItem(
            value: "${psaIds[i]}",
            child: Center(
                child: Text("ID: ${psaIds[i]} - Nome: ${psaNomes[i]}"))));
      }
      setState(() {
        _PsaJson = jsonData;
      });
    } catch (err) {
      print(err);
    }
  }

  void fetchTipoAlerta() async {
    try {
      final response = await get(Uri.parse(urlAlerta + "/tipo"));
      final jsonData = jsonDecode(response.body) as List;

      for (int i = 0; i < jsonData.length; i++) {
        var psaAux = jsonData[i];
        tAlertaIds.add(psaAux["ta_id"]);
        tAlertaNomes.add(psaAux["ta_descricao"]);
      }
      for (int i = 0; i < tAlertaIds.length; i++) {
        menuTAlertaItems.add(DropdownMenuItem(
            value: "${tAlertaIds[i]}",
            child: Center(
                child: Text(
                    "Urgencia: ${tAlertaIds[i]} - Descrição: ${tAlertaNomes[i]}"))));
      }
      setState(() {
        _PsaJson = jsonData;
      });
    } catch (err) {
      print(err);
    }
  }

  Future<Response> createAlerta(nome, descricao, lat, lng, pessoaId, tipoId) {
    Map alerta = {
      "alerta_nome": nome,
      "alerta_descricao": descricao,
      "alerta_localizacao_lat": lat,
      "alerta_localizacao_lng": lng,
      "alerta_pessoa_id": pessoaId,
      "alerta_ta_id": tipoId
    };

    return post(
      Uri.parse("https://asa-pf.herokuapp.com/alerta/saveAlerta"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(alerta),
    );
  }

  Future<Response> createAlertaPsa(psaId) {
    Map psa = {"caracteristicas_alerta_psa_id": psaId};

    return post(
      Uri.parse("http://10.0.2.2:3000/alerta/saveAlertaPsa"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(psa),
    );
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.

    return await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high)
        .then((location) {
      if (location != null) {
        position = location;
        print(position);
      }
      return location;
    });
  }

  @override
  void initState() {
    super.initState();
    _determinePosition();
    fetchPSA();
    fetchTipoAlerta();
    fetchUserID();
  }

  @override
  Widget build(BuildContext context) {
    while (_PsaJson == null) {
      return Scaffold(
        appBar: AppBar(
          leading: const BackButton(),
          title: const Text("Create Alerta"),
          centerTitle: true,
          backgroundColor: const Color(0xFF9DD6E2),
        ),
        body: const Center(child: Text("loading...")),
      );
    }

    while (_PsaJson != null) {
      print(sValue);
      print(tValue);
      return Scaffold(
        appBar: AppBar(
          leading: const BackButton(),
          title: const Text("Create Alerta"),
          centerTitle: true,
          backgroundColor: const Color(0xFF9DD6E2),
        ),
        body: Center(
          child: ListView(
            children: [
              Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(children: [
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Nome do Alerta",
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
                    TextField(
                      style: const TextStyle(
                        color: Color(0xFFD3D3D3),
                        fontFamily: 'Quicksand',
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      controller: nomeAlertaController,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Descrição do Alerta",
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
                    TextField(
                      style: const TextStyle(
                        color: Color(0xFFD3D3D3),
                        fontFamily: 'Quicksand',
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      controller: descricaoAlertaController,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Tipo de Urgência",
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
                    DropdownButton(
                        value: tValue,
                        items: menuTAlertaItems,
                        onChanged: (String? _value) => {
                              setState(() {
                                tValue = _value;
                              }),
                            }),
                    const SizedBox(
                      height: 10,
                    ),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Qual o PSA?",
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
                    DropdownButton(
                        value: sValue,
                        items: menuItems,
                        onChanged: (String? _value) => {
                              setState(() {
                                sValue = _value;
                              }),
                            }),
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
                        createAlerta(
                            nomeAlertaController.text,
                            descricaoAlertaController.text,
                            position.latitude,
                            position.longitude,
                            userId,
                            tValue);
                        createAlertaPsa(sValue);

                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => const Home()));
                      },
                      child: const Text(
                        "Enviar Alerta",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Roboto',
                            fontSize: 20,
                            color: Color(0xFFFFFFFF)),
                      ),
                    )
                  ])),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: const Text("Create Alerta"),
        centerTitle: true,
        backgroundColor: const Color(0xFF9DD6E2),
      ),
    );
  }
}
