import 'package:flutter/material.dart';
import '../auth/login_page.dart';
import 'app_them.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Akun Saya'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const SizedBox(height: 20),

          const CircleAvatar(
            radius: 55,
            backgroundColor: AppTheme.maroon,
            child: Icon(
              Icons.person,
              size: 65,
              color: Colors.white,
            ),
          ),

          const SizedBox(height: 15),

          const Center(
            child: Text(
              'Dareal Prizqi Putra Yulian',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 19,
              ),
            ),
          ),

          const Center(
            child: Text(
              'XI RPL',
              style: TextStyle(color: Colors.grey),
            ),
          ),

          const SizedBox(height: 30),

          _menu(Icons.person, 'Data Diri'),
          _menu(Icons.assignment, 'Riwayat Akademik'),
          _menu(Icons.face, 'Registrasi Wajah'),
          _menu(Icons.lock, 'Ubah Password'),
          _menu(Icons.settings, 'Pengaturan'),

          const SizedBox(height: 20),

          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
            ),
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => const LoginPage(),
                ),
                (route) => false,
              );
            },
            icon: const Icon(Icons.logout),
            label: const Text('Logout'),
          ),
        ],
      ),
    );
  }

  Widget _menu(IconData icon, String title) {
    return Card(
      child: ListTile(
        leading: Icon(icon, color: AppTheme.maroon),
        title: Text(title),
        trailing: const Icon(Icons.arrow_forward_ios, size: 15),
        onTap: () {},
      ),
    );
  }
}