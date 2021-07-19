import 'package:flutter/material.dart';
import 'package:learning_basics/pages/cart_page.dart';
import 'package:learning_basics/pages/home_detail_page.dart';
import 'package:learning_basics/pages/home_page.dart';
import 'package:learning_basics/pages/login_page.dart';
import 'package:learning_basics/utils/routes.dart';
import 'package:learning_basics/widgets/themes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home:HomePage(),
      themeMode: ThemeMode.system,
      theme: MyTheme.darkTheme(context),
      darkTheme: MyTheme.darkTheme(context),
      debugShowCheckedModeBanner: false,
      initialRoute: MyRoutes.homeRoute,
      routes: {
        "/": (context) => LoginPage(),
        MyRoutes.homeRoute: (context) => HomePage(),
        MyRoutes.loginRoute: (context) => LoginPage(),
        MyRoutes.cartRoute: (context) => CartPage(),
      },
    );
  }
}
