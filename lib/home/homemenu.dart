import 'package:flutter/material.dart';

class HomeMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: Scaffold(
        appBar: AppBar(
          leading: InkWell(
            onTap: () {
              Navigator.pop(
                  context); // Di dalam widget page Menavigasi kembali ke layar pertama dengan memunculkan rute saat ini dari tumpukan.
            },
            child: Icon(Icons.arrow_back),
          ),
          title: Text("JG ZOO"),
        ),
        body: ListView(
          children: <Widget>[
            //memberikan widget image. dimana mengambil image dari internet dengan cara image.network('url')
            Image.network(
                'https://st3.depositphotos.com/1526816/13867/v/600/depositphotos_138677432-stock-illustration-scene-with-zoo-animals-and.jpg'),
            Container(
              //memberikan sebuah container dan berisi teks sebagai judul
              padding: EdgeInsets.only(top: 20, left: 90),
              child: Text(
                "Pilih Daftar Di bawah :",
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
            Container(
              //memberikan sebuah container
              padding: EdgeInsets.only(top: 100, left: 10),
              child: Row(
                //membuat sebuah Row
                mainAxisAlignment: MainAxisAlignment
                    .spaceAround, //mengatur tata letak pada row
                children: <Widget>[
                  Container(
                    width: 150,
                    //memberikan widget image. dimana mengambil image dari internet dengan cara image.network('url')
                    child: Image.network(
                        'https://assets.pikiran-rakyat.com/crop/0x0:0x0/x/photo/2021/03/24/1867474683.jpg'),
                  ),
                ],
              ),
            ),
            //menambahkan Row
            Row(
              mainAxisAlignment:
                  MainAxisAlignment.spaceAround, //mengatur tata letak row
              children: [
                Container(
                  padding: EdgeInsets.only(top: 10),
                  //menambahkan sebuah text button, dimana ketika mengklik text ini akan berlanjut ke halaman selanjutnya
                  child: TextButton(
                    style: TextButton.styleFrom(
                      primary: Colors.pink,
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context,
                          '/binatang'); // memberikan navigasi untuk dilanjutkan kehomebinatang
                    },
                    child:
                        Text('Daftar Binatang'), //memberi nama pada text button
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
