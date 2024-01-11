import 'package:flutter/material.dart';
import 'package:mobileapps_coba/home_page.dart';
import 'package:mobileapps_coba/register_page.dart';
import 'package:mobileapps_coba/login_page.dart'; // Import the correct file

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/login',
      routes: {
        '/login': (context) =>
            LoginPage(), // Assuming LoginPage is defined in firebasecrud_page.dart
        '/home': (context) => HomePage(),
        '/register': (context) => RegisterPage(),
      },
    );
  }
}
