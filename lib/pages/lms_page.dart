import 'package:flutter/material.dart';
import 'app_them.dart';

class LmsPage extends StatefulWidget {
  const LmsPage({super.key});

  @override
  State<LmsPage> createState() => _LmsPageState();
}

class _LmsPageState extends State<LmsPage> {
  final TextEditingController searchController =
      TextEditingController();

  final List<String> subjects = [
    'Bahasa Indonesia',
    'Bahasa Inggris',
    'Bahasa Jawa',
    'Matematika',
    'Basis Data',
    'Pemrograman Web',
    'Pemrograman Mobile',
    'Pendidikan Agama Islam',
  ];

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final filteredSubjects = subjects
        .where((subject) => subject
            .toLowerCase()
            .contains(searchController.text.toLowerCase()))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pembelajaran'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              controller: searchController,
              onChanged: (_) => setState(() {}),
              decoration: InputDecoration(
                hintText: 'Cari mata pelajaran...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),

          Expanded(
            child: ListView.builder(
              itemCount: filteredSubjects.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 6,
                  ),
                  child: ListTile(
                    leading: const CircleAvatar(
                      backgroundColor: AppTheme.maroon,
                      child: Icon(
                        Icons.menu_book,
                        color: Colors.white,
                      ),
                    ),
                    title: Text(filteredSubjects[index]),
                    subtitle: const Text('Materi pembelajaran siswa'),
                    trailing: const Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text(filteredSubjects[index]),
                          content: const Text(
                            'Materi pembelajaran belum tersedia.',
                          ),
                          actions: [
                            TextButton(
                              onPressed: () =>
                                  Navigator.pop(context),
                              child: const Text('Tutup'),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}