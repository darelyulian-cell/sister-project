
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'app_them.dart';

class AttendancePage extends StatefulWidget {
  const AttendancePage({super.key});

  @override
  State<AttendancePage> createState() => _AttendancePageState();
}

class _AttendancePageState extends State<AttendancePage> {
  bool loading = false;
  String status = 'Belum melakukan presensi';
  String location = 'Lokasi belum diambil';

  Future<Position> getLocation() async {
    bool serviceEnabled =
        await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) {
      throw Exception('Aktifkan GPS terlebih dahulu');
    }

    LocationPermission permission =
        await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      throw Exception('Izin lokasi belum diberikan');
    }

    return await Geolocator.getCurrentPosition();
  }

  Future<void> attendance(String type) async {
    if (loading) return;

    setState(() => loading = true);

    try {
      final position = await getLocation();
      final prefs = await SharedPreferences.getInstance();

      final now = DateTime.now();
      final today =
          '${now.year}-${now.month}-${now.day}';

      final savedDate = prefs.getString('attendance_date');

      if (savedDate != today) {
        await prefs.setString('attendance_date', today);
        await prefs.remove('check_in');
        await prefs.remove('check_out');
        await prefs.remove('attendance_status');
      }

      final key = type == 'Masuk' ? 'check_in' : 'check_out';

      if (prefs.getString(key) != null) {
        throw Exception('Presensi $type sudah dilakukan');
      }

      if (type == 'Pulang' &&
          prefs.getString('check_in') == null) {
        throw Exception('Silakan presensi masuk terlebih dahulu');
      }

      final time =
          '${now.hour.toString().padLeft(2, '0')}:'
          '${now.minute.toString().padLeft(2, '0')}';

      await prefs.setString(key, time);

      if (type == 'Masuk') {
        final attendanceStatus =
            (now.hour < 7 || (now.hour == 7 && now.minute == 0))
                ? 'Tepat Waktu'
                : 'Terlambat';

        await prefs.setString(
            'attendance_status', attendanceStatus);
        status = attendanceStatus;
      } else {
        status = 'Presensi pulang berhasil';
      }

      await prefs.setString(
        'attendance_location',
        '${position.latitude}, ${position.longitude}',
      );

      if (!mounted) return;

      setState(() {
        location =
            'Latitude: ${position.latitude}\n'
            'Longitude: ${position.longitude}';
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Presensi $type berhasil pukul $time'),
        ),
      );
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              e.toString().replaceFirst('Exception: ', ''),
            ),
          ),
        );
      }
    } finally {
      if (mounted) setState(() => loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Presensi')),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const Icon(
            Icons.location_on,
            size: 75,
            color: AppTheme.maroon,
          ),
          const SizedBox(height: 15),
          const Text(
            'Presensi Masuk dan Pulang',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18),
          ),
          const SizedBox(height: 25),
          ElevatedButton(
            onPressed:
                loading ? null : () => attendance('Masuk'),
            child: const Text('Presensi Masuk'),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed:
                loading ? null : () => attendance('Pulang'),
            child: const Text('Presensi Pulang'),
          ),
          if (loading)
            const Padding(
              padding: EdgeInsets.all(15),
              child: Center(child: CircularProgressIndicator()),
            ),
          const SizedBox(height: 20),
          Card(
            child: ListTile(
              leading: const Icon(
                Icons.check_circle,
                color: AppTheme.maroon,
              ),
              title: const Text('Status'),
              subtitle: Text(status),
            ),
          ),
          Card(
            child: ListTile(
              leading: const Icon(
                Icons.location_on,
                color: AppTheme.maroon,
              ),
              title: const Text('Lokasi GPS'),
              subtitle: Text(location),
            ),
          ),
        ],
      ),
    );
  }
}
