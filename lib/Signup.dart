import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:app/login.dart';
import 'package:app/splashscreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class signup extends StatefulWidget {
  const signup({super.key});

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  final namecontoller = TextEditingController();
  var invalid = ' ';

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
              "Sign Up",
              style: TextStyle(
                  fontSize: 25, color: Colors.white, fontFamily: 'font1'),
            ),
            centerTitle: true,
          ),
          backgroundColor: Colors.black,
          body: Column(
            children: [
              SizedBox(height: 10.5),
              AnimatedTextKit(
                animatedTexts: [
                  TyperAnimatedText(invalid.toString(),
                      textStyle: TextStyle(
                          fontSize: 22,
                          color: Colors.white,
                          fontFamily: 'font1.ttf'))
                ],
                totalRepeatCount: 100,
              ),
              SizedBox(
                height: 36,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  controller: namecontoller,
                  cursorColor: Colors.white,
                  keyboardType: TextInputType.name,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    labelText: "Name",
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
                  controller: emailcontroller,
                  cursorColor: Colors.white,
                  style: TextStyle(color: Colors.white),
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: "E-Mail",
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
                    labelText: "Password",
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
              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () async {
                  SharedPreferences sp = await SharedPreferences.getInstance();
                  if (emailcontroller.text.isNotEmpty &&
                      passwordcontroller.text.isNotEmpty &&
                      namecontoller.text.isNotEmpty) {
                    int counter = sp.getInt('usercount') ?? 0;
                    sp.setString('email1$counter', emailcontroller.text);
                    sp.setString('password1$counter', passwordcontroller.text);
                    sp.setInt('usercount', counter + 1);

                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => login()));
                  } else {
                    setState(() {
                      invalid = "Plz fill in all the fields";
                    });
                  }
                },
                child: Container(
                  child: Center(
                    child: Text(
                      'Signup',
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
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account?",
                    style: TextStyle(
                        color: Colors.white, fontFamily: 'font1', fontSize: 16),
                  ),
                  SizedBox(
                    width: 6,
                  ),
                  InkWell(
                    onDoubleTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => login()));
                    },
                    child: Text(
                      "Login",
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
