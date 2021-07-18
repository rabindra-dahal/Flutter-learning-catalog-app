import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Material(
      child:Center(
        child: Text(
            "login now",
          style: TextStyle(
            fontSize: 20,
            color: Colors.blue,
            fontWeight: FontWeight.bold,
            letterSpacing: 2,

          ),
          textScaleFactor: 2.0,
        ),
      ),
    );
  }
}
