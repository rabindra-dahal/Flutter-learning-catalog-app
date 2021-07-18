import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:learning_basics/models/catalog.dart';
import 'package:learning_basics/widgets/drawer.dart';
import 'package:learning_basics/widgets/item_widget.dart';
import 'dart:convert';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final int days = 30;
  final String name = "Application developers";
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
    // final dummyList = List.generate(20, (index)=>CatalogModel.items[0]);
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
              "Catalog App",
            style: TextStyle(color: Colors.black),
          ),
        ),

      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: (CatalogModel.items != null && CatalogModel.items.isNotEmpty)?
        GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
          ),
          itemBuilder: (context, index) {
            final item = CatalogModel.items[index];
            return Card(
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: GridTile(
                  header: Container(
                    child: Text(
                      item.name,
                      style: TextStyle(color: Colors.white),
                    ),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.deepPurple,
                    ),
                  ),
                  child: Image.network(
                    item.image,
                  ),
                  footer: Container(
                    child: Text(
                      item.price.toString(),
                      style: TextStyle(color: Colors.white),
                    ),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.black,
                    ),
                  ),
                ));
          },
          itemCount: CatalogModel.items.length,
        ) : Center(
          child:CircularProgressIndicator(),
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
