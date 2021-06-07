import 'package:flutter/material.dart';
import 'home/homepage.dart';
import 'home/homebinatang.dart';
import 'home/homemenu.dart';

void main() {
  runApp(
    MaterialApp(
      initialRoute:
          '/', // Mulai aplikasi dengan rute bernama "/". Dalam hal ini, aplikasi dimulai di widget Homepage.
      routes: {
        '/': (context) =>
            Home(), // Saat menavigasi ke rute "/home", buat widget Home.
        '/homemenu': (context) =>
            HomeMenu(), // Saat menavigasi ke rute "/homemenu", buat widget Homepage.
        '/binatang': (context) =>
            HomeBinatang(), //Saat menavigasi ke rute "/item", buat widget BinatangPage.
      },
    ),
  );
}
