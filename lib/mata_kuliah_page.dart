import 'package:flutter/material.dart';

class MataKuliahPage extends StatelessWidget {
  const MataKuliahPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mata Kuliah'),
        backgroundColor: const Color.fromARGB(0, 0, 0, 0), // Transparan agar background terlihat
        elevation: 0, // Menghilangkan bayangan pada AppBar
      ),
      extendBodyBehindAppBar: true, // Agar background menutupi seluruh layar
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/MatKul.png'), // Gambar background
            fit: BoxFit.cover, // Menyesuaikan gambar dengan ukuran layar
          ),
        ),
        child: Column(
          children: [
            const Spacer(flex: 2), // Spacer untuk mendorong konten ke bawah
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Pilih Mata Kuliah:',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF750406), // Warna teks agar kontras dengan background
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Button 1
                  SizedBox(
                    width: 250, // Mengatur lebar tombol agar seragam
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF750406), // Warna latar belakang tombol
                        foregroundColor: Colors.white, // Warna teks tombol menjadi putih
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/attendance');
                      },
                      child: const Text('Pemrograman Mobile'),
                    ),
                  ),
                  const SizedBox(height: 10),

                  // Button 2
                  SizedBox(
                    width: 250,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF750406),
                        foregroundColor: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/attendance');
                      },
                      child: const Text('Pemrograman Web'),
                    ),
                  ),
                  const SizedBox(height: 10),

                  // Button 3
                  SizedBox(
                    width: 250,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF750406),
                        foregroundColor: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/attendance');
                      },
                      child: const Text('Piranti Cerdas'),
                    ),
                  ),
                  const SizedBox(height: 10),

                  // Button 4
                  SizedBox(
                    width: 250,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF750406),
                        foregroundColor: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/attendance');
                      },
                      child: const Text('Pemrograman Fungsional'),
                    ),
                  ),
                  const SizedBox(height: 10),

                  // Button 5
                  SizedBox(
                    width: 250,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF750406),
                        foregroundColor: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/attendance');
                      },
                      child: const Text('Jaringan Komputer'),
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(flex: 1), // Spacer tambahan untuk lebih banyak ruang di bawah
          ],
        ),
      ),
    );
  }
}
