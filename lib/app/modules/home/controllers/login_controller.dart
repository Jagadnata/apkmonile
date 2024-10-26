// LoginController.dart

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  var isFormValid = false.obs;
  var errorMessage = ''.obs;
  var isPasswordVisible = false.obs;

  // Fungsi untuk validasi form
  void validateForm() {
    isFormValid.value = usernameController.text.isNotEmpty &&
        passwordController.text.isNotEmpty;
  }

  // Fungsi untuk toggle visibility password
  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  // Fungsi untuk login dengan username/password hardcoded
  void attemptLogin(Function(String, String) onLogin) {
    // Hardcoded user credentials
    const validUsername = 'john';
    const validPassword = '123456';

    if (usernameController.text == validUsername &&
        passwordController.text == validPassword) {
      onLogin(usernameController.text, passwordController.text);
      Get.offNamed('/profile'); // Arahkan langsung ke halaman profile
    } else {
      errorMessage.value = 'Username atau password salah';
    }
  }
}
