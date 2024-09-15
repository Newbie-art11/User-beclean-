import 'package:beclean_user/screens/change_password_screen.dart';
import 'package:flutter/material.dart';

class ChangeProfileScreen extends StatefulWidget {
  const ChangeProfileScreen({super.key});

  @override
  State<ChangeProfileScreen> createState() => _ChangeProfileScreenState();
}

class _ChangeProfileScreenState extends State<ChangeProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Ubah Profile',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Data diri",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.green),
              ),
              SizedBox(height: 16),
              _buildTextField('Nama', 'Masukkan Nama Anda'),
              SizedBox(
                height: 8.0,
              ),
              _buildTextField('Email', 'Masukkan Email Anda'),
              SizedBox(
                height: 8.0,
              ),
              _buildTextField('No.Hp / No.WhatsApp', '089612345678'),
              SizedBox(height: 8),
              _buildTextField('Alamat', 'Jl. Pinang Baris No.43'),
              SizedBox(height: 8),
              _buildTextField('Jenis Kelamin', 'Laki-laki'),
              SizedBox(height: 24),
              Text(
                'Keamanan',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
              SizedBox(height: 16),
              ListTile(
                leading: Icon(Icons.lock_outline, color: Colors.green),
                title: Text('Ubah Password'),
                trailing: Icon(Icons.arrow_forward_ios, color: Colors.green),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ChangePasswordScreen()));
                },
              ),
              SizedBox(height: 32),
              Center(
                child: Container(
                  width: 200,
                  child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0))),
                      onPressed: () {},
                      icon: Icon(
                        Icons.exit_to_app,
                        color: Colors.white,
                      ),
                      label: Text(
                        'Keluar',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildTextField(String label, String value) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        label,
        style: TextStyle(
          fontSize: 14,
          color: Colors.black54,
        ),
      ),
      SizedBox(height: 4),
      TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          hintText: value,
        ),
      ),
    ],
  );
}
