import 'package:flutter/material.dart';
import 'package:learning_basics/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // const MyApp({Key? key}) : super(key: key);
  double pi = 3.14;
  bool isMale = true;
  num temperature = 30.5;//takes both integer and double
  var day = "Sunday"; //compile at runtime and resolve type
  static const  gravity = 9.8; //constant like universal constants


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:HomePage()
    );
  }
}
