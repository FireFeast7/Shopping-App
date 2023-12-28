import 'dart:convert';

import 'package:http/http.dart' as http;

Future<List<dynamic>> fetchProducts() async {
  try {
    final response =
        await http.get(Uri.parse('https://fakestoreapi.com/products'));

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);

      return data;
    } else {
      print("Non-200 status code: ${response.statusCode}");
      return [];
    }
  } catch (e) {
    print("Error: ${e.toString()}");
    rethrow;
  }
}

Future<Map<dynamic, dynamic>> fetchAProduct(int id) async {
  try {
    final response = await http
        .get(Uri.parse('https://api.escuelajs.co/api/v1/products/$id'));
    if (response.statusCode == 200) {
      final Map<dynamic, dynamic> data = jsonDecode(response.body);
      return data;
    } else {
      print("Non - 200 status code : ${response.statusCode}");
      return {};
    }
  } catch (e) {
    print("Error : ${e.toString()}");
    rethrow;
  }
}
