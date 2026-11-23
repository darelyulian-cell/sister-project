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
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(25),
          child: Column(
            children: [
              const SizedBox(height: 30),

              const Icon(
                Icons.school,
                color: AppTheme.maroon,
                size: 85,
              ),

              const SizedBox(height: 20),

              const Text(
                'SISTER SKANSIKA',
                style: TextStyle(
                  fontSize: 27,
                  fontWeight: FontWeight.bold,
                  color: AppTheme.maroon,
                ),
              ),

              const Text(
                'Sistem Informasi Terpadu',
                style: TextStyle(color: Colors.grey),
              ),

              const SizedBox(height: 40),

              TextField(
                controller: usernameController,
                decoration: const InputDecoration(
                  labelText: 'NIS / Username',
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 20),

              TextField(
                controller: passwordController,
                obscureText: obscurePassword,
                decoration: InputDecoration(
                  labelText: 'Password',
                  prefixIcon: const Icon(Icons.lock),
                  border: const OutlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: Icon(
                      obscurePassword
                          ? Icons.visibility_off
                          : Icons.visibility,
                    ),
                    onPressed: () {
                      setState(() {
                        obscurePassword = !obscurePassword;
                      });
                    },
                  ),
                ),
              ),

              const SizedBox(height: 25),

              ElevatedButton(
                onPressed: login,
                child: const Text('MASUK'),
              ),

              const SizedBox(height: 20),

              const Text(
                'SMK NEGERI 1 BUKATEJA',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}