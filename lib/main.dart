import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:nicemusic/pages/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Color.fromRGBO(21, 21, 27, 1.0)),
    );
  }
}