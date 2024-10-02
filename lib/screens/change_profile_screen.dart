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
        title: const Center(
          child: Text(
            'Ubah Profile',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Data diri",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.green),
                ),
                const SizedBox(height: 16),
                _buildTextField('Nama', 'Masukkan Nama Anda'),
                const SizedBox(
                  height: 8.0,
                ),
                _buildTextField('Email', 'Masukkan Email Anda'),
                const SizedBox(
                  height: 8.0,
                ),
                _buildTextField('No.Hp / No.WhatsApp', '089612345678'),
                const SizedBox(
                  height: 8.0,
                ),
                Center(
                  child: Container(
                    width: 200,
                    child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0))),
                        onPressed: () {},
                        icon: const Icon(
                          Icons.save_alt,
                          color: Colors.white,
                        ),
                        label: const Text(
                          'Simpan',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.white),
                        )),
                  ),
                ),
                const Text(
                  'Keamanan',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
                const SizedBox(height: 16),
                ListTile(
                  leading: const Icon(Icons.lock_outline, color: Colors.green),
                  title: const Text('Ubah Password'),
                  trailing:
                      const Icon(Icons.arrow_forward_ios, color: Colors.green),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ChangePasswordScreen()));
                  },
                ),
                const SizedBox(height: 32),
                Center(
                  child: Container(
                    width: 200,
                    child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0))),
                        onPressed: () {},
                        icon: const Icon(
                          Icons.exit_to_app,
                          color: Colors.white,
                        ),
                        label: const Text(
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
        style: const TextStyle(
          fontSize: 14,
          color: Colors.black54,
        ),
      ),
      const SizedBox(height: 4),
      TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          hintText: value,
        ),
      ),
    ],
  );
}
