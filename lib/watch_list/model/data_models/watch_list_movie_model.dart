import 'dart:convert';

class WatchListMovieModel{
   String? id;
   String? movieName;
   int? year;
   String? artists;
   String? imageUrl;

  WatchListMovieModel( {this.id,  this.movieName,  this.year,  this.artists, this.imageUrl});

  WatchListMovieModel.fromJson(Map<String, dynamic> json):this(
  id: json['id'],
   movieName: json['name'],
   year:  int.parse((json["year"]).toString()),
   artists: json["artists"],
   imageUrl: json["imageUrl"]
  );

  Map<String, dynamic> toJson()=>{
    'id': id,
    'name': movieName,
    'year': year,
    'artists': artists,
    'imageUrl': imageUrl
  };


}