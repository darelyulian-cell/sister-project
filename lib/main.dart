import 'package:flutter/material.dart';
import '../pages/app_them.dart';
import '../auth/login_page.dart';

void main() {
  runApp(const SisterApp());
}

class SisterApp extends StatelessWidget {
  const SisterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SISTER SKANSIKA',
      theme: AppTheme.lightTheme,
      home: const LoginPage(),
    );
  }
}