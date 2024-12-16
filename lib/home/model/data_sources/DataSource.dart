import 'dart:convert';
import 'package:movieapp/common/api_constant.dart';
import 'package:movieapp/home/model/data_models/browseList_model.dart';
import 'package:movieapp/home/model/data_models/browse_model.dart';
import 'package:movieapp/home/model/data_models/popular_model.dart';
import 'package:movieapp/home/model/data_models/recomend_model.dart';
import 'package:movieapp/home/model/data_models/release_model.dart';
import 'package:http/http.dart' as https;

class DataSource {
  Future<ReleasesModel> getNewRelease() async {
    var url = Uri.parse(
        'https://api.themoviedb.org/3/movie/upcoming?api_key=${ApiConstant.Apikey}');
    var responce = await https.get(url);
    String body = responce.body;
    var json = jsonDecode(body);
    return ReleasesModel.fromJson(json);
  }

  Future<RecomendModel> getRecommended() async {
    var url = Uri.parse(
        'https://api.themoviedb.org/3/movie/top_rated?api_key=${ApiConstant.Apikey}');
    var responce = await https.get(url);
    String body = responce.body;
    var json = jsonDecode(body);
    return RecomendModel.fromJson(json);
  }

  Future<PopularModel> getPopular() async {
    var url = Uri.parse(
        'https://api.themoviedb.org/3/movie/popular?api_key=${ApiConstant.Apikey}');
    var responce = await https.get(url);
    String body = responce.body;
    var json = jsonDecode(body);
    return PopularModel.fromJson(json);
  }

  Future<BrowseModel> getBrowse() async {
    var url = Uri.parse(
        'https://api.themoviedb.org/3/genre/movie/list?api_key=${ApiConstant.Apikey}');
    var responce = await https.get(url);
    String body = responce.body;
    var json = jsonDecode(body);
    return BrowseModel.fromJson(json);
  }

  Future<BrowseListModel> getBrowseList() async {
    var url = Uri.parse(
        'https://api.themoviedb.org/3/discover/movie?api_key=cd1b1a2444d97eb51b27c3839e2e0126');
    var responce = await https.get(url);
    String body = responce.body;
    var json = jsonDecode(body);
    return BrowseListModel.fromJson(json);
  }
}
