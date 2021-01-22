import 'dart:collection';
import 'dart:convert';
import 'package:Ecomapp/Models/RecycleBin.dart';
import 'package:Ecomapp/Screens/drawers.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;

class GMap extends StatefulWidget {
  @override
  _GMap createState() => new _GMap();
}

class _GMap extends State<GMap> {
  String url = "https://data.cityofnewyork.us/resource/sxx4-xhzg.json";
  List<RecycleBin> recycleBinList;
  Set<Marker> _markers = HashSet<Marker>();
  GoogleMapController _mapController;
  void _onMapCreated(GoogleMapController controller) async {
    _mapController = controller;
  }

  Future<List<RecycleBin>> getRecycleBins() async {
    final response = await http.get(url);

    if (response.statusCode == 200) {
      List<RecycleBin> recycleBinList = parseRecycleBins(response.body);
      return recycleBinList;
    }
  }

  List<RecycleBin> parseRecycleBins(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<RecycleBin>((json) => RecycleBin.fromJson(json)).toList();
  }

  Future loadMarkers() async {
    recycleBinList = await getRecycleBins();

    setState(() {
      for (int i = 0; i < recycleBinList.length; i++) {
        if (recycleBinList[i].longitude != null) {
          _markers.add(Marker(
              markerId: MarkerId(i.toString()),
              position: LatLng(double.parse(recycleBinList[i].latitude),
                  double.parse(recycleBinList[i].longitude)),
              infoWindow: InfoWindow(
                  title: recycleBinList[i].address,
                  snippet: recycleBinList[i].siteType)));
        }
      }
    });
  }

  @override
  void initState() {
    super.initState();
    loadMarkers();
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey =
        new GlobalKey<ScaffoldState>();
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      key: _scaffoldKey,
      drawer: ProfileDrawer(),
      endDrawer: MenuDrawer(),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.0),
        child: AppBar(
          backgroundColor: Colors.blueGrey[900],
          centerTitle: true,
          title: Text("EcoMapp", style: TextStyle(fontSize: 24)),
          leading: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Transform.scale(
              scale: 1.5,
              child: IconButton(
                icon: const Icon(Icons.person_rounded),
                tooltip: 'Profile',
                onPressed: () => _scaffoldKey.currentState.openDrawer(),
              ),
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Transform.scale(
                scale: 1.5,
                child: IconButton(
                  icon: const Icon(Icons.list_rounded),
                  tooltip: 'Menu',
                  onPressed: () => _scaffoldKey.currentState.openEndDrawer(),
                ),
              ),
            ),
          ],
          elevation: 0,
        ),
      ),
      body: Stack(children: <Widget>[
        GoogleMap(
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
            target: LatLng(40.84474509964071, -73.88265819913236),
            zoom: 12.0,
          ),
          markers: _markers,
        ),
      ]),
    );
  }
}
