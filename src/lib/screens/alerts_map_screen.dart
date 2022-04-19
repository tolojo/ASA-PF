import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart' as latLng;

class mapScreenAlert extends StatefulWidget {
  mapScreenAlert({Key? key}) : super(key: key);

  @override
  State<mapScreenAlert> createState() => _mapScreenAlertState();
}

class _mapScreenAlertState extends State<mapScreenAlert> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FlutterMap(
      options: MapOptions(
        center: latLng.LatLng(51.5, -0.09),
        zoom: 13.0,
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
              point: latLng.LatLng(51.5, -0.09),
              builder: (ctx) => Container(
                child: FlutterLogo(),
              ),
            ),
          ],
        ),
      ],
    ));
  }
}
