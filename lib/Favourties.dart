import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:app/Song2.dart';
import 'package:app/Tajdareharam.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class fav extends StatefulWidget {
  final String song_name;
  fav({super.key, required this.song_name});

  @override
  State<fav> createState() => _favState();
}

class _favState extends State<fav> {
  bool selected = false;
  final player = AudioPlayer();

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
                    MaterialPageRoute(builder: (context) => Tajdareharam()));
              },
              icon: Icon(
                CupertinoIcons.arrowtriangle_left_fill,
                color: Colors.white,
              ),
            ),
            centerTitle: true,
            title: Text(
              "My Favourites",
              style: TextStyle(fontFamily: 'font1', color: Colors.white),
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
              IconButton(onPressed: (){
                // player.play(AssetSource());
                player.stop();
              },
                  icon: Icon(
                    CupertinoIcons.airplane,
                    color: Colors.white,
                  )



              )

              // SizedBox(
              //   height: 20,
              // ),
              // Container(
              //   child: Row(
              //     children: [
              //       Container(
              //         height: 100,
              //         width: 100,
              //         decoration: BoxDecoration(shape: BoxShape.circle),
              //         child: CircleAvatar(
              //             backgroundImage: NetworkImage(
              //                 'https://source.boomplaymusic.com/group10/M00/12/15/10c94cc0486345f3aa2878afe0c334b8_464_464.jpg')),
              //       ),
              //       SizedBox(
              //         width: 70,
              //         height: 20,
              //       ),
              //       Container(
              //         height: 100,
              //         width: 200,
              //         decoration: BoxDecoration(
              //             borderRadius: BorderRadius.circular(20),
              //             boxShadow: [
              //               BoxShadow(color: Colors.red, spreadRadius: 1)
              //             ]),
              //         child: Row(
              //           children: [
              //             SizedBox(
              //               width: 30,
              //             ),
              //             IconButton(
              //               onPressed: () async {
              //                 SharedPreferences sp =
              //                     await SharedPreferences.getInstance();
              //                 int count = sp.getInt('pause') ?? 0;
              //                 if (count == 0) {
              //                   player.pause();
              //                 }
              //               },
              //               icon: Icon(
              //                 CupertinoIcons.square_stack_3d_down_dottedline,
              //                 color: Colors.black,
              //               ),
              //             ),
              //             IconButton(
              //               onPressed: () async {
              //                 SharedPreferences sp =
              //                     await SharedPreferences.getInstance();
              //                 int count = sp.getInt('get') ?? 0;
              //                 if (count == 0) {
              //                   player.play(AssetSource(widget.song_name));
              //                   sp.setInt('get', 1);
              //                   selected = true;
              //                   setState(() {});
              //                 } else {
              //                   player.stop();
              //                   sp.setInt('get', 0);
              //                   selected = false;
              //                   setState(() {});
              //                 }
              //               },
              //               icon: Icon(
              //                 selected
              //                     ? CupertinoIcons.pause_fill
              //                     : CupertinoIcons.play_arrow_solid,
              //                 color: Colors.white,
              //               ),
              //             ),
              //           ],
              //         ),
              //       ),
              //     ],
              //   ),
              // ),

            ],
          ),
        ),
      ),
    );
  }
}
