import 'package:flutter/material.dart';
import 'package:Ecomapp/Screens/drawers.dart';

class Settings extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey =
        new GlobalKey<ScaffoldState>();

    return new Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.blueGrey[900],
      key: _scaffoldKey,
      drawer: ProfileDrawer(),
      endDrawer: MenuDrawer(),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.0),
        child: AppBar(
          backgroundColor: Colors.blueGrey[900],
          centerTitle: true,
          title: GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, "/");
            },
            child: new Text("EcoMapp", style: TextStyle(fontSize: 24)),
          ),
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
      body: SingleChildScrollView(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            children: [
              Container(
                  padding: EdgeInsets.all(20),
                  child: Text('Settings',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold))),
            ],
          )
        ],
      )),
    );
  }
}
