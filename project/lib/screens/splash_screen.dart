import 'dart:async';
import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_music_player/screens/homepage.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SplashScreen extends StatefulWidget {
  static final String id = 'loading_screen';

  @override
  _SplashScreenState createState() => _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  Duration timeout = const Duration(seconds: 3);
  Duration ms = const Duration(milliseconds: 1);

  startTimeout([int milliseconds]) {
    var duration = milliseconds == null ? timeout : ms * milliseconds;
    return new Timer(duration, handleTimeout);
  }

  void handleTimeout() {
    Navigator.pushNamed(context, Homepage.id);
  }

  @override
  void initState() {
    startTimeout(null);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,

        children: [
          Text(
            "Hertz",
            style: TextStyle(color: Colors.pink[100],fontSize: 30),
          ),
          Text(
            "A complete musical app",
            textScaleFactor: 0.4,
          style: TextStyle(color: Colors.white),),
          Padding(padding: EdgeInsets.symmetric(vertical: 10),),
          SpinKitWave(
            color: Colors.pink,
            size: 50.0,
            controller: AnimationController(
                vsync: this, duration: const Duration(milliseconds: 1200),animationBehavior: AnimationBehavior.normal),
          ),

        ],
      ),

    );
  }
}
