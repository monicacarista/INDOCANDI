import 'dart:io';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter_tes/model.dart';
import 'package:flutter_tes/Tab/SideBar.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'list_item.dart';


class CandiNonKeagamaan extends StatefulWidget{

  @override
  _CandiNonKeagamaan createState() => _CandiNonKeagamaan();
}

class _CandiNonKeagamaan extends State {

  Future<List<Tripleset>> mainKerajaan() async {
    var payload = Uri.encodeComponent("prefix rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>"+
        "prefix rdfs: <http://www.w3.org/2000/01/rdf-schema#>"+
        "prefix : <http://alunalun.info/ontology/candi#> "+
        "prefix schema: <http://schema.org/>"+
        "SELECT ?candi ?lokasi ?gambar WHERE {?id rdf:type :CandiNonKeagamaan.?id rdfs:label ?candi . ?id :berasalDari ?lokasi. ?id :profil ?gambar.}");
    var headers = new Map<String, String>();
    headers['Content-Type'] = 'application/x-www-form-urlencoded';
    headers['Accept'] = 'application/json';

    var response = await http.post(
        'https://app.alunalun.info/fuseki/candi/query',
        headers: headers,
        body: "query=${payload}");
    List<Tripleset> jokes = [];

    if (response.statusCode == 200) {
      Map value = json.decode(response.body);
      var head = SparqlResult.fromJson(value);
      for (var data in head.results.listTriples) {
        // print(data);
        Tripleset tp = Tripleset(data.candi,data.lokasi,data.gambar);
        jokes.add(tp);
      }
      return jokes;
    }

  }

  @override
  void initState() {
    super.initState();
    mainKerajaan();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter ListView'),
      ),
      body: Center(
        child: FutureBuilder <List<Tripleset>>(
          future: mainKerajaan(),
          builder: (context, AsyncSnapshot snapshot){
            if (snapshot.data == null) {
              return Container(
                child: Center(
                  child: Text("Loadinggggggggggggggggggggggggggggggggg"),
                ),
              );
            } else{
              return
                ListView.builder(
                    itemCount: snapshot.data.length,
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
                                child: new Image.network(
                                    // "assets/images/borobudur.jpg",
                                    "snapshot.data[index].gambar.value"
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
                                    new Text(snapshot.data[index].candi.value),
                                    new SizedBox(height: 16.0),
                                    new Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        new Text(snapshot.data[index].lokasi.value),
                                        //  new Text(data['source']['name']),
                                      ],
                                    ),
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
                );





            }

          },
        ),
      ),
    );
  }

}