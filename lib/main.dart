import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class KelompokMember {
  final String name;
  final String nim;
  final String tgl;

  KelompokMember(this.name, this.nim, this.tgl);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo User Interface',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.grey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Homescreen(),
    );
  }
}

class Homescreen extends StatelessWidget {
  final List<KelompokMember> kelompokMembers = [
    KelompokMember('Bryan Nathaniel', '32210021', '25 Februari 2003'),
    KelompokMember('Nicholas', '32210104', '11 Juni 2003'),
    KelompokMember('Vincent Pangdipta', '32210083', '1 Juli 2003')
    // Tambahkan anggota kelompok lainnya sesuai kebutuhan.
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Kelompok'),
      ),
      body: ListView.builder(
        itemCount: kelompokMembers.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Row(
              children: [
                Text('Anggota ${index + 1} - ${kelompokMembers[index].name}'),
              ],
            ),
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => AnotherScreen(kelompokMembers[index]),
              ),
            ),
          );
        },
      ),
    );
  }
}

class AnotherScreen extends StatelessWidget {
  final KelompokMember kelompokMember;

  AnotherScreen(this.kelompokMember);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Data ${kelompokMember.name}'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('NIM: ${kelompokMember.nim}'),
            Text('Tanggal Lahir: ${kelompokMember.tgl}'),
            // Tambahkan informasi lainnya tentang anggota kelompok jika diperlukan.
          ],
        ),
      ),
    );
  }
}
