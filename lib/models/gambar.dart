import 'package:flutter/foundation.dart';


class Data {
  //DEFINISIKAN SELURUH VARIABLE YANG DIINGINGKAN
  final String id;
  final String image;

  //KEMUDIAN BUAT CONSTRUCTOR UNTUK MEMINTA DATA TERSEBUT
  //KITA MENGGUNAKAN REQUIRED MAKA DIPERLUKAN UNTUK MENGIMPORT foundation.dart
  const Data({
    @required this.image,
    @required this.id
  });
}