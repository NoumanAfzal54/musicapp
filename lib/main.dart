import 'package:app/My-music.dart';
import 'package:app/Song2.dart';
import 'package:app/Tajdareharam.dart';
import 'package:app/splashscreen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(Myapp());
}

class Myapp extends StatefulWidget {
  const Myapp({super.key});

  @override
  State<Myapp> createState() => _MyappState();
}

class _MyappState extends State<Myapp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(body: const splashscreen()),
    );
  }
}
