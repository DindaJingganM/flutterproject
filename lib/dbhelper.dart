import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'models/binatang.dart';

class DbHelper {
  static DbHelper _dbHelper;
  static Database _database;
  DbHelper._createObject();
  Future<Database> initDb() async {
    //untuk menentukan nama database dan lokasi yg dibuat
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'kebunbinatang.db';

    //create, read databases
    var itemDatabase = openDatabase(path, version: 6, onCreate: _createDb);

    //mengembalikan nilai object sebagai hasil dari fungsinya
    return itemDatabase;
  }

  //buat tabel baru dengan nama binatang
  void _createDb(Database db, int version) async {
    await db.execute('''
 CREATE TABLE binatang ( 
 id INTEGER PRIMARY KEY AUTOINCREMENT,
 nama TEXT,
 jenis TEXT,
 berat INTEGER,
 kondisi TEXT,
 deskripsi TEXT 
 )
 ''');
  }

//select tabel binatang
  Future<List<Map<String, dynamic>>> select() async {
    Database db = await this.initDb();
    var mapList = await db.query('binatang', orderBy: 'nama');

    return mapList;
  }

//create tabel binatang
  Future<int> insert(Binatang object) async {
    Database db = await this.initDb();
    int count = await db.insert('binatang', object.toMap());
    return count;
  }

//update tabel binatang
  Future<int> update(Binatang object) async {
    Database db = await this.initDb();
    int count = await db.update('binatang', object.toMap(),
        where: 'id=?', whereArgs: [object.id]);
    return count;
  }

//delete tabel binatang
  Future<int> delete(int id) async {
    Database db = await this.initDb();
    int count = await db.delete('binatang', where: 'id=?', whereArgs: [id]);
    return count;
  }

  Future<List<Binatang>> getItemList() async {
    var itemMapList = await select();
    int count = itemMapList.length;
    List<Binatang> itemList = List<Binatang>();
    for (int i = 0; i < count; i++) {
      itemList.add(Binatang.fromMap(itemMapList[i]));
    }
    return itemList;
  }

  factory DbHelper() {
    if (_dbHelper == null) {
      _dbHelper = DbHelper._createObject();
    }
    return _dbHelper;
  }
  Future<Database> get database async {
    if (_database == null) {
      _database = await initDb();
    }
    return _database;
  }
}
