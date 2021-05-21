import 'dart:io';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter_tes/CandiBuddha.dart';
import 'package:flutter_tes/CandiHindu.dart';
import 'package:flutter_tes/CandiSiwaBuddha.dart';
import 'package:flutter_tes/CandiKerajaan.dart';
import 'package:flutter_tes/CandiNonKeagamaan.dart';
import 'package:flutter_tes/CandiPribadi.dart';
import 'package:flutter_tes/CandiWanua.dart';
import 'package:flutter_tes/detailPage.dart';
import 'package:flutter_tes/model.dart';
import 'package:flutter_tes/Tab/SideBar.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;

import 'list_item.dart';


class HalamanUtama extends StatefulWidget{

  @override
  _HalamanUtama createState() => _HalamanUtama();
}

class _HalamanUtama extends State {


  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('INDOCANDI'),
        backgroundColor: Colors.blueGrey.shade700,

      ),
      body: new SingleChildScrollView(
        child: new Padding(padding: const EdgeInsets.all(5.0),
          child:  Card(
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
                      "assets/images/CandiAbang.jpg",
                    ),
                    borderRadius: BorderRadius.only(
                      topLeft: new Radius.circular(16.0),
                      topRight: new Radius.circular(16.0),
                    ),


                  ), new Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      new IconButton(
                        icon: new Icon(FontAwesomeIcons.angleRight),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => new CandiHindu()));
                        },
                      )
                    ],
                  ),

                  new Padding(
                    padding: new EdgeInsets.all(16.0),
                    child: new Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        new Text("Candi Hindu",
                          style: new TextStyle(fontWeight: FontWeight.bold),),
                        new SizedBox(height: 16.0),

                      ],
                    ),
                  ),
                  // hindu

                  new ClipRRect(
                    child: new Image.asset(
                      "assets/images/borobudur.jpg",
                    ),
                    borderRadius: BorderRadius.only(
                      topLeft: new Radius.circular(16.0),
                      topRight: new Radius.circular(16.0),
                    ),


                  ), new Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      new IconButton(
                        icon: new Icon(FontAwesomeIcons.angleRight),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => new CandiBuddha()));
                        },
                      )
                    ],
                  ),

                  new Padding(
                    padding: new EdgeInsets.all(16.0),
                    child: new Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        new Text("Candi Buddha",
                          style: new TextStyle(fontWeight: FontWeight.bold),),
                        new SizedBox(height: 16.0),

                      ],
                    ),
                  ),
                  //budha

                  new ClipRRect(
                    child: new Image.asset(
                      "assets/images/CandiBarong.jpg",
                    ),
                    borderRadius: BorderRadius.only(
                      topLeft: new Radius.circular(16.0),
                      topRight: new Radius.circular(16.0),
                    ),


                  ), new Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      new IconButton(
                        icon: new Icon(FontAwesomeIcons.angleRight),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => new CandiSiwaBuddha()));
                        },
                      )
                    ],
                  ),

                  new Padding(
                    padding: new EdgeInsets.all(16.0),
                    child: new Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        new Text("Candi Siwa Budha",
                          style: new TextStyle(fontWeight: FontWeight.bold),),
                        new SizedBox(height: 16.0),

                      ],
                    ),
                  ),
              // siwa budha
                  new ClipRRect(
                    child: new Image.asset(
                      "assets/images/CandiAngin.jpg",
                    ),
                    borderRadius: BorderRadius.only(
                      topLeft: new Radius.circular(16.0),
                      topRight: new Radius.circular(16.0),
                    ),


                  ), new Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      new IconButton(
                        icon: new Icon(FontAwesomeIcons.angleRight),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => new CandiNonKeagamaan()));
                        },
                      )
                    ],
                  ),

                  new Padding(
                    padding: new EdgeInsets.all(16.0),
                    child: new Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        new Text("Candi Kerajaan",
                          style: new TextStyle(fontWeight: FontWeight.bold),),
                        new SizedBox(height: 16.0),

                      ],
                    ),
                  ),
                  //nonkeagaamn

                  new ClipRRect(
                    child: new Image.asset(
                      "assets/images/CandiKelir.jpg",
                    ),
                    borderRadius: BorderRadius.only(
                      topLeft: new Radius.circular(16.0),
                      topRight: new Radius.circular(16.0),
                    ),


                  ), new Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      new IconButton(
                        icon: new Icon(FontAwesomeIcons.angleRight),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => new CandiKerajaan()));
                        },
                      )
                    ],
                  ),

                  new Padding(
                    padding: new EdgeInsets.all(16.0),
                    child: new Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        new Text("Candi Kerajaan",
                          style: new TextStyle(fontWeight: FontWeight.bold),),
                        new SizedBox(height: 16.0),

                      ],
                    ),
                  ),
                    //kerajaan
                  new ClipRRect(
                    child: new Image.asset(
                      "assets/images/CandiBajangRatu.jpg",
                    ),
                    borderRadius: BorderRadius.only(
                      topLeft: new Radius.circular(16.0),
                      topRight: new Radius.circular(16.0),
                    ),


                  ), new Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      new IconButton(
                        icon: new Icon(FontAwesomeIcons.angleRight),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => new CandiPribadi()));
                        },
                      )
                    ],
                  ),

                  new Padding(
                    padding: new EdgeInsets.all(16.0),
                    child: new Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        new Text("Candi Pribadi",
                          style: new TextStyle(fontWeight: FontWeight.bold),),
                        new SizedBox(height: 16.0),

                      ],
                    ),
                  ),
            //pribadi
                  new ClipRRect(
                    child: new Image.asset(
                      "assets/images/CandiCungkup.jpg",
                    ),
                    borderRadius: BorderRadius.only(
                      topLeft: new Radius.circular(16.0),
                      topRight: new Radius.circular(16.0),
                    ),


                  ), new Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      new IconButton(
                        icon: new Icon(FontAwesomeIcons.angleRight),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => new CandiWanua()));
                        },
                      )
                    ],
                  ),

                  new Padding(
                    padding: new EdgeInsets.all(16.0),
                    child: new Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        new Text("Candi Wanua atau Watak",
                          style: new TextStyle(fontWeight: FontWeight.bold),),
                        new SizedBox(height: 16.0),

                      ],
                    ),
                  ),
                    //wanua watak
                  new ClipRRect(
                    child: new Image.asset(
                      "assets/images/CandiGunungKawi.jpg",
                    ),
                    borderRadius: BorderRadius.only(
                      topLeft: new Radius.circular(16.0),
                      topRight: new Radius.circular(16.0),
                    ),


                  ), new Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      new IconButton(
                        icon: new Icon(FontAwesomeIcons.angleRight),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => new CandiWanua()));
                        },
                      )
                    ],
                  ),

                  new Padding(
                    padding: new EdgeInsets.all(16.0),
                    child: new Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        new Text("Candi Daerah",
                          style: new TextStyle(fontWeight: FontWeight.bold),),
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

          ),
      ),


        ),

      );



  }

}