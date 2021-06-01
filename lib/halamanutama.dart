import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_tes/model.dart';

import 'package:flutter_tes/detailPage.dart';

void main() {
  runApp(MaterialApp(
    home: HalamanUtama(),
    debugShowCheckedModeBanner: false,
  ));
}

class HalamanUtama extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<HalamanUtama> {
  List<Tripleset> jokes = [];
  List<Tripleset> _search = [];
  var loading = false;

  Future<List<Tripleset>> mainSearch() async {
    var payload = Uri.encodeComponent("prefix rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>"+
        "  prefix rdfs: <http://www.w3.org/2000/01/rdf-schema#>"+
        "prefix : <http://alunalun.info/ontology/candi#>"+
        "prefix schema: <http://schema.org/>"+
        "PREFIX dbo: <http://dbpedia.org/ontology/>"+
        "SELECT  ?id ?candi ?lokasi "+
        "(GROUP_CONCAT(COALESCE(?arcas,''); separator = '' )as ?arca)"+
        "(COALESCE (?gambarr, '') as ?gambar)"+
        "(GROUP_CONCAT(?jeniss; separator = ',' )as ?jenis)"
        "  (GROUP_CONCAT(COALESCE(?acara,''); separator = '' )as ?upacara)"+
        "(GROUP_CONCAT(COALESCE(?relieff,''); separator = '' )as ?relief)"+
        "(GROUP_CONCAT(COALESCE(?sb,''); separator = '' )as ?struktur_bangunan)"+
        "(GROUP_CONCAT(COALESCE(?nama,''); separator = '' )as ?namaLain)"+
        " (GROUP_CONCAT(COALESCE(?bahann,''); separator = '' )as ?bahan)"+
        "(GROUP_CONCAT(COALESCE(?desc,''); separator = '' )as ?deskripsi)"+
        "  WHERE {"+
        " ?id rdf:type	?idtype."+
        " ?idtype rdfs:label	?jeniss."+
        "   ?id rdfs:label ?candi."+
        " OPTIONAL{?id :profil ?gambarr.}"+
        "  OPTIONAL{?id :berasalDari ?idasal."+
        "  ?idasal dbo:location ?asall. }"+
        "OPTIONAL{?id :Deskripsi ?desc.}"+
        "?id :berasalDari ?idasal."+
        "?idasal dbo:location ?lokasi. "+
        " OPTIONAL{?id :untukUpacara ?idu."+
        "  ?idu rdfs:label ?acara}"+
        "  OPTIONAL {?id :namaLainDari ?id."+
        "?id rdfs:label ?nama}"+
        "OPTIONAL {?id :terdapatRelief ?idrelief."+
        "?idrelief rdfs:label ?relieff}"+
        "OPTIONAL {?id :terdiriDari ?idsb."+
        "?idsb rdfs:label ?sb}"+
        "OPTIONAL {?id :tersusunDari ?idbahan."+
        "?idbahan rdfs:label ?bahann.}"+
        "  OPTIONAL{?id :terdapatArca ?idarca. ?idarca rdfs:label ?arcas}}"+
        "GROUP BY  ?id ?candi  ?jenis   ?lokasi ?gambarr ?jenis");


    var headers = new Map<String, String>();
    headers['Content-Type'] = 'application/x-www-form-urlencoded';
    headers['Accept'] = 'application/json';

    var response = await http.post(
        'https://app.alunalun.info/fuseki/candi/query',
        headers: headers,
        body: "query=${payload}");
    print(response.body);


    if (response.statusCode == 200) {
      Map value = json.decode(response.body);
     // print(value);
      var head = SparqlResult.fromJson(value);
      for (var data in head.results.listTriples) {
        print(data);
        Tripleset tp = Tripleset(data.id,data.candi,data.lokasi,data.gambar,data.jenis,data.deskripsi,data.arca,data.upacara,data.relief,data.struktur_bangunan,data.bahan,data.namaLain);
        //print(data);
        jokes.add(tp);
      }
     // print(jokes);
      return jokes;
    }else{

    }

  }

  TextEditingController controller = new TextEditingController();

  onSearch(String text) async {
    _search.clear();
    if (text.isEmpty) {
      setState(() {});
      return;
    }

    jokes.forEach((f) {
      if (f.candi.value.toLowerCase().contains(text) || f.candi.value.toUpperCase().contains(text)||f.id.value.toString().contains(text))
        _search.add(f);
    });

    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    mainSearch();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
          // child: WebView(
          //   initialUrl: Uri.dataFromString('<html><body><iframe src="https://www.youtube.com/embed/abc"></iframe></body></html>', mimeType: 'text/html').toString(),
          //   javascriptMode: JavascriptMode.unrestricted,
          // )
    ),
    );
  }
}

