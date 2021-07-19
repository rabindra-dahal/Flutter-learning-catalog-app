import 'package:flutter/material.dart';
import 'package:learning_basics/models/catalog.dart';
import 'package:learning_basics/pages/home_detail_page.dart';
import 'catalog_item.dart';

class CatalogList extends StatelessWidget {
  const CatalogList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: CatalogModel.items.length,
      itemBuilder: (context,index){
        final catalog = CatalogModel.getByPosition(index);
        return InkWell(
            child: CatalogItem(catalog: catalog),
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => HomeDetailPage(
                        catalog: catalog
                    ),),),
        );
      },
    );
  }
}