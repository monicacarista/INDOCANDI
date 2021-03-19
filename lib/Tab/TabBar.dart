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
void main() => runApp(MaterialApp(
  initialRoute: '/',
  routes: {
    '/': (ctx) => SplashScreenPage(),
    'CandiKeagamaan': (context) => CandiKeagamaan(),
    'CandiNonKeagamaan': (context) => CandiNonKeagamaan(),
    'CandiWanua': (context) => CandiWanua(),
    'CandiDaerah': (context) => CandiDaerah(),
    'CandiKerajaan': (context) => CandiKerajaan(),
    'CandiPribadi': (context) => CandiDaerah(),



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
            title: Text("INDOCANDI",
              style: new TextStyle(
                  fontSize: 24.0, fontWeight: FontWeight.bold
              ),),
            backgroundColor: Colors.blue,
            centerTitle: true,

            bottom: new TabBar(
                isScrollable: true,
                // indicatorWeight: 10.0,
                //indicatorColor: Colors.black,
                // controller: controller,
                tabs:<Widget>[
                  new Tab(text: "Candi Keagamaan"),
                  new Tab(text: "Candi Non Keagamaan",),
                  new Tab(text: "Candi Wanua",),
                  new Tab(text: "Candi Daerah",),
                  new Tab(text: "Candi Kerajaan",),
                  new Tab(text: "Candi Pribadi",),
                ]
            ),

          ),
          drawer: SideBar(),
          // body: _buildBody(context),
          body: TabBarView(children: [
            CandiKeagamaan(),
            CandiNonKeagamaan(),
            CandiWanua(),
            CandiDaerah(),
            CandiKerajaan(),
            CandiPribadi(),
          ],),

        )
    );
  }


}


