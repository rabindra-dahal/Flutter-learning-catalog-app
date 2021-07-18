import 'package:flutter/material.dart';
import 'package:learning_basics/pages/home_page.dart';
import 'package:learning_basics/pages/login_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final double pi = 3.14;
  final bool isMale = true;
  final num temperature = 30.5;//takes both integer and double
  var day = "Sunday"; //compile at runtime and resolve type
  static const  gravity = 9.8; //constant like universal constants


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home:HomePage(),
      themeMode: ThemeMode.light,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple
      ),
      darkTheme: ThemeData(
          brightness: Brightness.dark,
      ),
      initialRoute: "/home",
      routes: {
        "/": (context) => LoginPage(),
        "/home": (context) => HomePage(),
        "/login": (context) => LoginPage()
      },
    );
  }
}
