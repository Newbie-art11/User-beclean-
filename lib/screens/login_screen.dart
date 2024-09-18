import 'dart:convert';
import 'dart:math';
import 'package:beclean_user/screens/nav/home_nav.dart';
import 'package:beclean_user/screens/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isLoading = false;
  final String apiUrl = 'http://beclean.unimal.link/api/v1/auth/login';

  Future<void> _loginUser(String email, String password) async {
    setState(() {
      isLoading = true;
    });
    final Map<String, dynamic> requestData = {
      'email': email,
      'password': password,
    };

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(requestData),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Login berhasil!")),
        );
        debugPrint("Informasi Response : $data");
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Center(child: Text("Login gagal! ${response.body}"))),
        );
      }
    } catch (e) {
      // ScaffoldMessenger.of(context).showSnackBar(
      //   SnackBar(content: Text("Terjadi kesalahan")),
      // );
    }
    setState(() {
      isLoading = false;
    });
  }

  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Be Clean',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 50.0,
                  color: Colors.green[400]),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                hintText: 'Masukkan email anda',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
                hintText: 'Masukkan password',
                border: const OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscureText ? Icons.visibility_off : Icons.visibility,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                ),
              ),
              obscureText: _obscureText,
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                _loginUser(emailController.text, passwordController.text);
                // Navigator.push(context, '/HomeNav');
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomeNav()));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding: const EdgeInsets.symmetric(vertical: 16.0),
              ),
              child: const Text(
                'Masuk',
                style: TextStyle(fontSize: 20.0, color: Colors.white),
              ),
            ),
            const SizedBox(height: 20),
            const Row(
              children: [
                Expanded(child: Divider()),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text('Atau'),
                ),
                Expanded(
                  child: Divider(),
                )
              ],
            ),
            const SizedBox(
              height: 20.0,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => RegisterScreen()));
              },
              child: Text(
                'Daftar Sekarang',
                style: TextStyle(
                    color: Colors.green[400], fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ),
    );
  }
}
