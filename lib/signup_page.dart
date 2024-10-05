import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  final Function(String, String, String, String, String) onSignUp;

  const SignUpPage({super.key, required this.onSignUp});

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController nimController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool isFormValid = false;
  Color formBackgroundColor = const Color.fromARGB(109, 241, 236, 236); // Warna latar belakang form

  @override
  void initState() {
    super.initState();

    // Tambahkan listener pada setiap TextEditingController
    nameController.addListener(_validateForm);
    nimController.addListener(_validateForm);
    emailController.addListener(_validateForm);
    phoneController.addListener(_validateForm);
    passwordController.addListener(_validateForm);
  }

  void _validateForm() {
    setState(() {
      isFormValid = nameController.text.isNotEmpty &&
                    nimController.text.isNotEmpty &&
                    emailController.text.isNotEmpty &&
                    phoneController.text.isNotEmpty &&
                    passwordController.text.isNotEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0x2FF1EDED), // Membuat AppBar transparan
        elevation: 70, // Menghapus bayangan pada AppBar
        title: const Text('Sign Up', style: TextStyle(color: Color(0xFF751616))), // Mengatur warna teks
      ),
      body: SingleChildScrollView( // Tambahkan SingleChildScrollView
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/background.jpg'), // Menggunakan gambar sebagai latar belakang
              fit: BoxFit.cover, // Menyesuaikan ukuran gambar
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end, // Menempatkan semua elemen di bawah
            children: [
              const SizedBox(height: 20), // Tambahkan jarak di atas
              
              // Field Nama
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0), // Jarak margin
                padding: const EdgeInsets.symmetric(horizontal: 12.0), // Padding dalam kontainer
                decoration: BoxDecoration(
                  color: formBackgroundColor, // Menggunakan warna yang ditetapkan
                  borderRadius: BorderRadius.circular(8.0), // Sudut melengkung
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      offset: Offset(0, 2), // Mengatur posisi bayangan
                      blurRadius: 5, // Mengatur radius blur
                    ),
                  ],
                ),
                child: TextField(
                  controller: nameController,
                  decoration: const InputDecoration(labelText: 'Nama', border: InputBorder.none),
                ),
              ),

              // Field NIM
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0), // Jarak margin
                padding: const EdgeInsets.symmetric(horizontal: 12.0), // Padding dalam kontainer
                decoration: BoxDecoration(
                  color: formBackgroundColor, // Menggunakan warna yang ditetapkan
                  borderRadius: BorderRadius.circular(8.0), // Sudut melengkung
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      offset: Offset(0, 2), // Mengatur posisi bayangan
                      blurRadius: 5, // Mengatur radius blur
                    ),
                  ],
                ),
                child: TextField(
                  controller: nimController,
                  decoration: const InputDecoration(labelText: 'NIM', border: InputBorder.none),
                ),
              ),

              // Field Email
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0), // Jarak margin
                padding: const EdgeInsets.symmetric(horizontal: 12.0), // Padding dalam kontainer
                decoration: BoxDecoration(
                  color: formBackgroundColor, // Menggunakan warna yang ditetapkan
                  borderRadius: BorderRadius.circular(8.0), // Sudut melengkung
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      offset: Offset(0, 2), // Mengatur posisi bayangan
                      blurRadius: 5, // Mengatur radius blur
                    ),
                  ],
                ),
                child: TextField(
                  controller: emailController,
                  decoration: const InputDecoration(labelText: 'Email', border: InputBorder.none),
                ),
              ),

              // Field Nomor Telepon
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0), // Jarak margin
                padding: const EdgeInsets.symmetric(horizontal: 12.0), // Padding dalam kontainer
                decoration: BoxDecoration(
                  color: formBackgroundColor, // Menggunakan warna yang ditetapkan
                  borderRadius: BorderRadius.circular(8.0), // Sudut melengkung
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      offset: Offset(0, 2), // Mengatur posisi bayangan
                      blurRadius: 5, // Mengatur radius blur
                    ),
                  ],
                ),
                child: TextField(
                  controller: phoneController,
                  decoration: const InputDecoration(labelText: 'Nomor Telepon', border: InputBorder.none),
                ),
              ),

              // Field Password
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0), // Jarak margin
                padding: const EdgeInsets.symmetric(horizontal: 12.0), // Padding dalam kontainer
                decoration: BoxDecoration(
                  color: formBackgroundColor, // Menggunakan warna yang ditetapkan
                  borderRadius: BorderRadius.circular(8.0), // Sudut melengkung
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      offset: Offset(0, 2), // Mengatur posisi bayangan
                      blurRadius: 5, // Mengatur radius blur
                    ),
                  ],
                ),
                child: TextField(
                  controller: passwordController,
                  decoration: const InputDecoration(labelText: 'Password', border: InputBorder.none),
                  obscureText: true, // Menyembunyikan teks password
                ),
              ),

              const SizedBox(height: 20),

              // Tombol Sign Up
              ElevatedButton(
                onPressed: isFormValid ? () {
                  widget.onSignUp(
                    nameController.text,
                    nimController.text,
                    emailController.text,
                    phoneController.text,
                    passwordController.text,
                  );
                } : null, // Tombol hanya aktif jika form valid
                child: const Text('Sign Up'),
              ),
              const SizedBox(height: 30), // Tambahkan jarak di bawah tombol
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    // Hapus listener saat widget dihapus
    nameController.dispose();
    nimController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
