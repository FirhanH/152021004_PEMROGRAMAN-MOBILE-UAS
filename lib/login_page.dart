import 'package:flutter/material.dart';
import 'home_page.dart';
import 'register_page.dart'; // Import halaman registrasi

void main() => runApp(MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false, // Menyembunyikan debug banner
    ));

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  void _handleLogin() {
    String username = _usernameController.text;
    String password = _passwordController.text;

    // Implement your authentication logic here
    // For example, you can compare username and password with hardcoded values
    if (username == 'admin' && password == 'admin') {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    } else {
      // Show error message for incorrect login
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Login Failed'),
            content: Text('Invalid credentials. Please try again.'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page'),
        backgroundColor:
            Colors.brown, // Ubah warna bagian atas halaman (app bar)
      ),
      body: Container(
        color: Colors.white, // Ubah warna latar belakang sesuai keinginan Anda
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'assets/login_1.png', // Ganti dengan path gambar Anda
                width: 100, // Sesuaikan lebar gambar sesuai kebutuhan
                height: 100, // Sesuaikan tinggi gambar sesuai kebutuhan
                fit: BoxFit.cover,
              ),
              SizedBox(height: 20),
              Card(
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: TextField(
                    controller: _usernameController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      labelText: 'Username',
                      contentPadding: EdgeInsets.symmetric(vertical: 15),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Card(
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: TextField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      labelText: 'Password',
                      contentPadding: EdgeInsets.symmetric(vertical: 15),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _handleLogin,
                child: Text('Login'),
              ),
              SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            RegisterPage()), // Navigasi ke halaman registrasi
                  );
                },
                child: Text(
                  'Belum punya akun? Registrasi di sini.', // Teks untuk navigasi ke halaman registrasi
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
