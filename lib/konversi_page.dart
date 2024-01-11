import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: KonversiPage(),
    ));

class KonversiPage extends StatefulWidget {
  @override
  _KonversiPageState createState() => _KonversiPageState();
}

class _KonversiPageState extends State<KonversiPage> {
  TextEditingController _rupiahController = TextEditingController();
  double _selectedCurrency = 15000; // Default kurs 1 USD = 15,000 Rupiah

  void _convertRupiahToUSD() {
    double rupiah = double.tryParse(_rupiahController.text) ?? 0;
    double usd = rupiah / _selectedCurrency;
    _usdController.text = usd.toStringAsFixed(2);
  }

  void _convertUSDToRupiah() {
    double usd = double.tryParse(_usdController.text) ?? 0;
    double rupiah = usd * _selectedCurrency;
    _rupiahController.text = rupiah.toStringAsFixed(2);
  }

  TextEditingController _usdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Konversi Mata Uang'),
        backgroundColor: Colors.brown,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextField(
              controller: _rupiahController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Rupiah (IDR)'),
            ),
            SizedBox(height: 10),
            DropdownButton<double>(
              value: _selectedCurrency,
              onChanged: (newValue) {
                setState(() {
                  _selectedCurrency = newValue!;
                });
              },
              items: <DropdownMenuItem<double>>[
                DropdownMenuItem(
                  child: Text('1 USD = 15,000 IDR'),
                  value: 15000,
                ),
                DropdownMenuItem(
                  child: Text('1 USD = 14,000 IDR'),
                  value: 14000,
                ),
                // Tambahkan item lain sesuai kebutuhan
              ],
            ),
            ElevatedButton(
              onPressed: _convertRupiahToUSD,
              child: Text('Convert to USD'),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _usdController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'US Dollar (USD)'),
            ),
            SizedBox(height: 10),
            DropdownButton<double>(
              value: _selectedCurrency,
              onChanged: (newValue) {
                setState(() {
                  _selectedCurrency = newValue!;
                });
              },
              items: <DropdownMenuItem<double>>[
                DropdownMenuItem(
                  child: Text('1 USD = 15,000 IDR'),
                  value: 15000,
                ),
                DropdownMenuItem(
                  child: Text('1 USD = 14,000 IDR'),
                  value: 14000,
                ),
                // Tambahkan item lain sesuai kebutuhan
              ],
            ),
            ElevatedButton(
              onPressed: _convertUSDToRupiah,
              child: Text('Convert to Rupiah'),
            ),
          ],
        ),
      ),
    );
  }
}
