import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:testeomdb/modelos/videos.dart';

class Search {
  Future<List<Videos>> getfilms(String search) async {
    http.Response response =
        await http.get("http://www.omdbapi.com/?s=$search&apikey=23e83391");

    var filmes = <Videos>[];
    var decoded = json.decode(response.body);

    List video = decoded["Search"];

    print(filmes);

    if (video == null) {
      return filmes;
    } else {
      video.forEach((f) => filmes.add((Videos())));
      return filmes;
    }
  }
}
/**/
