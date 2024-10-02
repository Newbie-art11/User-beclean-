import 'dart:developer';
import 'package:beclean_user/model/login_userModel.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:beclean_user/model/user_model.dart';

class UserProvider with ChangeNotifier {
  bool _isLoading = false;
  String? _responseMessage;
  UserModel? _user;
  LoginUsermodel? _loginUser;
  String? _jwtToken;

  bool get isLoading => _isLoading;
  String? get responseMessage => _responseMessage;
  UserModel? get user => _user;
  LoginUsermodel? get userLogin => _loginUser;
  String? get jwtToken => _jwtToken;
  // Set loading state and notify listeners
  void _setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

  // Set response message and notify listeners
  void _setResponseMessage(String? message) {
    _responseMessage = message;
    notifyListeners();
  }

  Future<void> createUser(
    UserModel user,
    BuildContext context,
    GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey,
  ) async {
    const String url = 'http://beclean.unimal.link/api/v1/register';
    _setLoading(true);
    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(user.toJson()),
      );

      log('Request URL: $url');
      log('Request Body: ${user.toJson()}');
      log('Response Status Code: ${response.statusCode}');
      log('Response Body: ${response.body}');
      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = json.decode(response.body);
        if (responseData['success'] == true) {
          _setResponseMessage(
              responseData['message'] ?? 'User registered successfully');
          final prefs = await SharedPreferences.getInstance();
          await prefs.setString('userId', responseData['data']['id']);
          log("User registered successfully with ID");

          // Show success Snackbar
          scaffoldMessengerKey.currentState?.showSnackBar(
            SnackBar(
              content: Text('Login successful!'),
              backgroundColor: Colors.green,
            ),
          );

          Navigator.pushReplacementNamed(context, '/LoginScreen');
          notifyListeners();
        } else {
          _setResponseMessage(
              'Registration failed: ${responseData['message']}');
          log('Registration failed: ${responseData['message']}',
              level: 2000); // Log warning level
        }
      } else {
        _setResponseMessage('Server error: ${response.statusCode}');
        log('Server error: ${response.statusCode}',
            level: 1000); // Log severe level
      }
    } catch (error, stackTrace) {
      _setResponseMessage('An unexpected error occurred');
      log('Error during registration: $error',
          error: error, stackTrace: stackTrace, level: 1000);
    } finally {
      _setLoading(false);
    }
  }

  // Function to login user
  Future<void> loginUser(
      String email, String password, BuildContext context) async {
    const String url =
        'http://beclean.unimal.link/api/v1/auth/login'; // Replace with your API endpoint
    _setLoading(true);
    try {
      final Map<String, String> requestBody = {
        'email': email,
        'password': password,
      };

      final response = await http.post(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(requestBody),
      );

      log('Request URL: $url');
      log('Request Body: $requestBody');
      log('Response Status Code: ${response.statusCode}');
      log('Response Body: ${response.body}');

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = json.decode(response.body);
        if (responseData['success'] == true) {
          _user = responseData['data']['user'];
          _jwtToken = responseData['data']['access_token']['token'];
          _setResponseMessage(responseData['message'] ?? 'Login successful');

          final prefs = await SharedPreferences.getInstance();
          await prefs.setString('jwtToken', _jwtToken!);
          log("User logged in successfully with ID: ");
          log("JWT Token: $_jwtToken");
          notifyListeners();
        } else {
          _setResponseMessage('Login failed: ${responseData['message']}');
          log('Login failed: ${responseData['message']}', level: 2000);
        }
      } else {
        _setResponseMessage('Server error: ${response.statusCode}');
        log('Server error: ${response.statusCode}', level: 1000);
      }
    } catch (error, stackTrace) {
      _setResponseMessage('An unexpected error occurred');
      log('Error during login: $error',
          error: error, stackTrace: stackTrace, level: 1000);
    } finally {
      _setLoading(false);
    }
  }

  Future<void> changeProfile(String name, String email, String phone) async {
    dynamic token = getToken();
    String urlProfile = 'http://beclean.unimal.link/api/v1/account';
    _setLoading(true);
    try {
      final response = await http.post(
        Uri.parse(urlProfile),
        headers: {
          'Authorization': 'Bearer $token',
        },
        body: {
          'name': name,
          'email': email,
          'phone': phone,
        },
      );

      if (response.statusCode == 200) {
        log("${response.body}");
        notifyListeners();
      } else {
        throw Exception('Failed to update profile');
      }
    } catch (error) {
      print('Error: $error');
      throw error;
    }
  }

  Future<void> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    _jwtToken = prefs.getString('jwtToken');
    notifyListeners();
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('jwtToken');
    _user = null;
    _jwtToken = null;
    notifyListeners();
  }
}
