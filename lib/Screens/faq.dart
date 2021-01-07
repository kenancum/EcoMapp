import 'package:flutter/material.dart';
import 'package:Ecomapp/Screens/drawers.dart';

class Faq extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<Faq> {
  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey =
        new GlobalKey<ScaffoldState>();

    return Scaffold(
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
                  child: Text('Lorem ipsum dolor sit amet',
                      style: TextStyle(
                          color: Colors.white,
                          decoration: TextDecoration.underline,
                          decorationColor: Colors.black,
                          fontSize: 30,
                          fontWeight: FontWeight.bold))),
              Container(
                  padding: EdgeInsets.all(20),
                  child: Text(
                      'Consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                      style: TextStyle(color: Colors.white, fontSize: 20))),
              Container(
                  padding: EdgeInsets.all(20),
                  child: Text('Lorem ipsum dolor sit amet',
                      style: TextStyle(
                          color: Colors.white,
                          decoration: TextDecoration.underline,
                          decorationColor: Colors.black,
                          fontSize: 30,
                          fontWeight: FontWeight.bold))),
              Container(
                  padding: EdgeInsets.all(20),
                  child: Text(
                      'Consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                      style: TextStyle(color: Colors.white, fontSize: 20)))
            ],
          )
        ],
      )),
    );
  }
}
