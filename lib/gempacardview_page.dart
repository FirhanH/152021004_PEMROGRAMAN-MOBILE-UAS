import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MaterialApp(
    home: CardViewPage(),
  ));
}

class CardViewPage extends StatefulWidget {
  @override
  _CardGalleryPageState createState() => _CardGalleryPageState();
}

class _CardGalleryPageState extends State<CardViewPage> {
  List<Map<String, dynamic>> earthquakes = [];

  @override
  void initState() {
    super.initState();
    fetchEarthquakeData();
  }

  Future<void> fetchEarthquakeData() async {
    final response = await http.get(
      Uri.parse('https://data.bmkg.go.id/DataMKG/TEWS/gempaterkini.json'),
    );

    if (response.statusCode == 200) {
      final List<dynamic> data =
          json.decode(response.body)['Infogempa']['gempa'];
      setState(() {
        earthquakes = List<Map<String, dynamic>>.from(data);
      });
    } else {
      throw Exception('Failed to load earthquake data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'CardView Info Gempa',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.brown,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Jumlah kolom dalam grid
          crossAxisSpacing: 8.0, // Spasi antar kolom
          mainAxisSpacing: 8.0, // Spasi antar baris
        ),
        itemCount: earthquakes.length,
        itemBuilder: (context, index) {
          final quake = earthquakes[index];
          return Card(
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            color: Colors.white,
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Magnitude: ${quake["Magnitude"]}',
                    style: TextStyle(color: Colors.black87),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Tanggal: ${quake["Tanggal"]}, ${quake["Jam"]}',
                    style: TextStyle(color: Colors.black54),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Wilayah: ${quake["Wilayah"]}',
                    style: TextStyle(color: Colors.black54),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Kedalaman: ${quake["Kedalaman"]}',
                    style: TextStyle(color: Colors.black54),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Potensi: ${quake["Potensi"]}',
                    style: TextStyle(color: Colors.black54),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
