import 'package:flutter/material.dart';
import 'dart:async';  // Untuk menampilkan waktu secara live
import 'package:intl/intl.dart'; // Impor package intl

class AttendancePage extends StatefulWidget {
  const AttendancePage({super.key});

  @override
  _AttendancePageState createState() => _AttendancePageState();
}

class _AttendancePageState extends State<AttendancePage> {
  String clockInTime = '';
  String clockOutTime = '';
  List<String> attendanceHistory = [];
  
  // Status untuk tombol
  bool isClockInEnabled = true;
  bool isClockOutEnabled = false;

  // Fungsi untuk mendapatkan waktu saat ini
  String getCurrentTime() {
    return DateFormat('HH:mm:ss').format(DateTime.now()); // Format jam
  }

  // Fungsi untuk mendapatkan tanggal saat ini
  String getCurrentDate() {
    return DateFormat('EEEE, d MMMM yyyy').format(DateTime.now()); // Format tanggal
  }

  // Fungsi untuk clock in
  void handleClockIn() {
    setState(() {
      clockInTime = getCurrentTime();
      attendanceHistory.add('Clock In: $clockInTime');
      // Nonaktifkan tombol clock in setelah diklik
      isClockInEnabled = false;
      // Aktifkan tombol clock out
      isClockOutEnabled = true;
    });
  }

  // Fungsi untuk clock out
  void handleClockOut() {
    setState(() {
      clockOutTime = getCurrentTime();
      attendanceHistory.add('Clock Out: $clockOutTime');
      // Nonaktifkan tombol clock out setelah diklik
      isClockOutEnabled = false;
    });
  }

  // Fungsi untuk kembali ke halaman Welcome
  void handleClose() {
    Navigator.pushNamedAndRemoveUntil(context, '/', (Route<dynamic> route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Attendance'),
        actions: [
          IconButton(
            icon: const CircleAvatar(
              backgroundColor: Color.fromARGB(255, 131, 134, 136),
              child: Icon(Icons.person),
            ),
            onPressed: () {
              Navigator.pushNamed(context, '/profile');  // Navigasi ke halaman profile
            },
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/background.jpg'), // Ganti dengan nama file gambar Anda
            fit: BoxFit.cover, // Mengatur gambar untuk memenuhi area
          ),
        ),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // Live date and time
            StreamBuilder(
              stream: Stream.periodic(const Duration(seconds: 1)),
              builder: (context, snapshot) {
                return Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.white, // Warna latar belakang untuk jam dan tanggal
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 4,
                        offset: Offset(2, 2),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Text(
                        getCurrentTime(),
                        style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black), // Warna teks jam
                      ),
                      const SizedBox(height: 10),
                      Text(
                        getCurrentDate(),
                        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Colors.black), // Warna teks tanggal
                      ),
                    ],
                  ),
                );
              },
            ),
            const Text(
              'Rentang Absensi: 1 Jam',
              style: TextStyle(fontSize: 18, color: Colors.white), // Warna teks
            ),
            const SizedBox(height: 20),
            // Tombol Clock In
            ElevatedButton(
              onPressed: isClockInEnabled ? handleClockIn : null, // Tombol hanya aktif jika clock in diizinkan
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green, // Warna latar belakang tombol
              ),
              child: const Text(
                'Clock In',
                style: TextStyle(color: Colors.white), // Warna teks tombol
              ),
            ),
            const SizedBox(height: 10),
            // Tombol Clock Out
            ElevatedButton(
              onPressed: isClockOutEnabled ? handleClockOut : null, // Tombol hanya aktif jika clock out diizinkan
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red, // Warna latar belakang tombol
              ),
              child: const Text(
                'Clock Out',
                style: TextStyle(color: Colors.white), // Warna teks tombol
              ),
            ),
            const SizedBox(height: 30),
            // Attendance History
            const Text(
              'Attendance History:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white), // Warna teks
            ),
            // Daftar riwayat kehadiran
            Expanded(
              child: ListView.builder(
                itemCount: attendanceHistory.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(attendanceHistory[index], style: const TextStyle(color: Colors.white)), // Warna teks
                  );
                },
              ),
            ),
            ElevatedButton(
              onPressed: handleClose,
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 5),
                backgroundColor: Colors.white,
                foregroundColor: const Color.fromARGB(255, 76, 3, 5),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              child: const Text(
                'close',
                style: TextStyle(fontSize: 15),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
