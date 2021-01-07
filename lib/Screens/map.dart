import 'package:Ecomapp/Screens/drawers.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_config/flutter_config.dart';

class Map extends StatefulWidget {
  @override
  _Map createState() => new _Map();
}

class _Map extends State<Map> {
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
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: GoogleMap(
            initialCameraPosition: CameraPosition(
                target: LatLng(40.84474509964071, -73.88265819913236),
                zoom: 12.0)),
      ),
    );
  }
}
