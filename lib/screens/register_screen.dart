import 'package:beclean_user/controllers/authentication_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[400],
        title: Text(
          'Daftar',
          style: TextStyle(
              fontSize: 30.0, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: BlocListener<AuthBloc, AutheState>(
        listener: (context, state) {
          if (state is AuthSucces) {
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Register Successfull")));
            Navigator.pushNamed(context, '/LoginScreen');
          } else if (state is AuthFailure) {
            ScaffoldMessenger.of(context)
                .showSnackBar(const SnackBar(content: Text("error")));
          }
        },
        child: SingleChildScrollView(
          child: Padding(
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
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        final userData = {
                          'name': nameController.text,
                          'email': emailController.text,
                          'phone': phoneController.text,
                          'password': passwordController.text
                        };
                        BlocProvider.of<AuthBloc>(context)
                            .add(RegisterUser(userData));
                        if (_formKey.currentState!.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Processing Data')),
                          );
                        }
                      },
                      child: Text(
                        'Daftar Sekarang',
                        style: TextStyle(fontSize: 20.0, color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        padding:
                            EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                      ),
                    ),
                  ],
                )),
          ),
        ),
      ),
    );
  }
}

void space(context) {
  const SizedBox(
    height: 10,
  );
}
