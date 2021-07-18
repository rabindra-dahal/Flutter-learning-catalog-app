import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learning_basics/utils/routes.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _userName = "";
  String _password = "";
  bool changeButton =false;
  @override
  Widget build(BuildContext context) {
    return Material(
        child: SingleChildScrollView(
      child: Column(
        children: [
          Image.asset("assets/images/login_image.png", fit: BoxFit.cover),
          SizedBox(
            height: 20.0,
          ),
          Text(
            "Welcome $_userName",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 28,
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                      hintText: "Enter username", labelText: "Username"),
                  onChanged: (value) {
                    _userName = value;
                    setState(() {});
                  },
                ),
                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                      hintText: "Enter password", labelText: "Password"),
                  onChanged: (value) {
                    _password = value;
                    setState(() {});
                  },
                ),
                SizedBox(
                  height: 40.0,
                ),
                InkWell(
                    onTap: () async{
                      setState(() {
                        changeButton=true;
                      });
                      await Future.delayed(Duration(seconds: 3));
                      Navigator.pushNamed(context, MyRoutes.homeRoute);
                    },
                    child: AnimatedContainer(
                        duration: Duration(seconds: 2),
                        width: changeButton? 100: 150 ,
                        height: 40,
                        child: Center(
                          child: changeButton?
                          Icon(
                              Icons.done,
                              color:Colors.white
                          )
                              :
                          Text(
                            "Login",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                        ),
                        decoration: BoxDecoration(
                            color: Colors.deepPurple,
                            // shape: changeButton ? BoxShape.circle : BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(changeButton? 20: 8),
                  ),
                ),
                )

              ],
            ),
          ),
        ],
      ),
    ));
  }
}
