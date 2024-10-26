import 'package:get/get.dart';
import 'package:myapp/app/modules/home/controllers/edit_profile_controller.dart';
import 'package:myapp/app/modules/home/controllers/home_controller.dart';
import 'package:myapp/app/modules/home/controllers/login_controller.dart';
import 'package:myapp/app/modules/home/controllers/profile_controller.dart';
import 'package:myapp/app/modules/home/controllers/sign_up_controller.dart';
// Home Page
import 'package:myapp/app/modules/home/views/welcome_page.dart'; // Welcome Page
import 'package:myapp/app/modules/home/views/login_page.dart'; // Login Page
import 'package:myapp/app/modules/home/views/profile_page.dart'; // Profile Page
import 'package:myapp/app/modules/home/views/edit_profile_page.dart'; // Edit Profile
import 'package:myapp/app/modules/home/views/sign_up_page.dart'; // Sign Up Page

// Part untuk app_routes.dart yang berisi definisi rute dan path
part 'app_routes.dart';

class AppPages {
  AppPages._(); // Constructor privat agar tidak bisa di-instantiate

  static const INITIAL = Routes.HOME; // Halaman pertama saat aplikasi dibuka

  static final routes = [
    // Welcome Page
    GetPage(
      name: _Paths.HOME,
      page: () => const WelcomePage(),
      binding: BindingsBuilder(() {
        Get.lazyPut<HomeController>(() => HomeController());
      }),
    ),

    // Login Page
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginPage(
        onLogin: (username, password) {
          print('Login berhasil: $username');
          Get.offNamed(Routes.PROFILE); // Pindah ke halaman Profile
        },
        registeredUsers: const [
          {'username': 'john', 'password': '123456'},
          {'username': 'jane', 'password': 'password123'},
        ],
      ),
      binding: BindingsBuilder(() {
        Get.lazyPut<LoginController>(() => LoginController());
      }),
    ),

    // Profile Page
    GetPage(
      name: _Paths.PROFILE,
      page: () => ProfilePage(
        name: 'John Doe',
        nim: '123456',
        email: 'john@example.com',
        phone: '08123456789',
      ),
      binding: BindingsBuilder(() {
        Get.lazyPut<ProfileController>(() => ProfileController());
      }),
    ),

    // Edit Profile Page
    GetPage(
      name: _Paths.EDIT_PROFILE,
      page: () => EditProfilePage(
        name: 'John Doe',
        nim: '123456',
        email: 'john@example.com',
        phone: '08123456789',
        onSave: (name, nim, email, phone) {
          print('Profile updated: $name, $nim, $email, $phone');
        },
      ),
      binding: BindingsBuilder(() {
        Get.lazyPut<EditProfileController>(() => EditProfileController());
      }),
    ),

    // Sign Up Page
    GetPage(
      name: _Paths.SIGN_UP,
      page: () => SignUpPage(
        onSignUp: (name, nim, email, phone, password) {
          print('User signed up: $name, $nim');
        },
      ),
      binding: BindingsBuilder(() {
        Get.lazyPut<SignUpController>(() => SignUpController());
      }),
    ),
  ];
}
