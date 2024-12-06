import 'dart:convert';
import 'package:movieapp/home/model/data_models/popular_model.dart';
import 'package:movieapp/home/model/data_models/recomend_model.dart';
import 'package:movieapp/home/model/data_models/release_model.dart';

class DataSource {
  static Future<ReleasesModel> getNewRelease() async {
    var url = Uri.parse(
        'https://api.themoviedb.org/3/movie/upcoming?api_key=cd1b1a2444d97eb51b27c3839e2e0126');
    var responce = await https.get(url);
    String body = responce.body;
    var json = jsonDecode(body);
    return ReleasesModel.fromJson(json);
  }

  static Future<RecomendModel> getRecommended() async {
    var url = Uri.parse(
        'https://api.themoviedb.org/3/movie/top_rated?api_key=cd1b1a2444d97eb51b27c3839e2e0126');
    var responce = await https.get(url);
    String body = responce.body;
    var json = jsonDecode(body);
    return RecomendModel.fromJson(json);
  }

  static Future<PopularModel> getPopular() async {
    var url = Uri.parse(
        'https://api.themoviedb.org/3/movie/popular?api_key=cd1b1a2444d97eb51b27c3839e2e0126');
    var responce = await https.get(url);
    String body = responce.body;
    var json = jsonDecode(body);
    return PopularModel.fromJson(json);
  }
}
