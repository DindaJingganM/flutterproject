import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.pets),
          title: Text("JG ZOO"),
        ),
        body: ListView(
          children: <Widget>[
            //memberikan widget image. dimana mengambil image dari internet dengan cara image.network('url')
            Image.network(
                'https://st3.depositphotos.com/1526816/13867/v/600/depositphotos_138677432-stock-illustration-scene-with-zoo-animals-and.jpg'),
            //menambahkan container yang berisi teks dan menjelaskan tentang kebun binatang ini
            Container(
              padding: EdgeInsets.only(top: 5, left: 10),
              child: Text(
                "Kebun binatang atau taman margasatwa adalah tempat hewan dipelihara dalam lingkungan buatan, dan dipertunjukkan kepada publik. Selain sebagai tempat rekreasi, kebun binatang berfungsi sebagai tempat pendidikan, riset, dan tempat konservasi untuk satwa terancam punah. JG ZOO adalah Kebun Binatang yang terletak di Kota Blitar, tepatnya Jalan Bali No.162 Kota Blitar",
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 10),
              //menambahkan sebuah text button, dimana ketika mengklik text ini akan berlanjut ke halaman selanjutnya
              child: TextButton(
                style: TextButton.styleFrom(
                  primary: Colors.pink,
                ),
                onPressed: () {
                  Navigator.pushNamed(context,
                      '/homemenu'); // memberikan navigasi untuk dilanjutkan kehomemenu
                },
                child:
                    Text('View Daftar JG Zoo'), //memberi nama pada text button
              ),
            ),
          ],
        ),
      ),
    );
  }
}
