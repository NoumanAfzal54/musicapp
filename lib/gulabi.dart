import 'package:app/My-music.dart';
import 'package:app/Tajdareharam.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class gulabi extends StatefulWidget {
  const gulabi({super.key});

  @override
  State<gulabi> createState() => _gulabiState();
}

class _gulabiState extends State<gulabi> {
  final player = AudioPlayer();
  Duration duration = Duration.zero;
  Duration position = Duration.zero;
  String formattime(int seconds) {
    return '${(Duration(seconds: seconds))}'.split('.')[0].padLeft(8, '0');
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
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQSbCwbTx8H1S--AZW42Iq3txak_v3a0elSZA&s'),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 100, left: 20),
                    child: Text(
                      "Dil Ibadat",
                      style: TextStyle(
                          fontFamily: 'font1',
                          color: Colors.white,
                          fontSize: 20),
                    ),
                  ),
                  SizedBox(
                    width: 130,
                  ),
                  Icon(
                    CupertinoIcons.heart_fill,
                    color: Colors.red,
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 200),
                child: Text(
                  "By KK",
                  style: TextStyle(
                      fontFamily: 'font1', color: Colors.white, fontSize: 20),
                ),
              ),
              SizedBox(
                height: 110,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 100,
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => mymusic()));
                    },
                    icon: Icon(CupertinoIcons.backward_end_fill),
                    color: Colors.white,
                    iconSize: 40,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  IconButton(
                    onPressed: () {
                      player.play(AssetSource('dilibadat.mp3'));
                      player.setVolume(1.0);
                    },
                    icon: Icon(CupertinoIcons.play_arrow_solid),
                    color: Colors.white,
                    iconSize: 40,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  IconButton(
                    onPressed: () {
                      player.stop();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Tajdareharam()));
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
