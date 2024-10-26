import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/app/modules/home/controllers/sign_up_controller.dart';

class SignUpPage extends StatelessWidget {
  final Function(String, String, String, String, String) onSignUp;

  const SignUpPage({super.key, required this.onSignUp});

  @override
  Widget build(BuildContext context) {
    // Get the SignUpController instance
    final SignUpController controller = Get.find<SignUpController>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0x2FF1EDED),
        elevation: 70,
        title: const Text('Sign Up', style: TextStyle(color: Color(0xFF751616))),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/background.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const SizedBox(height: 20),
              _buildTextField(controller.nameController, 'Nama', controller),
              _buildTextField(controller.nimController, 'NIM', controller),
              _buildTextField(controller.emailController, 'Email', controller),
              _buildTextField(controller.phoneController, 'Nomor Telepon', controller),
              _buildTextField(controller.passwordController, 'Password', controller, obscureText: true),
              const SizedBox(height: 20),
              Obx(() => ElevatedButton(
                    onPressed: controller.isFormValid.value
                        ? () {
                            // Simpan data pengguna
                            onSignUp(
                              controller.nameController.text,
                              controller.nimController.text,
                              controller.emailController.text,
                              controller.phoneController.text,
                              controller.passwordController.text,
                            );

                            // Setelah data disimpan, arahkan ke halaman home
                            Get.offAllNamed('/home'); // Navigasi ke halaman home
                          }
                        : null,
                    child: const Text('Sign Up'),
                  )),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(
      TextEditingController controller, String labelText, SignUpController signUpController,
      {bool obscureText = false}) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      decoration: BoxDecoration(
        color: signUpController.formBackgroundColor.value,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            offset: Offset(0, 2),
            blurRadius: 5,
          ),
        ],
      ),
      child: TextField(
        controller: controller,
        onChanged: (value) {
          // Call the checkFormValidity method on the SignUpController instance
          signUpController.checkFormValidity(); // Corrected to use signUpController
        },
        decoration: InputDecoration(labelText: labelText, border: InputBorder.none),
        obscureText: obscureText,
      ),
    );
  }
}
