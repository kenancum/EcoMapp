import 'package:flutter/material.dart';
import 'Screens/home.dart';
import 'Screens/events.dart';
import 'Screens/about_us.dart';
import 'Screens/donate.dart';
import 'Screens/faq.dart';
import 'Screens/settings.dart';
import 'Screens/map.dart';
import 'package:flutter_config/flutter_config.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterConfig.loadEnvVariables();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: "/",
    routes: {
      "/": (context) => HomePage(),
      "/events": (context) => Events(),
      "/about_us": (context) => AboutUs(),
      "/donate": (context) => Donate(),
      "/faq": (context) => Faq(),
      "/settings": (context) => Settings(),
      "/map": (context) => GMap()
    },
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EcoMapp',
      home: HomePage(),
    );
  }
}
