import 'package:flutter/material.dart';
import 'editprofile_page.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/profile.jpg'),
            ),
            SizedBox(height: 20),
            Text(
              'Firhan',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.brown,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Email: hanhanhan@gmail.com',
              style: TextStyle(
                fontSize: 16,
                color: Colors.brown,
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EditProfilePage()),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.brown, // Mengatur warna latar belakang tombol
              ),
              child: Text('Edit Profil'),
            ),
          ],
        ),
      ),
    );
  }
}
