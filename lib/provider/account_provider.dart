import 'dart:convert';
import 'dart:developer';

import 'package:beclean_user/model/account_model.dart';
import 'package:beclean_user/services/service_account.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AccountProvider with ChangeNotifier {
  bool _isLoading = false;
  String _errorMessage = '';
  AccountModel? _accountModel;
  List<Notification> _notification = [];
  AccountModel? get accountModel => _accountModel;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;
  List<Notification> get notification => _notification;

  Future<void> fetchProfile(String token) async {
    _isLoading = true;
    notifyListeners();
    try {
      final fetchUser = await ServiceAccount().fetchUser(token);
      _accountModel = fetchUser;
      _errorMessage = '';
    } catch (error) {
      _errorMessage = error.toString();
      _accountModel = null;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> fetchNotification(int page, String token) async {
    final _url =
        'http://beclean.unimal.link/api/v1/account/notification?page=1';
    _isLoading = true;
    notifyListeners();
    try {
      final response = await http
          .get(Uri.parse(_url), headers: {'Authorization': 'Bearer $token'});
      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        log(data.toString());
        // _notification = data.map((json) => Notification.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load Notifications');
      }
    } catch (error) {
      print(error);
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
