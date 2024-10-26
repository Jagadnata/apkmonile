// LoginPage.dart

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/app/modules/home/controllers/login_controller.dart';

class LoginPage extends StatelessWidget {
  final Function(String, String) onLogin;

  const LoginPage({
    super.key,
    required this.onLogin, required List<Map<String, String>> registeredUsers,
  });

  @override
  Widget build(BuildContext context) {
    final LoginController controller = Get.put(LoginController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: controller.usernameController,
              decoration: const InputDecoration(labelText: 'Username'),
              onChanged: (value) => controller.validateForm(),
            ),
            Obx(() => TextField(
                  controller: controller.passwordController,
                  obscureText: !controller.isPasswordVisible.value,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    suffixIcon: IconButton(
                      icon: Icon(
                        controller.isPasswordVisible.value
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                      onPressed: controller.togglePasswordVisibility,
                    ),
                  ),
                  onChanged: (value) => controller.validateForm(),
                )),
            const SizedBox(height: 20),
            Obx(() => ElevatedButton(
                  onPressed: controller.isFormValid.value
                      ? () => controller.attemptLogin(onLogin)
                      : null,
                  child: const Text('Login'),
                )),
            const SizedBox(height: 10),
            Obx(() => controller.errorMessage.isNotEmpty
                ? Text(
                    controller.errorMessage.value,
                    style: const TextStyle(color: Colors.red),
                  )
                : Container()),
          ],
        ),
      ),
    );
  }
}
