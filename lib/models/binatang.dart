class Binatang {
  //menambahkan atribut berupa typenya
  int id; //menambahkan id binatang berupa int
  String nama; //menambahkan nama binatang berupa String
  String jenis; //menambahkan jenis binatang berupa String
  int berat; //menambahkan berat binatang berupa int
  String kondisi; //menambahkan kondisi binatang saat ini
  String deskripsi; //menambahkan deskripsi binatang

  //Getter dan Setter untuk mendapatkan id, karena id akan berupa auto increment dan tidak menambahkan secara manual
  int get getId => this.id;
  //Getter dan Setter untuk menambahkan dan mendapatkan nama
  get getNama => this.nama;
  set setNama(nama) => this.nama = nama;
  //Getter dan Setter untuk menambahkan dan mendapatkan jenis
  String get getJenis => this.jenis;
  set setJenis(String jenis) => this.jenis = jenis;
  //Getter dan Setter untuk menambahkan dan mendapatkan berat
  int get getBerat => this.berat;
  set setBerat(int berat) => this.berat = berat;
  //Getter dan Setter untuk menambahkan dan mendapatkan kondisi
  String get getKondisi => this.kondisi;
  set setKondisi(String kondisi) => this.kondisi = kondisi;
  //Getter dan Setter untuk menambahkan dan mendapatkan deskripsi
  get getDeskripsi => this.deskripsi;
  set setDeskripsi(deskripsi) => this.deskripsi = deskripsi;

  // konstruktor versi 1
  Binatang(this.nama, this.jenis, this.berat, this.kondisi, this.deskripsi);

// konstruktor versi 2: konversi dari Map ke Item
  Binatang.fromMap(Map<String, dynamic> map) {
    this.id = map['id'];
    this.nama = map['nama'];
    this.jenis = map['jenis'];
    this.berat = map['berat'];
    this.kondisi = map['kondisi'];
    this.deskripsi = map['deskripsi'];
  }

  // konversi dari Item ke Map
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = Map<String, dynamic>();
    map['id'] = this.id;
    map['nama'] = nama;
    map['jenis'] = jenis;
    map['berat'] = berat;
    map['kondisi'] = kondisi;
    map['deskripsi'] = deskripsi;
    return map;
  }
}
