import 'dart:convert';
import 'package:beclean_user/model/account_model.dart';
import 'package:http/http.dart' as http;

class ServiceAccount {
  final String baseUrl = 'http://beclean.unimal.link/api/v1/account';

  Future<AccountModel?> fetchUser(String token) async {
    final response = await http.get(
      Uri.parse('$baseUrl/account'),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      if (data['success']) {
        return AccountModel.fromJson(data['data']);
      } else {
        throw Exception('Failed to fetch user: ${data['message']}');
      }
    } else {
      throw Exception('Failed to load user');
    }
  }
}
