
import 'dart:io';


import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class veriTabaniYardimci {


  static final String veriTabaniAdi = "rehber.sqlite";

   Future<Database> veriTabaniErisim() async {
    String veriTabaniYolu = join(await getDatabasesPath(),veriTabaniAdi);

    if(await databaseExists(veriTabaniYolu)){
      print("Veri tabanı var, kopyalamaya gerek yok");
    }else{
      ByteData data = await rootBundle.load("veritabani/$veriTabaniAdi");
      List<int> bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
      await File(veriTabaniYolu).writeAsBytes(bytes,flush: true);
      print("Veritabani kopyalandı");
    }
   return openDatabase(veriTabaniYolu);
  }

}




