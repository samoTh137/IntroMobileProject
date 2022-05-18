import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_map_marker_cluster/flutter_map_marker_cluster.dart';

class Map extends StatefulWidget {
  const Map({Key? key}) : super(key: key);

  @override
  _Map createState() => _Map();
}

class _Map extends State<Map> {
  @override
  Widget build(BuildContext context) {

    //_latLngList.add(LAT, LONG)
    return Scaffold(
        appBar: AppBar(
            automaticallyImplyLeading: false,
            title: const Text('Studenten'),
            backgroundColor: Colors.red[800],
            actions: <Widget>[
              Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: GestureDetector(
                    onTap: () {},
                    child: TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        'Back',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  )),
            ]),
        body: Column(
            children:[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children:[
                Flexible(child :
                  Padding(
                    padding: const EdgeInsets.all(24.0),
                      child: Text(
                        'Locaties examenafleggingen',
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                  ),
                ),
               ],
              ),
            Container(
              height: 600,
              child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children:[
                Flexible(child :
                Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: FlutterMap(options: MapOptions(
                      center: locatieAP,
                      zoom: 8
                  ),
                    layers: [
                      TileLayerOptions(
                        urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                        subdomains: ['a', 'b', 'c'],
                      ),
                      MarkerLayerOptions(
                        markers:
                          _markers,
                      ),



                  ],

                  ),
                ),
                ),

              ],
            ),),


            ],

        )
    );
  }
}

var locatieAP = LatLng(51.23033264668601, 4.413681389072121);

List<LatLng> _latLngList = [
  LatLng(13, 77.5),
  LatLng(13.02, 77.51),
  LatLng(13.05, 77.53),
  LatLng(13.155, 77.54),
  LatLng(13.159, 77.55),
  LatLng(13.17, 77.55),
]; //TODO: Haal locaties van database

List<Marker> _markers = _latLngList
    .map((point) => Marker(
  point: point,
  width: 60,
  height: 60,
  builder: (context) => Icon(
    Icons.pin_drop,
    size: 60,
    color: Colors.red[800],
  ),
))
    .toList();
