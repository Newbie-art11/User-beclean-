import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:beclean_user/model/product_model/product.dart';
import 'package:http/http.dart' as http;

class ProductProvider with ChangeNotifier {
  List<Product> _product = [];
  List<Product> get product => _product;
  Future<void> fetchProduct() async {
    final url = Uri.parse(
        'http://beclean.unimal.link/api/v1/product?q=&page=1'); // Replace with your actual API endpoint
    String token = '56|a2HwngYJ13zEEzjSlEWxTVHojR7UkOzVehr5zXld988a1397';
    try {
      final response =
          await http.get(url, headers: {'Authorization': 'Bearer $token'});
      if (response.statusCode == 200) {
        final extractedData = json.decode(response.body);
        final List<Product> loadProduct = [];
        if (extractedData['data'] != null) {
          for (var item in extractedData['data']['data']) {
            loadProduct.add(Product.fromJson(item));
          }
          _product = loadProduct;
          notifyListeners();
        }
      } else {
        throw Exception('Failed Product ');
      }
    } catch (error) {
      print('Error : $error');
      throw error;
    }
  }
}
