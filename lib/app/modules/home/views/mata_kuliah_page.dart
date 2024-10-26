import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/app/modules/home/controllers/auth_controller.dart';

class MataKuliahPage extends StatelessWidget {
  const MataKuliahPage({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthController authController = Get.put(AuthController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Mata Kuliah'),
        backgroundColor: const Color.fromARGB(0, 0, 0, 0),
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/MatKul.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            const Spacer(flex: 2),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Pilih Mata Kuliah:',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF750406),
                    ),
                  ),
                  const SizedBox(height: 20),
                  _buildCourseButton('Pemrograman Mobile', '/attendance'),
                  const SizedBox(height: 10),
                  _buildCourseButton('Pemrograman Web', '/attendance'),
                  const SizedBox(height: 10),
                  _buildCourseButton('Piranti Cerdas', '/attendance'),
                  const SizedBox(height: 10),
                  _buildCourseButton('Pemrograman Fungsional', '/attendance'),
                  const SizedBox(height: 10),
                  _buildCourseButton('Jaringan Komputer', '/attendance'),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                    ),
                    onPressed: () => authController.logout(),
                    child: const Text('Log Out'),
                  ),
                ],
              ),
            ),
            const Spacer(flex: 1),
          ],
        ),
      ),
    );
  }

  Widget _buildCourseButton(String title, String route) {
    return SizedBox(
      width: 250,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF750406),
          foregroundColor: Colors.white,
        ),
        onPressed: () {
          Get.toNamed(route);
        },
        child: Text(title),
      ),
    );
  }
}
