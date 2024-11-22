import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:app/Tajdareharam.dart';
import 'package:app/splashscreen.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:audioplayers_web/num_extension.dart';

class mymusic extends StatefulWidget {
  const mymusic({super.key});

  @override
  State<mymusic> createState() => _mymusicState();
}

class _mymusicState extends State<mymusic> {
  final player = AudioPlayer();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            backgroundColor: Colors.blueGrey,
            leading: IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Tajdareharam()));
              },
              icon: Icon(
                CupertinoIcons.arrowtriangle_left_fill,
                color: Colors.black,
              ),
            ),
            centerTitle: true,
            title: Text(
              "My Playlist",
              style: TextStyle(fontFamily: 'font1'),
            ),
            actions: [
              SizedBox(
                width: 10,
              ),
              Badge(
                label: AnimatedTextKit(
                  animatedTexts: [RotateAnimatedText('3')],
                  totalRepeatCount: 100,
                ),
                largeSize: 17,
                textColor: Colors.black,
                backgroundColor: Colors.red,
                child: InkWell(
                  onTap: () {
                    // Navigator.push(context, MaterialPageRoute(builder: (context)=>))
                  },
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://images.pexels.com/photos/27383422/pexels-photo-27383422/free-photo-of-a-greenhouse-with-a-glass-door-and-plants.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load'),
                    radius: 25,
                  ),
                ),
              )
            ],
          ),
          body: Column(
            children: [
              SizedBox(
                height: 80,
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      String imageurls = ' ', text = ' ';
                      String subtitle = ' ';
                      int i = 0;
                      if (index == 0) {
                        imageurls =
                            'https://image-cdn-ak.spotifycdn.com/image/ab67706c0000da8454b133282efaec2a07cc05fc';
                        text = "Without-Me";
                        subtitle = "song by Eminem";
                      } else if (index == 1) {
                        imageurls =
                            'https://static.toiimg.com/thumb/msid-80172462,width-400,resizemode-4/80172462.jpg';
                        text = "Tajdar-e-Haram";
                        subtitle = "song by Atif Aslam";
                      } else if (index == 2) {
                        text = "Gulabi";
                        subtitle = "song by Sukwinder Singh";
                        imageurls =
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT9K93oRUNUyJ-W_TJqsP9IxTTAEh17YzcAwA&s';
                      }
                      // else if (index == 3) {
                      //   text = "George_Cooper";
                      //   number = 3;
                      //
                      //   imageurl =
                      //       'https://images.pexels.com/photos/7319346/pexels-photo-7319346.jpeg?auto=compress&cs=tinysrgb&w=600';
                      // }
                      // else if (index == 4) {
                      //   text = "Aries";
                      //   number = 4;
                      //
                      //   imageurl =
                      //       'https://images.pexels.com/photos/1906157/pexels-photo-1906157.jpeg?auto=compress&cs=tinysrgb&w=600';
                      // } else if (index == 5) {
                      //   number = 5;
                      //
                      //   imageurl =
                      //       'https://images.pexels.com/photos/3775156/pexels-photo-3775156.jpeg?auto=compress&cs=tinysrgb&w=600';
                      //   text = 'Nancy';
                      // } else if (index == 6) {
                      //   number = 6;
                      //
                      //   text = "Angelina";
                      //
                      //   imageurl =
                      //       'https://images.pexels.com/photos/5561354/pexels-photo-5561354.jpeg?auto=compress&cs=tinysrgb&w=600';
                      // } else if (index == 7) {
                      //   number = 7;
                      //
                      //   text = "George_Cooper";
                      //   imageurl =
                      //       'https://images.pexels.com/photos/7319346/pexels-photo-7319346.jpeg?auto=compress&cs=tinysrgb&w=600';
                      // } else if (index == 8) {
                      //   number = 8;
                      //
                      //   text = "Aries";
                      //
                      //   imageurl =
                      //       'https://images.pexels.com/photos/1906157/pexels-photo-1906157.jpeg?auto=compress&cs=tinysrgb&w=600';
                      // } else {
                      //   number = 9;
                      //
                      //   imageurl =
                      //       'https://images.pexels.com/photos/3775156/pexels-photo-3775156.jpeg?auto=compress&cs=tinysrgb&w=600';
                      //   text = 'Nancy';
                      // }
                      return Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Container(
                          height: 100,
                          width: 300,
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(20),
                              border:
                                  Border.all(color: Colors.blueGrey, width: 3)),
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundImage: NetworkImage(imageurls),
                            ),
                            title: Text(
                              text,
                              style: TextStyle(color: Colors.white),
                            ),
                            subtitle: Text(
                              subtitle,
                              style: TextStyle(color: Colors.white),
                            ),
                            trailing: InkWell(
                              onTap: () {},
                              child: InkWell(
                                onTap: () {
                                  // player.play(AssetSource("tjdh.mp3"));
                                },
                                child: Icon(
                                  CupertinoIcons.play_arrow_solid,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
