import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final int days = 30;
  final String name = "Application developers";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Catalog App"),
        ),
      ),
      body: Center(
        child: Container(
          child:Text("Welcome to flutter learning $days days series by $name."),
        ),
      ),
      drawer: Drawer(),
    );
  }
}
