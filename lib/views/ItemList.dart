import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/controller/CartController.dart';
import 'package:task/controller/FunctionController.dart';
import 'package:task/views/ItemDetail.dart';

class ItemList extends StatelessWidget {
  final Controllers controllers = Get.put(Controllers());
  final CartController controller = Get.put(CartController());
  final RxList<dynamic> items;
  ItemList({required this.items, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("All Products")),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
        ),
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
          final item = items[index];
          return GestureDetector(
            onTap: () {
              Get.to(
                () => ItemDetail(
                  item: item,
                ),
                transition: Transition.rightToLeft,
              );
            },
            child: Card(
              color: Color(0xFFECE3DA),
              //  shadowColor: Colors.amber,
              surfaceTintColor: Colors.black12,
              margin: const EdgeInsets.all(10),
              elevation: 3,
              child: Column(
                children: [
                  Image.network(
                    item['image'],
                    width: 150,
                    height: 140,
                    fit: BoxFit.fill,
                  ),
                  ListTile(
                    title: Text(
                      'Name : ' + item['title'],
                      maxLines: 1,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  ListTile(
                    title: Text(
                      'Description : ' + item['description'],
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  ListTile(
                    title: Text(
                      'Click to Show More Details',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 10.0),
                        child: Text(
                          '\$${item['price']}',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      ElevatedButton.icon(
                        onPressed: () {
                          if (!controller.addedtoCart.contains(item)) {
                            print(controller.addedtoCart);
                            controller.addToCart(item);
                          } else {
                            print(controller.addedtoCart);
                            controller.removeFromCart(item);
                          }
                        },
                        icon: Obx(
                          () => Icon(
                            controller.addedtoCart.contains(item)
                                ? Icons.remove_shopping_cart
                                : Icons.add_shopping_cart,
                            size: 20.0,
                          ),
                        ),
                        label: Obx(
                          () => Text(
                            controller.addedtoCart.contains(item)
                                ? 'Remove from Cart'
                                : 'Add to Cart',
                            style: TextStyle(fontSize: 12.0),
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(horizontal: 12.0),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
