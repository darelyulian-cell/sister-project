import 'package:flutter/material.dart';
import 'app_them.dart';

class AttendancePage extends StatelessWidget {
  const AttendancePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Presensi'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 30),

            const Icon(
              Icons.face_retouching_natural,
              size: 110,
              color: AppTheme.maroon,
            ),

            const SizedBox(height: 20),

            const Text(
              'Presensi Wajah',
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            const Text(
              'Silakan lakukan presensi untuk mencatat '
              'kehadiran kamu.',
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 30),

            ElevatedButton.icon(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                      'Fitur kamera belum diaktifkan',
                    ),
                  ),
                );
              },
              icon: const Icon(Icons.camera_alt),
              label: const Text('Mulai Presensi'),
            ),

            const SizedBox(height: 30),

            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Riwayat Presensi',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const Card(
              child: ListTile(
                leading: Icon(
                  Icons.check_circle,
                  color: Colors.green,
                ),
                title: Text('Presensi Masuk'),
                subtitle: Text('Belum ada riwayat'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}