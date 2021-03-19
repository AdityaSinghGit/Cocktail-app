import 'package:cocktail_app/homepage.dart';
import 'package:flutter/material.dart';

// const Color mycolor = Colors.orange;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Cocktail App",
      theme: ThemeData(
        primaryColor: Colors.white,
        fontFamily: "Courgette",
      ),
      home: HomePage(),
    );
  }
}
