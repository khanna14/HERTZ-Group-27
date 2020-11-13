import 'package:flutter/material.dart';
import 'package:assets_audio_player/assets_audio_player.dart';

class Homepage extends StatefulWidget {
  static final String id= "homepage";
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<Homepage> {

  AssetsAudioPlayer _assetsAudioPlayer;

  @override
  void initState() {
    super.initState();
    _assetsAudioPlayer = AssetsAudioPlayer();
    _assetsAudioPlayer.open(
      AssetsAudio(
        asset: "song3.mp3",
        folder: "assets/music/",
      ),
    );
    _assetsAudioPlayer.playOrPause();
  }

  @override
  void dispose() {
    _assetsAudioPlayer = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Asset Audio Example'),
        ),
        body: Container(),
      ),
    );
  }
}

