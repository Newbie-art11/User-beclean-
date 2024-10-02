import 'dart:developer';

import 'package:beclean_user/model/mutation_model/mutation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MutationProvider with ChangeNotifier {
  List<Mutation> _mutations = [];

  List<Mutation> get mutations => _mutations;

  Future<void> fetchMutations() async {
    final url = Uri.parse(
        'http://beclean.unimal.link/api/v1/mutation?page=1'); // Replace with your actual API endpoint
    final token =
        '56|a2HwngYJ13zEEzjSlEWxTVHojR7UkOzVehr5zXld988a1397'; // Replace with your actual token

    try {
      final response = await http.get(
        url,
        headers: {
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        final extractedData = json.decode(response.body);
        final List<Mutation> loadedMutations = [];
        if (extractedData['data'] != null) {
          for (var item in extractedData['data']['data']) {
            loadedMutations.add(Mutation.fromJson(item));
          }
          _mutations = loadedMutations;
          log('Response Data : ${response.body}');
          notifyListeners();
        }
      } else {
        throw Exception('Failed to load mutations');
      }
    } catch (error) {
      print('Error: $error');
      throw error;
    }
  }
}
