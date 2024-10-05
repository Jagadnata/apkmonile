import 'package:flutter/material.dart';

class EditProfilePage extends StatefulWidget {
  final String name;
  final String nim;
  final String email;
  final String phone;
  final Function(String, String, String, String) onSave;

  const EditProfilePage({
    super.key,
    required this.name,
    required this.nim,
    required this.email,
    required this.phone,
    required this.onSave,
  });

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  late TextEditingController nameController;
  late TextEditingController nimController;
  late TextEditingController emailController;
  late TextEditingController phoneController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.name);
    nimController = TextEditingController(text: widget.nim);
    emailController = TextEditingController(text: widget.email);
    phoneController = TextEditingController(text: widget.phone);
  }

  @override
  void dispose() {
    nameController.dispose();
    nimController.dispose();
    emailController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  void _saveProfile() {
    // Panggil fungsi onSave yang diberikan dari ProfilePage
    widget.onSave(
      nameController.text,
      nimController.text,
      emailController.text,
      phoneController.text,
    );
    Navigator.pop(context); // Kembali ke halaman profil
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile'),
        backgroundColor: const Color(0xFF570606), // Warna latar belakang AppBar
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/background.jpg'), // Ganti dengan nama file gambar Anda
            fit: BoxFit.cover, // Mengatur gambar untuk memenuhi area
          ),
        ),
        child: SingleChildScrollView( // Tambahkan SingleChildScrollView
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Gambar profil
              Center(
                child: CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.grey[300], // Warna latar belakang jika gambar tidak ada
                  child: const Icon(Icons.person, size: 50, color: Color.fromARGB(255, 83, 80, 80)),
                ),
              ),
              const SizedBox(height: 20),
              // Kartu untuk form edit profil
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Edit Data Diri',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 20),
                      TextField(
                        controller: nameController,
                        decoration: const InputDecoration(labelText: 'Nama'),
                        onTap: () {
                          FocusScope.of(context).requestFocus(FocusNode()); // Menyembunyikan keyboard saat mengetik
                        },
                      ),
                      TextField(
                        controller: nimController,
                        decoration: const InputDecoration(labelText: 'NIM'),
                        onTap: () {
                          FocusScope.of(context).requestFocus(FocusNode()); // Menyembunyikan keyboard saat mengetik
                        },
                      ),
                      TextField(
                        controller: emailController,
                        decoration: const InputDecoration(labelText: 'Email'),
                        onTap: () {
                          FocusScope.of(context).requestFocus(FocusNode()); // Menyembunyikan keyboard saat mengetik
                        },
                      ),
                      TextField(
                        controller: phoneController,
                        decoration: const InputDecoration(labelText: 'Telepon'),
                        onTap: () {
                          FocusScope.of(context).requestFocus(FocusNode()); // Menyembunyikan keyboard saat mengetik
                        },
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // Tombol Simpan
              ElevatedButton(
                onPressed: _saveProfile,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  backgroundColor: const Color(0xFF570606), // Warna latar belakang tombol
                  foregroundColor: Colors.white, // Warna teks tombol
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                child: const Text('Simpan Perubahan'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
