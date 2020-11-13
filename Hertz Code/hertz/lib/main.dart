import 'package:flutter/material.dart';
import 'screens/Homepage.dart';
import 'screens/loading_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: Homepage.id ,
      routes: {
        LoadingScreen.id :(context) => LoadingScreen(),
        Homepage.id : (context) => Homepage(),
      },
    );
  }
}