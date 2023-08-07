import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:sip/models/product.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ProductRepository {
  Future<List<Product>?> fetchData() async {
    List<Product> products = [];
    const String baseUrlEnv =
        String.fromEnvironment("BASE_URL", defaultValue: "");
    String baseUrl = dotenv.env['BASE_URL'] ?? "";
    String getBaseUrl = baseUrlEnv != "" ? baseUrlEnv : baseUrl;

    try {
      final dio = Dio();
      final response = await dio.get("$getBaseUrl/v1/products");
      if (response.statusCode == 200) {
        final responseData = response.data as Map<String, dynamic>;
        final VmResponse getResponse = VmResponse.fromJson(responseData);
        products = getResponse.data;

        // debugPrint(products[0].price.toString());
      } else {
        // Handle other status codes (e.g., 404, 500, etc.)
        debugPrint("Error: ${response.statusCode}");
      }
    } catch (e) {
      // Handle any exceptions that occur during the HTTP request
      debugPrint("Exception: $e");
    }

    return products;
  }
}

class VmResponse {
  bool success;
  List<Product> data;

  VmResponse({required this.data, required this.success});

  factory VmResponse.fromJson(Map<String, dynamic> json) {
    return VmResponse(
      success: json['success'],
      data: (json['data'] as List<dynamic>)
          .map((item) => Product.fromJson(item))
          .toList(),
    );
  }
}
