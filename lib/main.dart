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

  final List Kategori = [
    "Candi Non Keagamaan",
    "Candi Keagamaan",
    "Candi Kerajaan ",
    "Candi Pribadi",
    "Candi Wanua",
    "Candi Daerah",
  ];
  final List Gambar = [
        "assets/images/CandiAbang.jpg",
        "assets/images/CandiAngin.jpg",
        "assets/images/borobudur.jpg",
        "assets/images/CandiBajangRatu.jpg",
        "assets/images/CandiCungkup.jpg",
        "assets/images/CandiGunungKawi.jpg",
  ];

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
        body: Center(
          child: ListView.builder(
              itemCount: Gambar.length,
                      itemBuilder: (BuildContext context, int index) {
                        return new Card(
                          elevation: 2.0,
                          shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(16.0),
                          ),
                          child: new InkWell(
                            child: new Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                new ClipRRect(
                                  child: new Image.asset(
                                    Gambar[index]
                                  ),
                                  borderRadius: BorderRadius.only(
                                    topLeft: new Radius.circular(16.0),
                                    topRight: new Radius.circular(16.0),
                                  ),
                                ),
                                new Padding(
                                  padding: new EdgeInsets.all(16.0),
                                  child: new Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      new Text(Kategori[index],
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),),
                                      new SizedBox(height: 16.0),

                                    ],
                                  ),
                                ),
                              ],
                            ),
                            // onTap: () {
                            //   Navigator.of(context).push(MaterialPageRoute(builder: (context) => new DetailPage(data: this.data)));
                            // },
                          ),
                        );
                      }
                  )
    )
    )
    );
              }
  }


