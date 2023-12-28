import 'package:get/get.dart';

class CartController extends GetxController {
  final addedtoCart = <dynamic>[].obs;

  void addToCart(dynamic item) {
    addedtoCart.add(item);
  }

  void removeFromCart(dynamic item) {
    addedtoCart.remove(item);
  }
}
