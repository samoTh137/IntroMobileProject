import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_map_marker_cluster/flutter_map_marker_cluster.dart';

class Map extends StatefulWidget {
  const Map({Key? key}) : super(key: key);

  @override
  _Map createState() => _Map();
}

class _Map extends State<Map> {
  @override
  Widget build(BuildContext context) {

    LatLng location = LatLng(35.68, 51.41);

    String latString;
    String longString;

    double latD;
    double longD;

    DatabaseReference mapRefLat = FirebaseDatabase.instance.ref('Users/User1/Locatie/Lat');
    mapRefLat.onValue.listen((DatabaseEvent latEvent) {
      final dataLat = latEvent.snapshot.value;
      latString = dataLat.toString();
      latString = latString.substring(1,latString.length-1);
      latD = double.parse(latString);
      location.latitude = latD;
      print(latD);
    });

    DatabaseReference mapRefLong = FirebaseDatabase.instance.ref('Users/User1/Locatie/Long');
    mapRefLong.onValue.listen((DatabaseEvent longEvent) {
      final dataLong = longEvent.snapshot.value;
      longString = dataLong.toString();
      longString = longString.substring(1,longString.length-1);
      longD = double.parse(longString);
      location.longitude = longD;
      print(longD);
    });

    _latLngList.add(location);

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
  /*LatLng(13, 77.5),
  LatLng(13.02, 77.51),
  LatLng(13.05, 77.53),
  LatLng(13.155, 77.54),
  LatLng(13.159, 77.55),
  LatLng(13.17, 77.55),*/
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



/*_retrieveFromFrebase() {
  FirebaseDatabase.instance.ref("Users/User1/Locatie") //TODO: Mogelijk student ID toevoegen
      .get();
  //.then((_) {_error = "Successfully uploaded Location!";showErrorDialog(context);}); //Dialog voor success
  //.catchError((error) {_error = "An error occured! Please try again.";showErrorDialog(context);});
}*/