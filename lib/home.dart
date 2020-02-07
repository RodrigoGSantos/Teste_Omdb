import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'delegates/search.dart';
import 'dart:convert';
import 'dart:async';
import 'api.dart';
import 'modelos/videos.dart';
import 'main.dart';

var search = "batman";
var request = "http://www.omdbapi.com/?s=$search&apikey=23e83391";

void main() => runApp(Home());

class Home extends StatefulWidget {

  Future<Map> getfilms()async {
    http.Response response = await http.get(request);
    return json.decode(response.body);
  }

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: Text("OMDb Filmes"),
        elevation: 0,
        actions: <Widget>[
          Align(
            alignment: Alignment.center,
            child: Text("0"),
          ),
          IconButton(
              icon: Icon(Icons.star),
              onPressed: () {

              }
          ),
          IconButton(
              icon: Icon(Icons.search),
              onPressed: () async {
                String result = await showSearch(context: context, delegate: DataSearch());
                print(result);
              }
          )
        ],
      ),
      body: FutureBuilder <Videos>(
        future: getfilms(search),
        builder: (context, snapshot){

        })
    );
  }
}
/*Container(
        alignment: Alignment.center,
        padding: EdgeInsets.fromLTRB(30.0, 0.0, 30.0, 0.0),
        child: Text("Olá seja bem vindo ao OMDb Filmes\n\nPara pesquisar "
            "um Filme\n basta apertar na barra no topo de sua tela "
            " no Icone de\n pesquisa\n\nJá para ver "
            "os seu favoritos aperte no icone de\n Estrela ",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 22.0,
          ),),
      ),*/
