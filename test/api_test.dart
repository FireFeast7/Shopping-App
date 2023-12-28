import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:task/networking.dart';

class MockClient extends http.BaseClient {
  @override
  Future<http.Response> get(Uri url, {Map<String, String>? headers}) async {
    if (url.toString() == 'https://api.escuelajs.co/api/v1/products') {
      return http.Response(jsonEncode([]), 200);
    } else {
      throw http.ClientException('URL not supported');
    }
  }
  
  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) {
    throw UnimplementedError();
  }
}

void main() {
  test('fetchProducts returns a list of products', () async {
    final client = MockClient();
    final products = await fetchProducts();
    expect(products, isA<List>());

    client.close();
  });
}
