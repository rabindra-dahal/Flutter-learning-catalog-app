import 'package:flutter/material.dart';
import 'package:learning_basics/models/catalog.dart';
import 'package:learning_basics/widgets/drawer.dart';
import 'package:learning_basics/widgets/item_widget.dart';

class HomePage extends StatelessWidget {
  final int days = 30;
  final String name = "Application developers";
  @override
  Widget build(BuildContext context) {
    final dummyList = List.generate(20, (index)=>CatalogModel.items[0]);
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
        child: ListView.builder(
          itemCount: dummyList.length,
          itemBuilder: (context,index)  {
              return ItemWidget(
                item: dummyList[index],
              );
          },
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
