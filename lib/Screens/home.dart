import 'package:Ecomapp/Screens/drawers.dart';
import 'package:flutter/material.dart';
import 'package:avatar_glow/avatar_glow.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
          height: MediaQuery.of(context).size.height - 140,
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Tap to Locate',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
              SizedBox(
                height: 40,
              ),
              AvatarGlow(
                endRadius: 150.0,
                animate: true,
                child: GestureDetector(
                  onTap: () => Navigator.pushNamed(context, '/map'),
                  child: Material(
                    shape: CircleBorder(),
                    elevation: 8,
                    child: Container(
                      padding: EdgeInsets.all(24),
                      height: 200,
                      width: 200,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.blueGrey[600]),
                      child: Image.asset(
                        "assets/images/recycle-logo.png",
                        color: Colors.lightGreenAccent[700],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'EcoMapp',
                style: TextStyle(color: Colors.white, fontSize: 36),
              )
            ],
          )),
    );
  }
}
