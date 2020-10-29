import 'dart:io';
import 'main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_audio_query/flutter_audio_query.dart';
import 'package:flutter_music_player/widget.dart';

class SongWidget extends StatelessWidget {
  final List<SongInfo> songList;

  SongWidget({@required this.songList});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: songList.length,
        itemBuilder: (context, songIndex) {
          SongInfo song = songList[songIndex];
          if (song.displayName.contains(".mp3"))
            return GestureDetector(
                onTap: () {
                  audioManagerInstance
                      .start("file://${song.filePath}", song.title,
                      desc: song.displayName,
                      auto: true,
                      cover: "assets/images/p4.jpg")
                      .then((err) {
                    print(err);
                  });
                },
              child: Card(
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: <Widget>[
                      new Image.asset(
                          'assets/images/p2.jpg',
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.793,
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              width: MediaQuery.of(context).size.width * 0.748,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,

                                children: <Widget>[
                                  Text(song.title,
                                      style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w700)),
                                  Text("Release Year: ${song.year}",
                                      style: TextStyle(
                                          fontSize: 11,
                                          color: Colors.grey,
                                          fontWeight: FontWeight.w500)),
                                  Text("Artist: ${song.artist}",
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontSize: 11,
                                          color: Colors.grey,
                                          fontWeight: FontWeight.w500)),
                                  Text(
                                      "Duration: ${parseToMinutesSeconds(int.parse(song.duration))} min",
                                      style: TextStyle(
                                          fontSize: 11,
                                          color: Colors.grey,
                                          fontWeight: FontWeight.w500)),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );

          return SizedBox(
            height: 0,
          );
        });
  }

  static String parseToMinutesSeconds(int ms) {
    String data;
    Duration duration = Duration(milliseconds: ms);

    int minutes = duration.inMinutes;
    int seconds = (duration.inSeconds) - (minutes * 60);

    data = minutes.toString() + ":";
    if (seconds <= 9) data += "0";

    data += seconds.toString();
    return data;
  }
}
