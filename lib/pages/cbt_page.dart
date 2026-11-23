import 'package:flutter/material.dart';
import '../pages/app_them.dart';

class CbtPage extends StatelessWidget {
  const CbtPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Computer Based Test'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.assignment,
                size: 90,
                color: AppTheme.maroon,
              ),
              const SizedBox(height: 20),
              const Text(
                'CBT Segera Hadir!',
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Fitur Computer Based Test untuk '
                'mengikuti ujian secara online.',
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 25),
              ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Belum ada ujian tersedia'),
                    ),
                  );
                },
                child: const Text('Lihat Ujian'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}