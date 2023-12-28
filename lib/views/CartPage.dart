import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/controller/CartController.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final CartController controller = Get.put(CartController());
  @override
  Widget build(BuildContext context) {
    double totalAmount = controller.addedtoCart.fold(
        0.0, (previous, product) => previous + (product['price'] as double));

    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping Cart'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: controller.addedtoCart.length,
              itemBuilder: (context, index) {
                return Card(
                  color: Color(0xffED1E79),
                  margin: EdgeInsets.all(8.0),
                  child: ListTile(
                    title: Text(
                      controller.addedtoCart[index]['title'].toString(),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                        color: Colors.black,
                      ),
                    ),
                    subtitle: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Price : \$${controller.addedtoCart[index]['price']}',
                              style: TextStyle(
                                fontSize: 14.0,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              'Rating: ${controller.addedtoCart[index]['rating']['rate']}',
                              style: TextStyle(
                                fontSize: 14.0,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              'Rated by: ${controller.addedtoCart[index]['rating']['count']}',
                              style: TextStyle(
                                fontSize: 14.0,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              'Category: ${controller.addedtoCart[index]['category']}',
                              style: TextStyle(
                                fontSize: 14.0,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        Container(
                            height: 70,
                            width: 70,
                            child: Image.network(
                                controller.addedtoCart[index]['image'])),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Total Amount: \$${totalAmount.toStringAsFixed(2)}'),
                ElevatedButton(
                  onPressed: () {
                    Get.snackbar('Feature Will be added soon', 'Error');
                  },
                  child: Text('Proceed to Payment'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
