import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class MenuDrawer extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MenuDrawerState();
}

class ProfileDrawer extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ProfileDrawerState();
}

class _ProfileDrawerState extends State {
  @override
  Widget build(BuildContext context) {
    return Theme(
        data: Theme.of(context).copyWith(canvasColor: Colors.blueGrey[900]),
        child: new Drawer(
          child: Center(
              child: ElevatedButton(
            child: Text('Login'),
            onPressed: () {
              // Navigate to the second screen using a named route.
              Navigator.pushNamed(context, '/');
            },
          )),
        ));
  }
}

class _MenuDrawerState extends State {
  @override
  Widget build(BuildContext context) {
    return Theme(
        data: Theme.of(context).copyWith(canvasColor: Colors.blueGrey[900]),
        child: new Drawer(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FlatButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/events');
                },
                child: Text("Events",
                    style: TextStyle(color: Colors.white, fontSize: 36)),
              ),
              Divider(
                color: Colors.white,
                height: 80,
                indent: 60,
                endIndent: 60,
                thickness: 2,
              ),
              FlatButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/donate');
                },
                child: Text("Donate",
                    style: TextStyle(color: Colors.white, fontSize: 36)),
              ),
              Divider(
                color: Colors.white,
                height: 80,
                indent: 60,
                endIndent: 60,
                thickness: 2,
              ),
              FlatButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/faq');
                },
                child: Text("F.A.Q.",
                    style: TextStyle(color: Colors.white, fontSize: 36)),
              ),
              Divider(
                color: Colors.white,
                height: 80,
                indent: 60,
                endIndent: 60,
                thickness: 2,
              ),
              FlatButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/about_us');
                },
                child: Text("About Us",
                    style: TextStyle(color: Colors.white, fontSize: 36)),
              ),
              Divider(
                color: Colors.white,
                height: 80,
                indent: 60,
                endIndent: 60,
                thickness: 2,
              ),
              FlatButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/settings');
                },
                child: Text("Settings",
                    style: TextStyle(color: Colors.white, fontSize: 36)),
              ),
            ],
          ),
        ));
  }
}
