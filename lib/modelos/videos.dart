class Videos{

  final String Title;
  final String Poster;
  final String imdbID;

  Videos({this.Title, this.Poster, this.imdbID});

  factory Videos.fromJson(Map<String, dynamic> json){

    return Videos(

      imdbID: json["imdbID"],
      Title: json["Title"],
      Poster: json["Poster"]

    );

  }

}