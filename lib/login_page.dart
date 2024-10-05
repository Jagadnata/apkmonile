import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  final Function(String, String) onLogin;
  final List<Map<String, String>> registeredUsers; // Menyimpan data pengguna

  const LoginPage({
    super.key,
    required this.onLogin,
    required this.registeredUsers,
  });

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  String? errorMessage; // Menyimpan pesan kesalahan
  bool isFormValid = false;
  bool isPasswordVisible = false; // Menyimpan status visibilitas password
  bool rememberUsername = false; // Menyimpan status checkbox
  Color formBackgroundColor = const Color.fromARGB(109, 241, 236, 236); // Menyimpan warna latar belakang form

  @override
  void initState() {
    super.initState();
    // Tambahkan listener pada setiap TextEditingController
    nameController.addListener(_validateForm);
    passwordController.addListener(_validateForm);
  }

  // Fungsi untuk memvalidasi form dan mengaktifkan tombol login
  void _validateForm() {
    setState(() {
      isFormValid = nameController.text.isNotEmpty && passwordController.text.isNotEmpty;
    });
  }

  void _attemptLogin() {
    // Cek apakah kredensial cocok dengan data pengguna
    final user = widget.registeredUsers.firstWhere(
      (user) => user['name'] == nameController.text && user['password'] == passwordController.text,
      orElse: () => {}, // Jika tidak ada, kembalikan map kosong
    );

    if (user.isEmpty) {
      // Jika tidak ada pengguna yang cocok
      setState(() {
        errorMessage = 'Username atau Password salah';
      });
    } else {
      // Jika berhasil, panggil fungsi onLogin
      widget.onLogin(nameController.text, passwordController.text);
    }
  }

  void _setFormBackgroundColor() {
    setState(() {
      formBackgroundColor = Colors.white; // Mengubah warna latar belakang menjadi putih
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0x2FF1EDED), // Membuat AppBar transparan
        elevation: 70, // Menghapus bayangan pada AppBar
        flexibleSpace: Container(
          color: Colors.transparent, // Menjadikan container di dalam AppBar transparan
        ),
        title: const Text('Login', style: TextStyle(color: Color(0xFF751616))), // Mengatur warna teks
      ),
      body: Container(
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
            // Field Nama
            GestureDetector(
              onTap: _setFormBackgroundColor, // Mengubah warna saat diklik
              child: Container(
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
            ),

            // Field Password dengan fitur lihat/sembunyikan
            GestureDetector(
              onTap: _setFormBackgroundColor, // Mengubah warna saat diklik
              child: Container(
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
                  decoration: InputDecoration(
                    labelText: 'Password',
                    border: InputBorder.none, // Menghilangkan border default
                    suffixIcon: IconButton(
                      icon: Icon(
                        isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          isPasswordVisible = !isPasswordVisible;
                        });
                      },
                    ),
                  ),
                  obscureText: !isPasswordVisible, // Mengatur visibilitas password
                ),
              ),
            ),

            // Checkbox Remember Username
            Row(
              children: [
                Checkbox(
                  value: rememberUsername,
                  onChanged: (value) {
                    setState(() {
                      rememberUsername = value!;
                    });
                  },
                ),
                const Text('Remember Username'),
              ],
            ),
            const SizedBox(height: 20),

            // Menampilkan pesan kesalahan jika ada
            if (errorMessage != null)
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text(
                  errorMessage!,
                  style: const TextStyle(color: Colors.red),
                ),
              ),

            // Tombol Login
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: isFormValid ? _attemptLogin : null, // Hanya bisa di klik jika form valid
                child: const Text('Login'),
              ),
            ),

            // Tautan ke halaman Sign Up
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: GestureDetector(
                onTap: () {
                  // Navigasi ke halaman sign up
                  Navigator.pushNamed(context, '/signup');
                },
                child: const Text(
                  'Belum punya akun? Daftar di sini',
                  style: TextStyle(
                    color: Color.fromARGB(255, 216, 219, 221),
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20), // Menambahkan jarak di bawah
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    // Hapus listener ketika widget dihapus
    nameController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
