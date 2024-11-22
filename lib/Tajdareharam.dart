import 'package:app/My-music.dart';
import 'package:app/Song2.dart';
import 'package:app/gulabi.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:app/Favourties.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Tajdareharam extends StatefulWidget {
  const Tajdareharam({super.key});

  @override
  State<Tajdareharam> createState() => _TajdareharamState();
}

class _TajdareharamState extends State<Tajdareharam> {
  final player = AudioPlayer();
  bool isPlaying = false;
  int counter = 0;

  Duration duration =
      Duration.zero; //duration variable for duration of the audio
  Duration position = Duration.zero; //Position variable for position

  String formattime(int seconds) {
    return '${(Duration(seconds: seconds))}'.split('.')[0].padLeft(8, '0');
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    player.onPlayerStateChanged.listen((state) {
      setState(() {
        isPlaying = state == PlayerState.playing;
      });
    });
    player.onDurationChanged.listen((newDuration) {
      setState(() {
        duration = newDuration;
      });
    });

    player.onPositionChanged.listen((newPosition) {
      position = newPosition;
    });
    print("setstate function called!");
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            backgroundColor: Colors.black,
            leading: IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => mymusic()));
              },
              icon: Icon(CupertinoIcons.arrowtriangle_left_fill,
                  color: Colors.white),
            ),
            title: Text(
              'Now Playing',
              style: TextStyle(fontFamily: 'font1', color: Colors.white),
            ),
            centerTitle: true,
          ),
          body: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              Center(
                child: Container(
                  height: 300,
                  width: 300,
                  child: Card(
                    child: Image(
                      image: NetworkImage(
                          'https://source.boomplaymusic.com/group10/M00/12/15/10c94cc0486345f3aa2878afe0c334b8_464_464.jpg'),
                    ),
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          spreadRadius: 4.0,
                        )
                      ]),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 100, left: 20),
                    child: Text(
                      "Tajdar-e-Haram",
                      style: TextStyle(
                          fontFamily: 'font1',
                          color: Colors.white,
                          fontSize: 20),
                    ),
                  ),
                  SizedBox(
                    width: 60,
                  ),
                  InkWell(
                    onTap: () async {
                      SharedPreferences sp =
                          await SharedPreferences.getInstance();
                      int count = sp.getInt('like') ?? 0;
                      counter = sp.getInt('check') ?? 0;
                      if (count == 0) {
                        sp.setInt('like', 1);
                        fav(song_name: 'tjdh.mp3');
                        // Navigator.push(context, MaterialPageRoute(builder: (context)=>fav(song_name: 'tjdh.mp3')));
                        sp.setInt('check' , 1);
                        setState(() {});
                      } else {
                        sp.setInt('like', 0);
                        sp.setInt('check' , 0);
                        fav(song_name: 'song_removed');
                        // Navigator.push(context, MaterialPageRoute(builder: (context)=>fav(song_name: "Song removed")));
                        setState(() {});
                      }
                    },
                    child: Container(
                      height: 30,
                      width: 30,
                      child: Icon(counter == 0
                            ? CupertinoIcons.heart_fill
                            : CupertinoIcons.heart,
                        color: Colors.red,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 140),
                child: Text(
                  "By Atif Aslam",
                  style: TextStyle(
                      fontFamily: 'font1', color: Colors.white, fontSize: 20),
                ),
              ),
              SizedBox(
                height: 70,
              ),
              SliderTheme(
                data: const SliderThemeData(
                  activeTrackColor: Colors.red,
                  inactiveTrackColor: Colors.white,
                  thumbColor: Colors.red,
                  thumbShape: RoundSliderThumbShape(enabledThumbRadius: 12.0),
                  overlayShape: RoundSliderOverlayShape(overlayRadius: 24.0),
                ),
                child: Slider(
                    min: 0,
                    max: duration.inSeconds.toDouble(),
                    value: position.inSeconds
                        .toDouble(), //value perimeter is used to get current slider position
                    onChanged: (value) {
                      final position = Duration(seconds: value.toInt());
                      player.seek(position);
                      player.resume();
                    }),
              ),
              Container(
                //to display the timestamp
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    Text(
                      formattime(position.inSeconds),
                      style: TextStyle(color: Colors.white),
                    ), //Here positon will be subtracted from duration
                    Text(
                      formattime((duration - position).inSeconds),
                      style: TextStyle(color: Colors.white),
                    ),
                    // We need a function over here for formatting the time
                  ],
                ),
              ),
              Row(
                children: [
                  SizedBox(
                    width: 90,
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => gulabi()));
                    },
                    icon: Icon(CupertinoIcons.backward_end_fill),
                    color: Colors.white,
                    iconSize: 40,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  IconButton(
                    icon: Icon(isPlaying
                        ? CupertinoIcons.pause_fill
                        : CupertinoIcons.play_arrow_solid),
                    color: Colors.white,
                    iconSize: 40,
                    onPressed: () {
                      if (isPlaying) {
                        player.pause();
                      } else {
                        player.play(AssetSource('tjdh.mp3'));
                      }
                    },
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  IconButton(
                    onPressed: () {
                      player.stop();
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => song()));
                    },
                    icon: Icon(CupertinoIcons.forward_end_fill),
                    color: Colors.white,
                    iconSize: 40,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  IconButton(
                    onPressed: () {
                      player.stop();
                    },
                    icon: Icon(CupertinoIcons.shuffle),
                    color: Colors.red,
                    iconSize: 30,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
