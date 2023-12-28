import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/controller/FunctionController.dart';
import 'package:task/views/MainScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Controllers controllers = Get.put(Controllers());
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: FutureBuilder(
        future: initializeApp(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (yourConditionsAreMet()) {
              return const MainScreen();
            } else {
              return const Scaffold(
                body: Center(
                  child: Column(
                    children: [
                      CircularProgressIndicator(),
                      Row(
                        children: [
                          Text("Loading App.... "),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            }
          } else {
            return const Scaffold(
              backgroundColor: Colors.black,
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(
                      color: Colors.white,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Loading App.... ",
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }

  Future<void> initializeApp() async {
    await controllers.fetchAndSetProducts();
    await controllers.organizeProducts();
  }

  bool yourConditionsAreMet() {
    if (controllers.products.isNotEmpty &&
        controllers.ads.isNotEmpty) {
      return true;
    }
    return false;
  }
}
