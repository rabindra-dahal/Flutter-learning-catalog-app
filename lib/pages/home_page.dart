import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:learning_basics/core/store.dart';
import 'package:learning_basics/models/cart.dart';
import 'package:learning_basics/models/catalog.dart';
import 'package:learning_basics/utils/routes.dart';
import 'package:learning_basics/widgets/home_widgets/catalog_header.dart';
import 'package:learning_basics/widgets/home_widgets/catalog_list.dart';
import 'package:learning_basics/widgets/themes.dart';
import 'dart:convert';
import 'package:velocity_x/velocity_x.dart';
import 'package:http/http.dart' as http;



class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final url = "https://api.jsonbin.io/b/60f6153699892a4ae9a5f0dc/1";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }
  loadData() async{
   await Future.delayed(Duration(seconds: 5));
   // var catalogJson = await rootBundle.loadString("assets/files/catalog.json");
   var response = await http.get(Uri.parse(url,));
   var catalogJson = response.body;
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
    final CartModel _cart = (VxState.store as MyStore).cart;
    return Scaffold(
      backgroundColor: context.canvasColor,
      floatingActionButton: VxBuilder(
        mutations: {AddMutation,RemoveMutation},
        builder: (ctx,_,__) => FloatingActionButton(
          onPressed: (){
            Navigator.pushNamed(context,MyRoutes.cartRoute);

          },
          child: Icon(CupertinoIcons.cart,color:Colors.white),
          backgroundColor:context.theme.buttonColor ,

        ).badge(color: Vx.red600,size: 22,count: _cart.items.length,textStyle: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
        )),
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










