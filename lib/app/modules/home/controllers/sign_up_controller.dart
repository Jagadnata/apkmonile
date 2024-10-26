import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUpController extends GetxController {
  final nameController = TextEditingController();
  final nimController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();

  // Observable untuk validasi form dan warna background
  var isFormValid = false.obs;
  var formBackgroundColor = Colors.white.obs;

  @override
  void onInit() {
    super.onInit();

    // Tambahkan listener untuk memantau perubahan di setiap TextField
    nameController.addListener(checkFormValidity);
    nimController.addListener(checkFormValidity);
    emailController.addListener(checkFormValidity);
    phoneController.addListener(checkFormValidity);
    passwordController.addListener(checkFormValidity);
  }

  @override
  void onClose() {
    // Dispose semua controller saat tidak digunakan lagi
    nameController.dispose();
    nimController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  // Fungsi untuk mengecek validitas form
  void checkFormValidity() {
    isFormValid.value = nameController.text.isNotEmpty &&
        nimController.text.isNotEmpty &&
        emailController.text.isNotEmpty &&
        phoneController.text.isNotEmpty &&
        passwordController.text.isNotEmpty;

    // Ubah warna background jika form valid
    formBackgroundColor.value = isFormValid.value
        ? Colors.green[100] ?? Colors.white
        : Colors.white;
  }

  // Fungsi untuk menyimpan data pengguna ke SharedPreferences
  Future<void> signUp() async {
    final prefs = await SharedPreferences.getInstance();

    // Ambil daftar pengguna yang tersimpan (atau buat list baru jika kosong)
    final users = prefs.getStringList('users') ?? [];

    // Simpan data pengguna dalam format 'name;nim;email;phone;password'
    final newUser =
        '${nameController.text};${nimController.text};${emailController.text};${phoneController.text};${passwordController.text}';
    users.add(newUser);

    // Simpan kembali daftar pengguna
    await prefs.setStringList('users', users);

    // Arahkan kembali ke halaman login setelah sign-up berhasil
    Get.back();
  }
}
