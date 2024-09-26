import 'package:beclean_user/model/account_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AccountProvider with ChangeNotifier {
  AccountModel? _accountModel;
  AccountModel? get accountModel => _accountModel;
  Future<void> fetchProfile(String token) async {
    const urlbaseProfile = 'http://beclean.unimal.link/api/v1/account';
    final responseData = await http.get(Uri.parse(urlbaseProfile),
        headers: {'Authorization': 'Bearer $token'});
  }

  void l() {}
}
