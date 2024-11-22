import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:app/My-music.dart';
import 'package:app/Signup.dart';
import 'package:app/splashscreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  final emailcontoller = TextEditingController();
  final passwordcontroller = TextEditingController();
  var invalid = ' ';
  var credentials = ' ';
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => splashscreen()));
              },
              icon: Icon(
                CupertinoIcons.arrow_left,
                color: Colors.white,
                size: 30,
              ),
            ),
            backgroundColor: Colors.black,
            title: Text(
              "Login",
              style: TextStyle(
                  fontSize: 25, color: Colors.white, fontFamily: 'font1'),
            ),
            centerTitle: true,
          ),
          backgroundColor: Colors.black,
          body: Column(
            children: [
              SizedBox(
                height: 12,
              ),
              AnimatedTextKit(
                animatedTexts: [
                  TyperAnimatedText(invalid.toString(),
                      textStyle: TextStyle(
                          fontSize: 22,
                          color: Colors.white,
                          fontFamily: 'font1.ttf'))
                ],
                totalRepeatCount: 30,
              ),
              SizedBox(
                height: 20,
              ),
              AnimatedTextKit(
                animatedTexts: [
                  TyperAnimatedText(credentials.toString(),
                      textStyle: TextStyle(
                          fontSize: 22,
                          color: Colors.white,
                          fontFamily: 'font1.ttf'))
                ],
                totalRepeatCount: 30,
              ),
              SizedBox(
                height: 70,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  controller: emailcontoller,
                  cursorColor: Colors.white,
                  style: TextStyle(color: Colors.white),
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: "Enter your e-mail",
                    labelStyle: TextStyle(
                      color: Colors.white,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.white),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  controller: passwordcontroller,
                  style: TextStyle(color: Colors.white),
                  keyboardType: TextInputType.number,
                  cursorColor: Colors.white,
                  decoration: InputDecoration(
                    labelText: "Enter your password",
                    labelStyle: TextStyle(
                      color: Colors.white,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.white),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () async {
                  SharedPreferences sp = await SharedPreferences.getInstance();
                  if (emailcontoller.text.isNotEmpty &&
                      passwordcontroller.text.isNotEmpty) {
                    for (int i = 0; i < 10; i++) {
                      if (sp.getString('email1$i') == emailcontoller.text &&
                          sp.getString('password1$i') ==
                              passwordcontroller.text) {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => mymusic()));
                      }
                    }
                  } else {
                    setState(() {
                      invalid = "Incomplete info..";
                    });
                  }
                },
                child: Container(
                  child: Center(
                    child: Text(
                      'Login',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                  height: 38,
                  width: 150,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.white, width: 2),
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Dont have an account?",
                    style: TextStyle(
                        color: Colors.white, fontFamily: 'font1', fontSize: 16),
                  ),
                  SizedBox(
                    width: 6,
                  ),
                  InkWell(
                    onDoubleTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => signup()));
                    },
                    child: Text(
                      "Signup",
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'font1',
                          fontSize: 16),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
