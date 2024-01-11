import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:fl_chart/fl_chart.dart';

class CryptoPriceScreen extends StatefulWidget {
  @override
  _CryptoPriceScreenState createState() => _CryptoPriceScreenState();
}

class _CryptoPriceScreenState extends State<CryptoPriceScreen> {
  String price = 'Loading...';

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final response = await http.get(Uri.parse(
        'https://min-api.cryptocompare.com/data/price?fsym=BTC&tsyms=USD'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      setState(() {
        price = '\$${data['USD'].toString()}'; // Tambahkan kembali simbol $
      });
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Crypto'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 200.0,
              width: MediaQuery.of(context).size.width * 0.8,
              child: LineChart(
                LineChartData(
                  lineBarsData: [
                    LineChartBarData(
                      spots: [
                        FlSpot(0, 2),
                        FlSpot(1, 2.5),
                        FlSpot(2, 3),
                        FlSpot(3, 2.7),
                        // ... Sesuaikan dengan data dari API
                      ],
                      isCurved: true,
                      colors: [Colors.blue],
                      barWidth: 4,
                      isStrokeCapRound: true,
                      belowBarData: BarAreaData(show: false),
                    ),
                  ],
                  minY: 0,
                  titlesData: FlTitlesData(
                    bottomTitles: SideTitles(showTitles: false),
                    leftTitles: SideTitles(showTitles: true),
                  ),
                  borderData: FlBorderData(show: true),
                ),
              ),
            ),
            SizedBox(height: 20.0),
            // Harga dari streaming data dengan simbol $
            Text(
              'Harga: $price',
              style: TextStyle(fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }
}
