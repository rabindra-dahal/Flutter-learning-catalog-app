import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:learning_basics/models/catalog.dart';
import 'package:learning_basics/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

import 'catalog_image.dart';

class CatalogItem extends StatelessWidget {
  const CatalogItem({Key? key, required this.catalog}) : assert(catalog != null), super(key: key);
  final Item catalog;
  @override
  Widget build(BuildContext context) {
    return VxBox(
        child: Row(
          children: [
            Hero(
              tag: Key(catalog.id.toString()),
              child: CatalogImage(
                  image: catalog.image
              ),
            ),
            Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    catalog.name.text.lg.color(context.accentColor).bold.make(),
                    catalog.desc.text.make(),
                    10.heightBox,
                    ButtonBar(
                      alignment: MainAxisAlignment.spaceBetween,
                      buttonPadding: EdgeInsets.zero,
                      children: [
                        "\$${catalog.price}".text.bold.xl.make(),
                        ElevatedButton(
                            onPressed: (){

                            },
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(context.theme.buttonColor),
                              shape: MaterialStateProperty.all(StadiumBorder()),
                            ),
                            child: "Add to cart".text.make()
                        ),
                      ],
                    ).pOnly(right: 8.0),
                  ],

                ))
          ],
        )
    ).color(context.cardColor).rounded.square(150).make().py16();
  }
}