import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fan_carousel_image_slider/fan_carousel_image_slider.dart';
import 'package:task/controller/CartController.dart';
import 'package:task/controller/FunctionController.dart';
import 'package:task/models/Container.dart';

// ignore: must_be_immutable
class ItemDetail extends StatelessWidget {
  final CartController controller = Get.put(CartController());
  final Controllers controllers = Get.put(Controllers());
  final dynamic item;
  var icons = false.obs;
  ItemDetail({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final String imageUrls = item['image'];
    final List<String> stringImageUrls = imageUrls.split(',');

    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 131, 154, 164),
        title: const Text('Details'),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
            child: Obx(
              () => IconButton(
                icon: icons.value
                    ? const Icon(
                        Icons.favorite,
                        color: Colors.red,
                      )
                    : const Icon(Icons.favorite_outline),
                onPressed: () {
                  icons.value = !icons.value;
                },
              ),
            ),
          ),
        ],
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.50,
                color: const Color.fromARGB(255, 131, 154, 164),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.50,
                color: Colors.white,
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                //        color: Colors.amber,
                padding: EdgeInsets.fromLTRB(
                    0, MediaQuery.of(context).size.height * 0.13, 0, 20),
                child: FanCarouselImageSlider(
                    sliderHeight: 370,
                    imageRadius: 30,
                    isClickable: false,
                    initalPageIndex: 0,
                    imagesLink: stringImageUrls,
                    isAssets: false),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 5, 20, 8),
                    child: Text(
                      item['title'],
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        overflow: TextOverflow.ellipsis,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 5, 30, 8),
                    child: Text(
                      '\$${item['price'].toString()}',
                      style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 10, 10, 3),
                child: Text(
                  item['description'],
                  style: const TextStyle(color: Colors.grey),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(0, 5, 0, 8),
                child: Text(
                  'Colors Available',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Obx(
                () => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Containers(
                      color: Colors.red,
                      selected: controllers.selectedColor.value == Colors.red,
                    ),
                    Containers(
                        color: Colors.orangeAccent,
                        selected: controllers.selectedColor.value ==
                            Colors.orangeAccent),
                    Containers(
                        color: Colors.green,
                        selected:
                            controllers.selectedColor.value == Colors.green),
                    Containers(
                        color: Colors.blue,
                        selected:
                            controllers.selectedColor.value == Colors.blue),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                child: ElevatedButton.icon(
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
                      style: TextStyle(fontSize: 12.0, color: Colors.white),
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    padding: EdgeInsets.symmetric(horizontal: 12.0),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
