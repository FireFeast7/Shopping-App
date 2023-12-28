import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/networking.dart';

class Controllers extends GetxController {
  final products = [].obs;
  final ads = [];
  Map<String, int> search = {};
  List<String> searchList = [];
  late int? id;
  String searchText = '';
  var allproduct = false.obs;
  final selectedColor = Rx<Color?>(null);
  Map<dynamic, dynamic> singleProduct = {};
  var isLoading = false.obs;
  void selectContainer(Color color) {
    selectedColor.value = color;
  }

  Future<void> fetchAndSetProducts() async {
    try {
      final fetchedProducts = await fetchProducts();
      products.assignAll(fetchedProducts);
    } catch (e) {
      print("Error fetching products: $e");
    }
  }


  Future<void> organizeProducts() async {
    List<dynamic> pro = [];

    try {
      final fetchedProducts = await fetchProducts();
      pro.assignAll(fetchedProducts);
    } catch (e) {
      print("Error fetching products: $e");
    }
    int count = 0;
    for (var item in pro) {
      if (count == 5) {
        break;
      }
      ads.add(item);
      count++;
    }
    //  print(search);
    //   print(searchList);
    //  print(ads);
  }

  Future<void> singlePro(int id) async {
    isLoading.value = true;
    var fetchedproduct = await fetchAProduct(id);
    singleProduct = fetchedproduct;
    print(singleProduct);
    isLoading.value = false;
  }
}
