import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:sip/models/product.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ProductRepository {
  Future<List<Product>?> fetchData() async {
    String baseUrl = dotenv.env['BASE_URL'] ?? '';

    var response = await http.get(Uri.parse("$baseUrl/v1/products"));
    // debugPrint("$baseUrl/v1/products : ${response.statusCode}");
    List<Product> products = [];

    if (response.statusCode == 200) {
      var responseData = json.decode(response.body);
      // Check the success status
      bool success = responseData['success'];

      if (success) {
        List<dynamic> data = responseData['data'];

        products = data.map((product) => Product.fromJson(product)).toList();

        // debugPrint("data length = ${products.length.toString()} ");
      }

      return products;
    } else {
      throw Exception('Failed to load data');
    }
  }
}
