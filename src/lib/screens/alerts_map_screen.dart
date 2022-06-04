import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart' as lat_lng;
import 'package:http/http.dart' as http;

class MapScreenAlert extends StatefulWidget {
  String alertaId;
  MapScreenAlert({required this.alertaId});

  @override
  State<MapScreenAlert> createState() => _MapScreenAlertState(alertaId);
}

class _MapScreenAlertState extends State<MapScreenAlert> {
  String alertaId;
  _MapScreenAlertState(this.alertaId);
  final url = "http://10.0.2.2:3000/alerta/id/";
  final urlP = "http://10.0.2.2:3000/psa/alerta/";
  var _alertaJson;
  var _psaJson;
  String caracs = "";
  String nomePsa = "";

  void fetchAlert() async {
    try {
      final response = await http.get(Uri.parse(url + alertaId));
      final jsonData = jsonDecode(response.body);
      setState(() {
        _alertaJson = jsonData;
      });
    } catch (err) {
      print(err);
    }
  }

  void fetchCaracteristicasPsaAlerta() async {
    try {
      final response = await http.get(Uri.parse(urlP + alertaId));
      final jsonData = jsonDecode(response.body);
      setState(() {
        _psaJson = jsonData;
      });
      var psaAtivo = _psaJson[1];
      nomePsa = "${psaAtivo["psa_nome_provisorio"]}";
      for (var i = 0; i < 6; i++) {
        var caracAtivo = _psaJson[i];
        caracs +=
            "${caracAtivo["tc_nome"]}: ${caracAtivo["caracteristicas_caracteristica"]} \n";
      }
    } catch (err) {
      print(err);
    }
  }

  @override
  void initState() {
    super.initState();
    fetchAlert();
    fetchCaracteristicasPsaAlerta();
  }

  @override
  Widget build(BuildContext context) {
    final post = _alertaJson;
    final postP = _psaJson;
    // print(postP);
    if (postP != null) {
      return Scaffold(
        appBar: AppBar(
          leading: const BackButton(),
          title: Text("${post["alerta_nome"]}"),
          centerTitle: true,
          backgroundColor: const Color(0xFF9DD6E2),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: SizedBox(
                height: 50,
                child: Text("Nome do PSA: " + nomePsa),
              ),
            ),
            SizedBox(
              child: Text(caracs),
            ),
            SizedBox(
              height: 300,
              child: FlutterMap(
                options: MapOptions(
                  center: lat_lng.LatLng(
                      double.parse("${post["alerta_localizacao_lat"]}"),
                      double.parse("${post["alerta_localizacao_lng"]}")),
                  zoom: 16.0,
                ),
                layers: [
                  TileLayerOptions(
                      urlTemplate:
                          "https://api.mapbox.com/styles/v1/jptr0508/cl26p5a73004o15pfylndcghw/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoianB0cjA1MDgiLCJhIjoiY2wyNm94d2hnMGNpMDNjcW4zam94bjB0ZSJ9.1sMUG8qNTw27pAq_YKbihQ",
                      additionalOptions: {
                        'accessToken':
                            'pk.eyJ1IjoianB0cjA1MDgiLCJhIjoiY2wyNm94d2hnMGNpMDNjcW4zam94bjB0ZSJ9.1sMUG8qNTw27pAq_YKbihQ',
                        'id': 'mapbox.mapbox-streets-v8'
                      }),
                  MarkerLayerOptions(
                    markers: [
                      Marker(
                        width: 80.0,
                        height: 80.0,
                        point: lat_lng.LatLng(
                            double.parse("${post["alerta_localizacao_lat"]}"),
                            double.parse("${post["alerta_localizacao_lng"]}")),
                        builder: (ctx) => Container(
                          child: IconButton(
                            icon: Icon(Icons.location_on),
                            color: Colors.blue,
                            iconSize: 45.0,
                            onPressed: () {},
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
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
