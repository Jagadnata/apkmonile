import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditProfileController extends GetxController {
  late TextEditingController nameController;
  late TextEditingController nimController;
  late TextEditingController emailController;
  late TextEditingController phoneController;

  @override
  void onInit() {
    super.onInit();
    nameController = TextEditingController();
    nimController = TextEditingController();
    emailController = TextEditingController();
    phoneController = TextEditingController();
  }

  @override
  void onClose() {
    nameController.dispose();
    nimController.dispose();
    emailController.dispose();
    phoneController.dispose();
    super.onClose();
  }

  void saveProfile(Function(String, String, String, String) onSave) {
    onSave(
      nameController.text,
      nimController.text,
      emailController.text,
      phoneController.text,
    );
    Get.back(); // Menggunakan Get untuk navigasi kembali
  }

  void deleteProfile(Function(String, String, String, String) onSave) {
    onSave('', '', '', '');
    Get.offAllNamed('/welcome'); // Menggunakan Get untuk menghapus stack dan navigasi ke WelcomePage
  }

  void setInitialData(String name, String nim, String email, String phone) {
    nameController.text = name;
    nimController.text = nim;
    emailController.text = email;
    phoneController.text = phone;
  }
}
