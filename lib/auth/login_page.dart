import 'package:flutter/material.dart';
import '../pages/bottom_nav.dart';
import '../pages/app_them.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  bool obscurePassword = true;

  void login() {
    if (usernameController.text.isEmpty ||
        passwordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Username dan password harus diisi'),
        ),
      );
      return;
    }

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const BottomNav(),
      ),
    );
  }

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 40.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),

              
              const Text(
                'SISTER\nSKANSIKA',
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: AppTheme.maroon,                                                                       
                  height: 1.1,
                ),
              ),
              const SizedBox(height: 12),

              
              Container(
                width: 40,
                height: 4,
                color: AppTheme.maroon, 
              ),
              const SizedBox(height: 16),

              
              const Text(
                'Sistem Informasi Sekolah Terintegrasi\nSMK Negeri 1 Bukateja',
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xFF6B7280),
                  height: 1.4,
                ),
              ),
              const SizedBox(height: 48),

              
              const Text(
                'NIS / USERNAME',
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF4B5563),
                  letterSpacing: 1.2,
                ),
              ),
              TextField(
                controller: usernameController,
                style: const TextStyle(fontSize: 16, color: Colors.black),
                decoration: const InputDecoration(
                  hintText: '9224',
                  hintStyle: TextStyle(color: Color(0xFF9CA3AF)),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFE5E7EB)),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: AppTheme.maroon),
                  ),
                ),
              ),
              const SizedBox(height: 32),

              
              const Text(
                'PASSWORD',
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF4B5563),
                  letterSpacing: 1.2,
                ),
              ),
              TextField(
                controller: passwordController,
                obscureText: obscurePassword,
                style: const TextStyle(fontSize: 16, color: Colors.black),
                decoration: InputDecoration(
                  hintText: '••••••••••',
                  hintStyle: const TextStyle(color: Color(0xFF9CA3AF)),
                  enabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFE5E7EB)),
                  ),
                  focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: AppTheme.maroon),
                  ),
                  suffixIcon: TextButton(
                    onPressed: () {
                      setState(() {
                        obscurePassword = !obscurePassword;
                      });
                    },
                    child: Text(
                      obscurePassword ? 'Lihat' : 'Sembunyikan',
                      style: const TextStyle(
                        color: AppTheme.maroon, 
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 48),

            
              SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton(
                  onPressed: login,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppTheme.maroon, 
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    elevation: 0,
                  ),
                  child: const Text(
                    'Masuk',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),

             
              const Center(
                child: Text(
                  'Lupa password? Hubungi wali kelas.',
                  style: TextStyle(
                    fontSize: 13,
                    color: Color(0xFF6B7280),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}