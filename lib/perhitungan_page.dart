import 'package:flutter/material.dart';
import 'package:mobileapps_coba/bmi_page.dart';
import 'package:mobileapps_coba/konversi_page.dart';
import 'package:mobileapps_coba/saved_page.dart';
import 'package:mobileapps_coba/transaksi_page.dart';

void main() => runApp(MaterialApp(
      home: PerhitunganPage(),
    ));

class PerhitunganPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Perhitungan'),
        backgroundColor: Colors.brown,
      ),
      body: ListView(
        children: [
          NavigatorButton(
            imagePath: "assets/calculator.png",
            title: "Kalkulator",
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SavedPage()),
              );
            },
          ),
          NavigatorButton(
            imagePath: "assets/changemoney.png",
            title: "Konversi Mata Uang",
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => KonversiPage()),
              );
            },
          ),
          NavigatorButton(
            imagePath: "assets/bmi.png",
            title: "BMI",
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => BmiPage()),
              );
            },
          ),
          NavigatorButton(
            imagePath: "assets/transaction.png",
            title: "Transaksi",
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TransaksiPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}

class NavigatorButton extends StatelessWidget {
  final String imagePath;
  final String title;
  final VoidCallback onTap;

  NavigatorButton({
    required this.imagePath,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            width: 50,
            height: 60,
            child: Column(
              children: [
                Image.asset(
                  imagePath,
                  width: 30,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  title,
                  style: TextStyle(fontSize: 10),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
