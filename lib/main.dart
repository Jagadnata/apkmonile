import 'package:flutter/material.dart';
import 'welcome_page.dart';
import 'login_page.dart'; // Pastikan import login_page
import 'signup_page.dart'; // Pastikan import signup_page
import 'mata_kuliah_page.dart'; // Pastikan import mata_kuliah_page
import 'profile_page.dart'; // Pastikan import profile_page
import 'attendance_page.dart'; // Import attendance_page


void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // Variabel untuk menyimpan data profile
  String name = '';
  String nim = '';
  String email = '';
  String phone = '';

  // List untuk menyimpan pengguna yang terdaftar
  List<Map<String, String>> registeredUsers = [];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Attend UMM',
      initialRoute: '/',
      routes: {
        '/': (context) => const WelcomePage(),
        '/login': (context) => LoginPage(
          onLogin: (nameInput, passwordInput) {
            // Cek kredensial pengguna
            final user = registeredUsers.firstWhere(
              (user) => user['name'] == nameInput && user['password'] == passwordInput,
              orElse: () => {},
            );

            if (user.isEmpty) {
              // Jika tidak ada pengguna yang cocok
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Username atau Password salah')),
              );
            } else {
              // Jika berhasil, navigasi ke halaman mata kuliah
              Navigator.pushNamed(context, '/mata_kuliah');
            }
          },
          registeredUsers: registeredUsers, // Menggunakan daftar pengguna terdaftar
        ),
        '/signup': (context) => SignUpPage(
          onSignUp: (nameInput, nimInput, emailInput, phoneInput, passwordInput) {
            // Simpan data ketika sign up
            setState(() {
              name = nameInput;
              nim = nimInput;
              email = emailInput;
              phone = phoneInput;
              // Menambahkan pengguna baru ke daftar pengguna terdaftar
              registeredUsers.add({
                'name': nameInput,
                'password': passwordInput, // Simpan password juga
              });
            });
            // Navigasi ke halaman login setelah sign up
            Navigator.pushNamed(context, '/login'); 
          },
        ),
        '/mata_kuliah': (context) => const MataKuliahPage(),
        '/attendance': (context) => const AttendancePage(), // Rute untuk AttendancePage
        '/profile': (context) => ProfilePage(
          name: name,
          nim: nim,
          email: email,
          phone: phone,
        ), // Rute untuk ProfilePage
        
      },
    );
  }
}
