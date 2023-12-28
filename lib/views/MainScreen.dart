import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/controller/FunctionController.dart';
import 'package:task/models/BlinkingText.dart';
import 'package:task/views/CartPage.dart';
import 'package:task/views/ItemDetail.dart';
import 'package:task/views/ItemList.dart';
import 'package:task/models/carousel.dart';
import 'package:task/models/product.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();
  final Controllers controller = Get.put(Controllers());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldkey,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
              width: MediaQuery.of(context).size.width,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: CircleAvatar(
                    radius: 35,
                    foregroundColor: Colors.black,
                    child: Container(
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/pfp.jpg'),
                            fit: BoxFit.fill),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hello, ',
                      style: TextStyle(color: Colors.grey, fontSize: 20),
                    ),
                    Text(
                      'User',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.22,
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            MyCarousel(item: controller.ads),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const BlinkingText(
                    text: "Click here !!",
                    padding: EdgeInsets.fromLTRB(0, 0, 30, 0)),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      Get.to(ItemList(items: controller.products),
                          transition: Transition.downToUp);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                    ),
                    child: const Text(
                      "All Products",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const BlinkingText(
                    text: "Click here !!",
                    padding: EdgeInsets.fromLTRB(30, 0, 0, 0)),
              ],
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.30,
              padding: const EdgeInsets.all(1),
              width: MediaQuery.of(context).size.width,
              child: ProductList(
                item: controller.products,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton.icon(
              icon: Icon(Icons.shopping_cart_outlined),
              onPressed: () {
                Get.to(() => CartPage());
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
              ),
              label: const Text(
                "To Cart",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<String?> _showNameList() async {
    return await showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Products'),
          content: SizedBox(
            width: double.maxFinite,
            child: ListView.builder(
              itemCount: controller.searchList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(controller.searchList[index]),
                  onTap: () {
                    setState(() {
                      controller.searchText = controller.searchList[index];
                      controller.id = controller.search[controller.searchText];
                      Navigator.of(context).pop();
                    });
                  },
                );
              },
            ),
          ),
        );
      },
    );
  }
}

Future<void> buildShowDialog(
    BuildContext context, Controllers controllers) async {
  showDialog(
    context: context,
    builder: (context) {
      if (controllers.isLoading.value == true) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else {
        throw Exception();
      }
    },
    barrierDismissible: false,
  );
  //Navigator.of(context).pop();
  await controllers.singlePro(controllers.id!);
  if (controllers.singleProduct.isNotEmpty) {
    Get.off(
      () => ItemDetail(item: controllers.singleProduct),
      transition: Transition.downToUp,
    );
  } else {}
}
