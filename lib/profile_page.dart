import 'package:flutter/material.dart';
import 'edit_profile_page.dart'; // Pastikan import EditProfilePage

class ProfilePage extends StatefulWidget {
  final String name;
  final String nim;
  final String email;
  final String phone;

  const ProfilePage({
    super.key,
    required this.name,
    required this.nim,
    required this.email,
    required this.phone,
  });

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late String name;
  late String nim;
  late String email;
  late String phone;

  @override
  void initState() {
    super.initState();
    // Set initial profile data
    name = widget.name;
    nim = widget.nim;
    email = widget.email;
    phone = widget.phone;
  }

  void _updateProfile(String newName, String newNim, String newEmail, String newPhone) {
    setState(() {
      name = newName;
      nim = newNim;
      email = newEmail;
      phone = newPhone;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        backgroundColor: const Color(0xFF570606), // Warna latar belakang AppBar
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/profiles.png'), // Ganti dengan nama file gambar Anda
            fit: BoxFit.cover, // Mengatur gambar untuk memenuhi area
          ),
        ),
        child: Padding(
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
              const SizedBox(height: 7),
              // Kartu untuk informasi profil
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
                        'Data Diri',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10),
                      ListTile(
                        title: const Text('Nama'),
                        subtitle: Text(name),
                      ),
                      ListTile(
                        title: const Text('NIM'),
                        subtitle: Text(nim),
                      ),
                      ListTile(
                        title: const Text('Email'),
                        subtitle: Text(email),
                      ),
                      ListTile(
                        title: const Text('Telepon'),
                        subtitle: Text(phone),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10),
              // Tombol Edit Profile
              ElevatedButton(
                onPressed: () {
                  // Navigasi ke halaman edit profile dan berikan data profile saat ini
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EditProfilePage(
                        name: name,
                        nim: nim,
                        email: email,
                        phone: phone,
                        onSave: _updateProfile, // Berikan fungsi untuk menyimpan perubahan
                      ),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  backgroundColor: const Color(0xFF570606), // Warna latar belakang tombol
                  foregroundColor: Colors.white, // Warna teks tombol
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                child: const Text('Edit Profile'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
