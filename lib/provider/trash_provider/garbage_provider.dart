import 'dart:convert';

import 'package:beclean_user/model/trush_model/transaction_model.dart';
import 'package:beclean_user/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class GarbageProvider with ChangeNotifier {
  UserProvider userProvider = UserProvider();
  String url = 'http://beclean.unimal.link/api/v1';
  List<TransactionModel> transaction = [];
  //Post Method Store sampah
  Future<void> storeGarbageData(
      String type, String address, String longitude, String latitude) async {
    final url = Uri.parse(
        'http://beclean.unimal.link/api/v1/garbage'); // Replace with your actual API endpoint
    final token = userProvider.getToken(); // Replace with your actual token
    try {
      final response = await http.post(
        url,
        headers: {
          'Authorization': 'Bearer $token',
        },
        body: {
          'type': type,
          'address': address,
          'longitude': longitude,
          'latitude': latitude,
        },
      );

      if (response.statusCode == 200) {
        print('Data stored successfully');
        notifyListeners();
      } else {
        throw Exception('Failed to store data');
      }
    } catch (error) {
      print('Error: $error');
      throw error;
    }
  }

  //GET the Data Active
  Future<void> fetchTransaction() async {
    final urlfeth = Uri.parse('${url}/garbage/active?q=TRANS&page=1');
    final token = '';
    try {
      final response = await http.get(
        urlfeth,
        headers: {
          'Authorization': 'Bearer $token',
        },
      );
      if (response.statusCode == 200) {
        final extratedData = json.decode(response.body);
        final List<TransactionModel> loadTransaction = [];
        if (extratedData['data'] != null) {
          for (var item in extratedData['data']['data']) {
            loadTransaction.add(TransactionModel.fromJson(item));
          }
          transaction = loadTransaction;
          notifyListeners();
        }
      } else {
        throw Exception('Fail to download data');
      }
    } catch (error) {
      throw error;
    }
  }

  //Get the data history in sampah
  Future<void> fetchHistoryData() async {}
}
