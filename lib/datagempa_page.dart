import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'gempacardview_page.dart'; // Impor halaman GempaCardViewPage

void main() {
  runApp(MaterialApp(
    home: InfoGempaListPage(),
  ));
}

class InfoGempaListPage extends StatefulWidget {
  @override
  _InfoGempaListPageState createState() => _InfoGempaListPageState();
}

class _InfoGempaListPageState extends State<InfoGempaListPage> {
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
          'Earthquake List',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.brown,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: ListView.builder(
        itemCount: earthquakes.length,
        itemBuilder: (context, index) {
          final quake = earthquakes[index];
          return Container(
            margin: EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(8.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 3,
                  blurRadius: 7,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: ListTile(
              title: Text('Magnitude: ${quake["Magnitude"]}'),
              subtitle: Text('Tanggal: ${quake["Tanggal"]}, ${quake["Jam"]}'),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Detail Earthquake'),
                      content: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('Tanggal: ${quake["Tanggal"]}, ${quake["Jam"]}'),
                          Text('Magnitude: ${quake["Magnitude"]}'),
                          Text('Wilayah: ${quake["Wilayah"]}'),
                          Text('Kedalaman: ${quake["Kedalaman"]}'),
                          Text('Potensi: ${quake["Potensi"]}'),
                        ],
                      ),
                      actions: <Widget>[
                        TextButton(
                          child: Text('Tutup'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CardViewPage()),
          );
        },
        tooltip: 'CardView',
        child: Icon(Icons.view_module),
        backgroundColor: Colors.brown,
      ),
    );
  }
}
