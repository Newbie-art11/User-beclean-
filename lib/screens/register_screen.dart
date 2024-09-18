import 'dart:convert';
import 'package:beclean_user/screens/login_screen.dart';
import 'package:beclean_user/services/bloc/register_bloc.dart';
import 'package:beclean_user/services/event/register_event.dart';
import 'package:beclean_user/services/state/register_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  // final String apiUrl = 'http://beclean.unimal.link/api/v1/auth/register';

  // bool isLoading = false;

  // // Fungsi untuk mengirim data registrasi ke backend
  // Future<void> _registerUser(
  //     String name, String email, String phone, String password) async {
  //   setState(() {
  //     isLoading = true;
  //   });

  //   // Data yang dikirim ke API
  //   final Map<String, dynamic> requestData = {
  //     'name': name,
  //     'email': email,
  //     'phone': phone,
  //     'password': password,
  //   };

  //   try {
  //     final response = await http.post(
  //       Uri.parse(apiUrl),
  //       headers: {"Content-Type": "application/json"},
  //       body: jsonEncode(requestData),
  //     );

  //     if (response.statusCode == 200) {
  //       final data = jsonDecode(response.body);
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         SnackBar(content: Text("Registrasi berhasil!")),
  //       );
  //       // log(data);
  //       Navigator.pushNamed(context, 'LoginScreen'); // Navigasi ke halaman lain
  //     } else {
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         SnackBar(content: Text("Registrasi gagal! ${response.body}")),
  //       );
  //       // print("${response.body}");
  //     }
  //   } catch (e) {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(content: Text("Terjadi kesalahan")),
  //     );
  //   }

  //   setState(() {
  //     isLoading = false;
  //   });
  // }

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[400],
        title: const Center(
          child: Text(
            'Daftar',
            style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
                color: Colors.white),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  controller: nameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Nama',
                    hintText: 'Masukkan Nama anda',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Nama Tidak Boleh Kosong';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  controller: phoneController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'No. HP',
                    hintText: 'Masukkan No. HP anda',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'No. HP tidak boleh kosong';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'E-mail',
                    hintText: 'Masukkan E-mail anda',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'E-mail tidak boleh kosong';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  controller: passwordController,
                  decoration: InputDecoration(
                      labelText: 'Password',
                      hintText: 'Masukkan password',
                      border: OutlineInputBorder()),
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Password tidak boleh kosong';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                BlocConsumer<RegisterBloc, RegisterState>(
                    listener: (context, state) {
                  if (state is RegisterSuccess) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content: Text('Register successful! Token saved.')),
                    );
                  } else if (state is RegisterFailure) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(state.error)),
                    );
                  }
                }, builder: (context, state) {
                  if (state is RegisterLoading) {
                    return CircularProgressIndicator();
                  }
                  return ElevatedButton(
                      onPressed: () {
                        context.read<RegisterBloc>().add(RegisterSubmitted(
                              name: nameController.text,
                              email: emailController.text,
                              phone: phoneController.text,
                              password: passwordController.text,
                            ));

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginScreen()));
                      },
                      child: Text("Register"));
                })
              ],
            )),
      ),
    );
  }
}

void space(context) {
  const SizedBox(
    height: 10,
  );
}
