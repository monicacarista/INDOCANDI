import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_tes/CandiDaerah.dart';
import 'package:flutter_tes/CandiNonKeagamaan.dart';
import 'package:flutter_tes/CandiWanua.dart';
import 'package:flutter_tes/Tab/SideBar.dart';
import 'package:flutter_tes/splashscreen_view.dart';
import 'package:http/http.dart'as http;
import 'dart:convert';
import 'package:flutter_tes/list_item.dart';

import 'package:flutter_tes/CandiKeagamaan.dart';
import 'package:flutter_tes/CandiKerajaan.dart';
import 'package:flutter_tes/CandiPribadi.dart';
import 'package:flutter_tes/Info.dart';
import 'package:flutter_tes/About.dart';
import 'package:flutter_tes/halamanutama.dart';
import 'package:flutter_tes/model.dart';

void main() => runApp(MaterialApp(
  initialRoute: '/',
  routes: {
    '/': (ctx) => SplashScreenPage(),
    'CandiKeagamaan': (context) => CandiKeagamaan(),
    'CandiNonKeagamaan': (context) => CandiNonKeagamaan(),
    'CandiWanua': (context) => CandiWanua(),
    'CandiDaerah': (context) => CandiDaerah(),
    'CandiKerajaan' : (context) => CandiKerajaan(),
    'CandiPribadi' : (context) => CandiPribadi(),
    'About' : (context) => About(),
    'Info' : (context) => Info(),
    //'HalamanUtama' : (context) => HalamanUtama(),
    'UserViewModel' : (context) => UserViewModel(),
  },
  debugShowCheckedModeBanner: false,

));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();

}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin{
  //controller utk tab bar
  TabController controller;
  int index=0;
  List<Widget> list = [
    CandiKeagamaan(),
    CandiNonKeagamaan(),
    CandiKerajaan(),
    CandiPribadi(),
    CandiWanua(),
    CandiDaerah(),
   //HalamanUtama(),
     UserViewModel(),
  ];
  @override
  void initState(){
    controller = new TabController(vsync: this, length: 4);
    super.initState();

  }

  @override
  void dispose(){
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: Scaffold(
      appBar: AppBar(
        title: Text("Welcome",
          style: new TextStyle(
              fontSize: 24.0, fontWeight: FontWeight.bold
          ),),
        backgroundColor: Colors.black26,
        centerTitle: true,


      ),
     drawer: SideBar(),
          body:Container(
              child: new Center(
                  child: new Column(
                      children: <Widget>[

                        new Image.asset(
                          "assets/images/logo.png",
                          width: 200.0,
                          height: 200.0,
                        ),
                        new RichText(
                          text: TextSpan(
                              style: TextStyle(color: Colors.black, fontSize: 18),
                              children: <TextSpan>[
                                //TextSpan(text: " Color", style: TextStyle(color: Colors.blue)),
                                TextSpan(text: " Proyek bernama alun-alun merupakan proyek penelitianyang didanai oleh Dana Pribadi (2019), RISTEKDIKTI tahun 2018 dan LPPM UKDW tahun 2019. Penelitian ini fokus pada pengembangan model untuk beberapa objek budaya Indonesia, antara lain: Batik, Rumah, Candi, Makanan Tradisional, Upacara, Pakaian, dan Sastra. ", style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500, letterSpacing: 1.0,height: 1.7 ))
                              ]
                          ),
                          textWidthBasis: TextWidthBasis.longestLine,
                        ),
                      ]

                  )


              )


          )
      )
    );
  }


  }


