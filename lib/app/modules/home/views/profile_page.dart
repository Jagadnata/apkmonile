import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/profile_controller.dart';
import 'edit_profile_page.dart';

class ProfilePage extends StatelessWidget {
  final ProfileController profileController = Get.put(ProfileController());

  ProfilePage({
    super.key,
    required String name,
    required String nim,
    required String email,
    required String phone,
  }) {
    // Set initial profile data
    profileController.setProfile(name, nim, email, phone);
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
                      Obx(() => ListTile(
                        title: const Text('Nama'),
                        subtitle: Text(profileController.name.value),
                      )),
                      Obx(() => ListTile(
                        title: const Text('NIM'),
                        subtitle: Text(profileController.nim.value),
                      )),
                      Obx(() => ListTile(
                        title: const Text('Email'),
                        subtitle: Text(profileController.email.value),
                      )),
                      Obx(() => ListTile(
                        title: const Text('Telepon'),
                        subtitle: Text(profileController.phone.value),
                      )),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10),
              // Tombol Edit Profile
              ElevatedButton(
                onPressed: () {
                  Get.to(() => EditProfilePage(
                        name: profileController.name.value,
                        nim: profileController.nim.value,
                        email: profileController.email.value,
                        phone: profileController.phone.value,
                        onSave: (newName, newNim, newEmail, newPhone) {
                          profileController.setProfile(newName, newNim, newEmail, newPhone);
                        },
                      ));
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
