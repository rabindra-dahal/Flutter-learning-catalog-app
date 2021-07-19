import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:learning_basics/models/catalog.dart';
import 'package:learning_basics/utils/routes.dart';
import 'package:learning_basics/widgets/home_widgets/catalog_header.dart';
import 'package:learning_basics/widgets/home_widgets/catalog_list.dart';
import 'package:learning_basics/widgets/themes.dart';
import 'dart:convert';
import 'package:velocity_x/velocity_x.dart';



class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }
  loadData() async{
   await Future.delayed(Duration(seconds: 5));
   var catalogJson = await rootBundle.loadString("assets/files/catalog.json");
   var decodeData = jsonDecode(catalogJson);
   var productsData = decodeData["products"];
   CatalogModel.items = List.from(productsData).
                    map<Item>((item) =>
                    Item.
                    fromMap(item)).
                    toList();
   setState(() {

   });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: MyTheme.creamColor,
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.pushNamed(context,MyRoutes.cartRoute);

        },
        child: Icon(CupertinoIcons.cart),
        backgroundColor: MyTheme.darkBluishColor,

      ),
      body: SafeArea(
        child: Container(
          padding: Vx.m32,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CatalogHeader(),
              if(CatalogModel.items != null && CatalogModel.items.isNotEmpty)
                CatalogList().py16().expand()
              else
                 CircularProgressIndicator().centered().expand(),

            ],
          ),
        ),
      ),
    );
  }
}










