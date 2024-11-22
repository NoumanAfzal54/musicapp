import 'package:app/Favourties.dart';
import 'package:app/My-music.dart';
import 'package:app/Tajdareharam.dart';
import 'package:app/gulabi.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class song extends StatefulWidget {
  const song({super.key});

  @override
  State<song> createState() => _songState();
}

class _songState extends State<song> {
  int counter = 0;
  final player = AudioPlayer();
  bool isPlaying = false; //use to check whether song is playing or not
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
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          spreadRadius: 4.0,
                        )
                      ]),
                  child: Image(
                    fit: BoxFit.fill,
                    image: NetworkImage(
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSfcc7wbJjAhP0RfTA9XZEV_xWz0ke6tnJnmw&s'),
                  ),
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
                      "Without-Me",
                      style: TextStyle(
                          fontFamily: 'font1',
                          color: Colors.white,
                          fontSize: 20),
                    ),
                  ),
                  SizedBox(
                    width: 80,
                  ),
                  InkWell(
                    onTap: () async {
                      SharedPreferences sp =
                          await SharedPreferences.getInstance();
                      int count = sp.getInt('likes') ?? 0;
                      counter = sp.getInt('checks') ?? 0;
                      if (count == 0) {
                        sp.setInt('likes', 1);
                        fav(song_name: 'song2.mp3');
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) =>
                        //             fav(song_name: 'song2.mp3')));
                        sp.setInt('checks', 1);
                        setState(() {});
                      } else {
                        sp.setInt('likes', 0);
                        sp.setInt('checks', 0);
                        fav(song_name: 'songremoved');
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) =>
                        //
                            //             fav(song_name: "Song removed")));

                        setState(() {});
                      }
                    },
                    child: Container(
                      height: 30,
                      width: 30,
                      child: Icon(
                        counter == 0
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
                  "By Eminem",
                  style: TextStyle(
                      fontFamily: 'font1', color: Colors.white, fontSize: 20),
                ),
              ),
              SizedBox(
                height: 70,
              ),
              //min =0 (start) and maxvalue in seconds
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
                      player.stop();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Tajdareharam()));
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
                        player.play(AssetSource('song3.mp3'));
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
                          MaterialPageRoute(builder: (context) => gulabi()));
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

                  // IconButton(onPressed: (){
                  //   Player.stop();
                  // }, icon: Icon(CupertinoIcons.pause_fill),color: Colors.white,iconSize: 40,)
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
