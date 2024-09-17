import 'package:dio/dio.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class AuthRepository {
  final _dio = Dio();
  final String baseUrl = 'http://beclean.unimal.link/api/v1';

  Future<String> registerUser(Map<String, dynamic> userData) async {
    try {
      final response =
          await _dio.post('$baseUrl/auth/register', data: userData);
      return response.data['token'];
    } catch (e) {
      throw Exception('Eror register user');
    }
  }

  Future<bool> verifyToken(String token) async {
    return !JwtDecoder.isExpired(token);
  }
}
