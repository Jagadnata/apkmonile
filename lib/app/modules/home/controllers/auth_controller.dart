import 'package:get/get.dart';

class AuthController extends GetxController {
  void logout() {
    // Tambahkan logika logout, seperti membersihkan token atau sesi pengguna
    Get.offAllNamed('/login');  // Navigasi ke halaman login
  }
}
