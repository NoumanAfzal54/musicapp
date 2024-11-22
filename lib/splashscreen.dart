import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:app/Signup.dart';
import 'package:app/login.dart';
import 'package:flutter/material.dart';

class splashscreen extends StatefulWidget {
  const splashscreen({super.key});

  @override
  State<splashscreen> createState() => _splashscreenState();
}

class _splashscreenState extends State<splashscreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Center(
                child: Image(
                    image: NetworkImage(
                        'https://applemagazine.com/wp-content/uploads/2020/11/AirPods-Pro-3.png'))),
            SizedBox(
              height: 41,
            ),
            AnimatedTextKit(
              animatedTexts: [
                TyperAnimatedText("The Worlds #1 music player app!",
                    textStyle: TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                        fontFamily: 'font1.ttf'))
              ],
              totalRepeatCount: 100,
            ),
            SizedBox(
              height: 40,
            ),
            Row(children: [
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => signup()));
                  },
                  child: Container(
                    margin: EdgeInsets.only(left: 20),
                    child: Center(
                      child: Text(
                        'Sign Up',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                    height: 50,
                    width: 150,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.white, width: 2),
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => login()));
                  },
                  child: Container(
                    child: Center(
                      child: Text(
                        'Login',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                    height: 50,
                    width: 150,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.white, width: 2),
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
              )
            ]),
          ],
        ),
      ),
    );
  }
}
