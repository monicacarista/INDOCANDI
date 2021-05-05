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

  Future<List<Tripleset>> main1() async {
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
      main1();
    }
    @override
    Widget build(BuildContext context) {
      return  Scaffold(
        appBar: AppBar(
          title: Text('Flutter ListView'),
        ),
        body: Center(
          child: FutureBuilder <List<Tripleset>>(
            future: main1(),
            builder: (context, AsyncSnapshot snapshot) {
              //  print(snapshot.data);
              if (snapshot.data == null) {
                return Container(
                  child: Center(
                    child: Text("Loadinggggggggggggggggggggggggggggggggg"),
                  ),
                );
              } else {
                return
                  ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Card(
                          margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                          shadowColor: Color(0xFFBA68c8),
                          elevation: 2.0,
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                            child: Container(
                              padding: EdgeInsets.fromLTRB(5, 3, 5, 3),
                              margin: EdgeInsets.fromLTRB(3, 3, 3, 3),
                              child: ListTile(
                                title: Text(
                                    snapshot.data[index].candi.value,
                                    style: TextStyle(
                                    color: Color(0xFFA848BC),
                                      fontWeight: FontWeight.bold,
                                ),
                                ),
                                subtitle: Text(snapshot.data[index].lokasi.value),
                                leading: CircleAvatar(
                                  backgroundColor: Colors.white,
                                  child: Image.network(
                                  snapshot.data[index].gambar.value,
                               //     data['urlToImage'] ?? 'https://via.placeholder.com/400x200',
                                  // "assets/images/borobudur.jpg",

                                  width: 200,
                                  height: 200,
                                  ),
                                ),
                                trailing: IconButton(
                                  icon: Icon(
                                    Icons.arrow_forward_ios_rounded,
                                    color: Colors.black26,
                                    size: 20,
                                  ),
                                  onPressed: (){
                                    //detail candi
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context)=> UserViewModel())
                                    );
                                  },
                                ),
                              ),
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