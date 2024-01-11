import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      title: 'Aplikasi Transaksi',
      home: TransaksiPage(),
    ));

class TransaksiPage extends StatefulWidget {
  @override
  _TransaksiPageState createState() => _TransaksiPageState();
}

class _TransaksiPageState extends State<TransaksiPage> {
  List<Transaksi> transaksiList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Aplikasi Transaksi'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: transaksiList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(transaksiList[index].deskripsi),
                  subtitle: Text('Rp ${transaksiList[index].jumlah}'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () {
                          _tampilkanDialogEditTransaksi(context, index);
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          _hapusTransaksi(index);
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                _tampilkanDialogTambahTransaksi(context);
              },
              child: Text('Tambah Transaksi'),
            ),
          ),
        ],
      ),
    );
  }

  void _tampilkanDialogTambahTransaksi(BuildContext context) {
    String deskripsi = '';
    String jumlah = '';

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Tambah Transaksi'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                onChanged: (value) {
                  deskripsi = value;
                },
                decoration: InputDecoration(labelText: 'Deskripsi'),
              ),
              TextField(
                onChanged: (value) {
                  jumlah = value;
                },
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Jumlah (Rp)'),
              ),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Batal'),
            ),
            ElevatedButton(
              onPressed: () {
                if (deskripsi.isNotEmpty && jumlah.isNotEmpty) {
                  transaksiList.add(Transaksi(deskripsi, int.parse(jumlah)));
                  setState(() {});
                  Navigator.of(context).pop();
                }
              },
              child: Text('Simpan'),
            ),
          ],
        );
      },
    );
  }

  void _tampilkanDialogEditTransaksi(BuildContext context, int index) {
    String deskripsi = transaksiList[index].deskripsi;
    String jumlah = transaksiList[index].jumlah.toString();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Edit Transaksi'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: TextEditingController(text: deskripsi),
                onChanged: (value) {
                  deskripsi = value;
                },
                decoration: InputDecoration(labelText: 'Deskripsi'),
              ),
              TextField(
                controller: TextEditingController(text: jumlah),
                onChanged: (value) {
                  jumlah = value;
                },
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Jumlah (Rp)'),
              ),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Batal'),
            ),
            ElevatedButton(
              onPressed: () {
                if (deskripsi.isNotEmpty && jumlah.isNotEmpty) {
                  transaksiList[index] =
                      Transaksi(deskripsi, int.parse(jumlah));
                  setState(() {});
                  Navigator.of(context).pop();
                }
              },
              child: Text('Simpan'),
            ),
          ],
        );
      },
    );
  }

  void _hapusTransaksi(int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Hapus Transaksi'),
          content: Text('Apakah Anda yakin ingin menghapus transaksi ini?'),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Batal'),
            ),
            ElevatedButton(
              onPressed: () {
                transaksiList.removeAt(index);
                setState(() {});
                Navigator.of(context).pop();
              },
              child: Text('Hapus'),
            ),
          ],
        );
      },
    );
  }
}

class Transaksi {
  String deskripsi;
  int jumlah;

  Transaksi(this.deskripsi, this.jumlah);
}
