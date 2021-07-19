import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learning_basics/core/store.dart';
import 'package:learning_basics/models/cart.dart';
import 'package:learning_basics/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: "Cart".text.make(),
        centerTitle: true,
      ),
      backgroundColor: context.theme.canvasColor,
      body: Column(
        children: [
          _CartList().p32().expand(),
          Divider(),
          _CartTotal(),
        ],
      ),
    );
  }
}
class _CartTotal extends StatelessWidget {
  const _CartTotal({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final CartModel _cart = (VxState.store as MyStore).cart;


    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          "\$${_cart.totalPrice}".text.xl5.color(context.theme.accentColor).make(),
          30.widthBox,
          ElevatedButton(
              onPressed: (){
                ScaffoldMessenger.of(context).
                showSnackBar(
                    SnackBar(
                        content: "Buying not supported yet.".text.make()
                    )
                );
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(context.theme.buttonColor),
              ) ,
              child: "Buy".text.white.make()
          ).w32(context)
        ],
      ),
    );
  }
}

class _CartList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CartModel _cart = (VxState.store as MyStore).cart;
    return _cart.items.isEmpty ? "Nothing to display".text.makeCentered() : ListView.builder(
      itemBuilder: (context,index) => ListTile(
        leading: Icon(Icons.done),
        trailing: IconButton(
            icon: Icon(Icons.remove_circle_outline),
            onPressed: (){
              _cart.remove(_cart.items[index]);

            },
        ),
        title: _cart.items[index].name.text.make(),
      ),
      itemCount: _cart.items.length,

    );
  }
}


