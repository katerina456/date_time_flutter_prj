import 'package:flutter/material.dart';
import 'package:time_prj/pages/home.dart';
import 'package:time_prj/pages/choose_location.dart';
import 'package:time_prj/pages/loading.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      routes: {
        '/': (context) => Loading(),
        '/home': (context) => Home(),
        '/location': (context) => ChooseLocation(),
      },
    );
  }
}