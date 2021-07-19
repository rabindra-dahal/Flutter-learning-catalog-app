import 'package:flutter/material.dart';
import 'package:learning_basics/models/catalog.dart';
import 'package:learning_basics/widgets/home_widgets/add_to_cart.dart';
import 'package:learning_basics/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetailPage extends StatelessWidget {
  const HomeDetailPage({Key? key, required this.catalog}) : assert(catalog != null), super(key: key);
  final Item catalog;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: context.canvasColor,
      bottomNavigationBar: Container(
        color: context.cardColor,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding: EdgeInsets.zero,
          children: [
            "\$${catalog.price}".text.bold.xl4.red800.make(),
            AddToCart(catalog: catalog).wh(120,50),
          ],
        ).p32(),
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Hero(
                tag: Key(catalog.id.toString()),
                child: Image.network(catalog.image)
            ).h32(context),
            Expanded(child: VxArc(
              height: 30.0,
              arcType: VxArcType.CONVEY,
              edge: VxEdge.TOP,
              child: Container(
                color: context.cardColor,
                width: context.screenWidth,
                child: Column(
                  children: [
                    catalog.name.text.xl4.color(context.accentColor).bold.make(),
                    catalog.desc.text.xl.make(),
                    10.heightBox,
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                          "According to the Chinese Center for Disease Control ",
                          overflow: TextOverflow.ellipsis,
                      ),
                    )
                  ],

                ).py64(),

              ),
            ))
          ],
        ),
      ),
    );
  }
}
