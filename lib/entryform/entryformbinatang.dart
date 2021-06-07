import 'package:flutter/material.dart';
import '../models/binatang.dart';

class EntryForm extends StatefulWidget {
  final Binatang binatang;
  EntryForm(this.binatang);
  @override
  EntryFormState createState() => EntryFormState(this.binatang);
}

//class controller
class EntryFormState extends State<EntryForm> {
  Binatang
      binatang; //memberitahu bahwa form ini mengambil atribut dari class Binatang
  EntryFormState(this.binatang); //memasukkan data form untuk class Binatang
  //memberikan controller agar dapat mengatur ketika mengambil data dari user
  TextEditingController namaController =
      TextEditingController(); //controller untuk mengatur data nama dari user
  TextEditingController jenisController =
      TextEditingController(); //controller untuk mengatur data jenis dari user
  TextEditingController beratController =
      TextEditingController(); //controller untuk mengatur data berat dari user
  TextEditingController kondisiController =
      TextEditingController(); //controller untuk mengatur data kondisi dari user
  TextEditingController deskripsiController =
      TextEditingController(); //controller untuk mengatur data deskripsi dari user
  @override
  Widget build(BuildContext context) {
    //kondisi jika data binatang kosong maka akan ditambahkan data
    if (binatang != null) {
      namaController.text = binatang
          .nama; //memasukkan data nama dari controller dan memberikan data ke sistem
      jenisController.text = binatang
          .jenis; //memasukkan data jenis dari controller dan memberikan data ke sistem
      beratController.text = binatang.berat
          .toString(); //memasukkan data berat dari controller dan memberikan data ke sistem
      kondisiController.text = binatang
          .kondisi; //memasukkan data kondisi dari controller dan memberikan data ke sistem
      deskripsiController.text = binatang
          .deskripsi; //memasukkan data deskripsi dari controller dan memberikan data ke sistem
    }
    //rubah
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: binatang == null
              ? Text('Tambah')
              : Text(
                  'Ubah'), //jika data kosong maka akan ditambahkan, tetapi jika tidak kosong kita akan masuk untuk mengubah data saja
          leading: new InkWell(
            onTap: () {
              Navigator.pop(
                  context); // Di dalam widget page Menavigasi kembali ke layar pertama dengan memunculkan rute saat ini dari tumpukan.
            },
            child: Icon(Icons.arrow_back),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
          child: ListView(
            children: <Widget>[
              // nama Binatang
              Padding(
                padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                child: TextField(
                  controller:
                      namaController, //memberikan controller nama agar data nanti bisa disimpan
                  keyboardType: TextInputType
                      .text, // mengganti type keyboard menjadi text, agar ketika di tekan formnya akan otomatis muncul keyboard teks
                  decoration: InputDecoration(
                    //memberikan decoration
                    hintText: "Masukkan Nama Binatang", //memebrikan hint text
                    labelText:
                        'Nama Binatang', //memberikan nama label text form
                    border: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(5.0), //memberikan sebuah border
                    ),
                  ),
                  onChanged: (value) {
                    //
                  },
                ),
              ),
              //Jenis Binatang
              Padding(
                padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                child: TextField(
                  controller:
                      jenisController, //memberikan controller jenis agar data nanti bisa disimpan
                  keyboardType: TextInputType
                      .text, // mengganti type keyboard menjadi text, agar ketika di tekan formnya akan otomatis muncul keyboard teks
                  decoration: InputDecoration(
                    //memberikan decoration
                    hintText: "Masukkan Jenis Binatang", //memebrikan hint text
                    labelText:
                        'Jenis Binatang', //memberikan nama label text form
                    border: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(5.0), //memberikan sebuah border
                    ),
                  ),
                  onChanged: (value) {
                    //
                  },
                ),
              ),
              // berat binatang
              Padding(
                padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                child: TextField(
                  controller:
                      beratController, //memberikan controller berat agar data nanti bisa disimpan
                  keyboardType: TextInputType
                      .number, // mengganti type keyboard menjadi number, agar ketika di tekan formnya akan otomatis muncul keyboard number
                  decoration: InputDecoration(
                    hintText: "Masukkan Berat Binatang", //memberikan hint text
                    labelText:
                        'Berat Binatang', //memberikan nama label text form
                    border: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(5.0), //memberikan sebuah border
                    ),
                  ),
                  onChanged: (value) {
                    //
                  },
                ),
              ),
              // kondisi binatang
              Padding(
                padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                child: TextField(
                  controller:
                      kondisiController, //memberikan controller kondisi agar data nanti bisa disimpan
                  keyboardType: TextInputType
                      .text, // mengganti type keyboard menjadi teks, agar ketika di tekan formnya akan otomatis muncul keyboard teks
                  decoration: InputDecoration(
                    hintText:
                        "Masukkan Kondisi Binatang Saat Ini", //memberikan hint text
                    labelText:
                        'Kondisi Binatang', //memberikan nama label text form
                    border: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(5.0), //memberikan sebuah border
                    ),
                  ),
                  onChanged: (value) {
                    //
                  },
                ),
              ),
              // deskripsi binatang
              Padding(
                padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                child: TextField(
                  controller:
                      deskripsiController, //memberikan controller deskripsi agar data nanti bisa disimpan
                  keyboardType: TextInputType
                      .text, // mengganti type keyboard menjadi teks, agar ketika di tekan formnya akan otomatis muncul keyboard teks
                  decoration: InputDecoration(
                    hintText:
                        "Masukkan Deskripsi Binatang Saat Ini", //memberikan hint text
                    labelText:
                        'Deskripsi Binatang', //memberikan nama label text form
                    border: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(5.0), //memberikan sebuah border
                    ),
                  ),
                  onChanged: (value) {
                    //
                  },
                ),
              ),
              // tombol button
              Padding(
                padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                child: Row(
                  children: <Widget>[
                    // tombol simpan
                    Expanded(
                      child: RaisedButton(
                        //memberikan tombol button untuk menyimpan data yang sudah diisi
                        color: Theme.of(context).primaryColorDark,
                        textColor: Theme.of(context).primaryColorLight,
                        child: Text(
                          'Save',
                          textScaleFactor: 1.5, //memberikan ukuran text
                        ),
                        onPressed: () {
                          //kondisi ketika data binatang kosong maka akan ditambahkan
                          if (binatang == null) {
                            // tambah data
                            binatang = Binatang(
                              namaController
                                  .text, //menambahkan data nama sesuai data yang disimpan pada controller nama berupa text
                              jenisController
                                  .text, //menambahkan data jenis sesuai data yang disimpan pada controller jenis berupa text
                              int.parse(beratController
                                  .text), //menambahkan data berat sesuai data yang disimpan pada controller berat berupa text, maka dari itu int akan diubah menjadi string dengan code int.parse
                              kondisiController
                                  .text, //menambahkan data kondisi  sesuai data yang disimpan pada controller kondisi berupa text
                              deskripsiController
                                  .text, //menambahkan data deskripsi sesuai data yang disimpan pada controller deskripsi berupa text
                            );
                          }
                          //jika data sudah ada, maka akan diubah datanya
                          else {
                            // ubah data
                            binatang.nama = namaController
                                .text; //mengubah nama yang sudah tersimpan pada binatang.nama dengan menggunakan namacontroller dan akan disimpan
                            binatang.jenis = jenisController
                                .text; //mengubah jenis yang sudah tersimpan pada binatang.jenis dengan menggunakan jeniscontroller dan akan disimpan
                            binatang.berat = int.parse(beratController
                                .text); //mengubah nama yang sudah tersimpan pada binatang.berat dengan menggunakan beratcontroller dan akan disimpan
                            binatang.kondisi = kondisiController
                                .text; //mengubah nama yang sudah tersimpan pada binatang.kondisi dengan menggunakan kondisicontroller dan akan disimpan
                            binatang.deskripsi = deskripsiController
                                .text; //mengubah nama yang sudah tersimpan pada binatang.deskripsi dengan menggunakan deskripsicontroller dan akan disimpan
                          }
                          // kembali ke layar sebelumnya dengan membawa objek item
                          Navigator.pop(context, binatang);
                        },
                      ),
                    ),
                    Container(
                      width: 5.0,
                    ),
                    // tombol batal
                    Expanded(
                      child: RaisedButton(
                        //memberikan tombol batal
                        color: Theme.of(context).primaryColorDark,
                        textColor: Theme.of(context).primaryColorLight,
                        child: Text(
                          'Cancel',
                          textScaleFactor: 1.5, //memberikan ukuran teks
                        ),
                        onPressed: () {
                          Navigator.pop(
                              context); // kembali ke layar sebelumnya yang ada pada tumpukan
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
