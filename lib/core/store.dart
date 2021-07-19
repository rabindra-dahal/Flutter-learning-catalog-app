import 'package:learning_basics/models/cart.dart';
import 'package:learning_basics/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class MyStore extends VxStore{
  late CatalogModel catalog;
  late CartModel cart;
  MyStore(){
    catalog = CatalogModel();
    cart = CartModel();
    cart.catalog = catalog;

  }

}