import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_tes/CandiDaerah.dart';
import 'package:flutter_tes/CandiNonKeagamaan.dart';
import 'package:flutter_tes/CandiPribadi.dart';
import 'package:flutter_tes/CandiWanua.dart';
import 'package:flutter_tes/splashscreen_view.dart';
import 'package:http/http.dart'as http;
import 'dart:convert';
import 'package:flutter_tes/list_item.dart';
import 'package:flutter_tes/Tab/SideBar.dart';
import 'package:flutter_tes/Tab/TabBar.dart';

import 'CandiKerajaan.dart';

class CandiKeagamaan extends StatefulWidget {
  @override
  _candikeagamaan createState() => _candikeagamaan();

}

class _candikeagamaan extends State<CandiKeagamaan> with SingleTickerProviderStateMixin{
  //controller utk tab bar
  TabController controller;


  @override
  void initState(){
    controller = new TabController(vsync: this, length: 4);
    super.initState();
    http.get(_apiUrl).then((response){
      var data = json.decode(response.body);
      print(response);
      setState(() {
        _total = data['totalResults'];
        _articles = data['articles'];
        _loading =false;
      });
    });
  }

  @override
  void dispose(){
    controller.dispose();
    super.dispose();
  }

  String _apiUrl = 'http://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=7aedbfcb0d4e4ceca6ec38f24c329fa2';
  int _total=0;
  List _articles=[];
  bool _loading = true;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 6,
        child: Scaffold(
          appBar: AppBar(
            title: Text("Candi Keagamaan",
              style: new TextStyle(
                  fontSize: 24.0, fontWeight: FontWeight.bold
              ),),
            backgroundColor: Colors.blue,
            centerTitle: true,

        ),
         drawer: SideBar(),

          body: _buildBody(context),

        )
    );
  }
  _buildBody(BuildContext context) {
    if(_loading) {
      return new SpinKitRotatingCircle(
        color: Colors.blue,
        size: 50.0,
      );
    }

    return new ListView.builder(
      itemBuilder: (context, index){
        return new Padding(
          padding: new EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0 ),
          child: new ListItem(data: _articles[index]),
        );

      },
      itemCount: 10,
    );
  }

}
