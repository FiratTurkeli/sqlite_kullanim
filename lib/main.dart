import 'package:flutter/material.dart';
import 'package:sqlite_kullanimi/kisilerdao.dart';

import 'Kisiler.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);



  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  Future<void> kisileriGoster() async {
    var liste = await Kisilerdao().tumKisiler();

    for(Kisiler k in liste){
      print("********");
      print("Kisi adi : ${k.kisi_ad}");
      print("Kisi yaşı: ${k.kisi_yas} ");
    }
  }

  Future<void> ekle() async {
  await Kisilerdao().kisiEkle("Ece" , 25);
  }

  Future<void> sil() async {
    await Kisilerdao().kisiSil(3);
  }

  Future<void> guncelle() async {
    await Kisilerdao().kisileriGuncelle(2, "Sade", 23);
  }

  Future<void> kayitKontrol() async {
   int sonuc =  await Kisilerdao().kayitKontrol("Ahmet");
    print("Veritabanında Ahmet sayısı: $sonuc");
  }

  @override
  void initState() {

    super.initState();
   // ekle();
    //sil()
     kisileriGoster();
     // kayitKontrol();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[


          ],
        ),
      ),

    );
  }
}
