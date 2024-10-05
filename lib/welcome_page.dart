import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/background.jpg'), // Menggunakan gambar sebagai latar belakang
            fit: BoxFit.cover, // Menyesuaikan ukuran gambar
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end, // Mengubah untuk menggeser konten ke bawah
          children: [
            const SizedBox(height: 20), // Menambahkan ruang di atas tulisan

            const Text(
              'Welcome in Attend UMM',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              textAlign: TextAlign.center, // Memusatkan teks
            ),
            const SizedBox(height: 50),

            // Tombol Login
            ElevatedButton(
              onPressed: () {
                // Navigasi ke halaman login
                Navigator.pushNamed(context, '/login');
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal:   90, vertical: 5),
                backgroundColor: Colors.white,
                foregroundColor: const Color.fromARGB(255, 76, 3, 5),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
              child: const Text(
                'Login',
                style: TextStyle(fontSize: 18),
              ),
            ),
            const SizedBox(height: 20),
            // Tombol Sign Up
            ElevatedButton(
              onPressed: () {
                // Navigasi ke halaman sign up
                Navigator.pushNamed(context, '/signup');
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 90, vertical: 5),
                backgroundColor: const Color(0xFF570606),
                foregroundColor: const Color.fromARGB(255, 255, 255, 255),
                shadowColor: const Color.fromARGB(255, 0, 0, 0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
              child: const Text(
                'Sign Up',
                style: TextStyle(fontSize: 18),
              ),
            ),
            const SizedBox(height: 30), // Menambahkan jarak di bawah tombol
          ],
        ),
      ),
    );
  }
}
