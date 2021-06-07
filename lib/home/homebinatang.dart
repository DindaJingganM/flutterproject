import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:uts_mi2c_dindajinggan/models/binatang.dart';
import 'dart:async';
import '../dbhelper.dart';
import '../entryform/entryformbinatang.dart';

//pendukung program asinkron
class HomeBinatang extends StatefulWidget {
  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<HomeBinatang> {
  //memberikan sebuah inisialisasi
  DbHelper dbHelper =
      DbHelper(); // dimana DBHelper diberi nama dbHelper dan diambil dari class DBHelper
  int count = 0; //count dimulai dari 0
  List<Binatang>
      binatangList; //memberikan nama List untuk binatang yaitu binatanglist
  @override
  Widget build(BuildContext context) {
    //kondisi jika data list binatang kosong, maka data binatang akan dimasukkan ke dalam list
    if (binatangList == null) {
      binatangList = List<Binatang>();
    }
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
                  context); // Di dalam widget Menavigasi kembali ke layar pertama dengan memunculkan rute saat ini dari tumpukan.
            },
            child: Icon(Icons.arrow_back),
          ),
          title: Text("Binatang JG ZOO"),
        ),
        body: Column(children: <Widget>[
          Expanded(
            child: createListView(), //mengambil method createlistview
          ),
          Container(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              width: double.infinity,
              child: RaisedButton(
                //membuat tombol tambah data binatang
                child: Text("Tambah Binatang"),
                onPressed: () async {
                  var binatang = await navigateToEntryForm(context, null);
                  if (binatang != null) {
                    //TODO 2 Panggil Fungsi untuk Insert ke DB
                    int result = await dbHelper.insert(binatang);
                    if (result > 0) {
                      updateListView(); //mengambil method updatelistview
                    }
                  }
                },
              ),
            ),
          ),
        ]),
      ),
    );
  }

  Future<Binatang> navigateToEntryForm(
      BuildContext context, Binatang binatang) async {
    var result = await Navigator.push(context,
        MaterialPageRoute(builder: (BuildContext context) {
      return EntryForm(binatang);
    }));
    return result;
  }

//membuat listview dari data
  ListView createListView() {
    TextStyle textStyle = Theme.of(context)
        .textTheme
        .headline5; //memberikan style text yaitu headline5
    return ListView.builder(
      itemCount: count,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          color: Colors.white,
          elevation: 2.0,
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.red,
              child: Icon(Icons.pets),
            ),
            title: Text(
              this.binatangList[index].nama,
              style: textStyle,
            ),
            subtitle: Text(this.binatangList[index].berat.toString() + ' kg'),
            trailing: GestureDetector(
              child: Icon(Icons.delete),
              onTap: () async {
                //TODO 3 Panggil Fungsi untuk Delete dari DB berdasarkan Item
                deleteItem(binatangList[index]);
              },
            ),
            onTap: () async {
              var binatang =
                  await navigateToEntryForm(context, this.binatangList[index]);
              if (binatang != null)
                editItem(
                    binatang); //kondisi ketika binatang memiliki data, maka kita dapat mengeditnya
              //TODO 4 Panggil Fungsi untuk Edit data
            },
          ),
        );
      },
    );
  }

  //update List item
  void updateListView() {
    final Future<Database> dbFuture = dbHelper.initDb();
    dbFuture.then((database) {
      //TODO 1 Select data dari DB
      Future<List<Binatang>> itemListFuture = dbHelper.getItemList();
      itemListFuture.then((itemList) {
        setState(() {
          //memberikan state
          this.binatangList = itemList;
          this.count = itemList.length;
        });
      });
    });
  }

  //delete item
  void deleteItem(Binatang object) async {
    int result = await dbHelper.delete(object.id);
    if (result > 0) {
      updateListView();
    }
  }

  //edit item
  void editItem(Binatang object) async {
    int result = await dbHelper.update(object);
    if (result > 0) {
      updateListView();
    }
  }
}
