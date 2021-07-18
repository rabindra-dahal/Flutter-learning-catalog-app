import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  final String imageUrl = "http://www.astrosage.com/celebrity-horoscope/img/Dwayne-Johnson-horoscope.jpg";
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.deepPurple,
        margin: EdgeInsets.zero,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              padding: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: Colors.deepPurple),
                margin: EdgeInsets.zero,
                accountName: Text("Rabindra Dahal"),
                accountEmail: Text("rabindradahal@gmail.com"),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(imageUrl),
                ),
              ),
            ),
            ListTile(
              leading: Icon(
                  CupertinoIcons.home,
                color: Colors.white
              ),
              title: Text(
                "Home",
                textScaleFactor: 1.2,
                style: TextStyle(
                  color: Colors.white
                ),
              ),
            ),
            ListTile(
              leading: Icon(
                  CupertinoIcons.profile_circled,
                  color: Colors.white
              ),
              title: Text(
                "Profile",
                textScaleFactor: 1.2,
                style: TextStyle(
                    color: Colors.white
                ),
              ),
            ),
            ListTile(
              leading: Icon(
                  CupertinoIcons.mail,
                  color: Colors.white
              ),
              title: Text(
                "Email me",
                textScaleFactor: 1.2,
                style: TextStyle(
                    color: Colors.white
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
