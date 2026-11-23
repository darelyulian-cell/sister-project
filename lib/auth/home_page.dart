import 'package:flutter/material.dart';
import '../pages/app_them.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SISTER SKANSIKA'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(18),
        children: [
          const Text(
            'Halo, Dareal!',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),

          const Text(
            'Selamat datang di SISTER SKANSIKA',
            style: TextStyle(color: Colors.grey),
          ),

          const SizedBox(height: 20),

          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: AppTheme.maroon,
              borderRadius: BorderRadius.circular(15),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'SISWA AKTIF',
                  style: TextStyle(color: Colors.white70),
                ),
                SizedBox(height: 10),
                Text(
                  'Dareal Prizqi Putra Yulian',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 19,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  'Kelas XI RPL',
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          const Text(
            'Informasi Akademik',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 12),

          Row(
            children: [
              _infoCard('14', 'Mata Pelajaran'),
              _infoCard('7', 'Tugas'),
              _infoCard('0', 'Tugas Aktif'),
            ],
          ),

          const SizedBox(height: 25),

          const Text(
            'Jadwal Pelajaran',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 12),

          _schedule('07.00 - 08.30', 'Bahasa Indonesia'),
          _schedule('08.30 - 10.00', 'Bahasa Inggris'),
          _schedule('10.15 - 11.45', 'Pemrograman Web'),
          _schedule('12.30 - 14.00', 'Basis Data'),
        ],
      ),
    );
  }

  Widget _infoCard(String number, String title) {
    return Expanded(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 18),
          child: Column(
            children: [
              Text(
                number,
                style: const TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                  color: AppTheme.maroon,
                ),
              ),
              Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 11),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _schedule(String time, String subject) {
    return Card(
      child: ListTile(
        leading: const Icon(
          Icons.book,
          color: AppTheme.maroon,
        ),
        title: Text(subject),
        subtitle: Text(time),
        trailing: const Icon(Icons.arrow_forward_ios, size: 15),
      ),
    );
  }
}