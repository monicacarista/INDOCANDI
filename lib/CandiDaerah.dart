import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_tes/CandiDaerah.dart';
import 'package:flutter_tes/splashscreen_view.dart';
import 'package:flutter_tes/CandiKeagamaan.dart';
import 'package:http/http.dart'as http;
import 'dart:convert';
import 'package:flutter_tes/list_item.dart';
import 'package:flutter_tes/Tab/SideBar.dart';

class CandiDaerah extends StatefulWidget {
  @override
  _candidaerah createState() => _candidaerah();

}

class _candidaerah extends State<CandiDaerah> with SingleTickerProviderStateMixin{
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
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            title: Text("Candi Daerah",
              style: new TextStyle(
                  fontSize: 24.0, fontWeight: FontWeight.bold
              ),),
            backgroundColor: Colors.blue,
            centerTitle: true,

          // bottom: new TabBar(
          //     isScrollable: true,
          //     // indicatorWeight: 10.0,
          //     //indicatorColor: Colors.black,
          //     // controller: controller,
          //     tabs:<Widget>[
          //       new Tab(text: "Candi Keagamaan"),
          //       new Tab(text: "Candi Non Keagamaan",),
          //       new Tab(text: "Candi Wanua",),
          //       new Tab(text: "Candi Daerah",),
          //     ]
          // ),

           ),
          drawer: SideBar(),
          body: _buildBody(context),
          //  body: TabBarView(children: [
          //    CandiKeagamaan(),
          //    CandiNonKeagamaan(),
          //    CandiWanua(),
          //    CandiDaerah(),
          //  ],),

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
