import 'dart:convert';
import 'package:movieapp/common/api_constant.dart';
import 'package:http/http.dart' as https;
import 'package:movieapp/home/model/data_models/release_model.dart';

class DataSource {
  static Future<ReleasesModel> getNewRelease() async {
    var url = Uri.parse(
        'https://api.themoviedb.org/3/movie/upcoming?api_key=$ApiConstant');
    var responce = await https.get(url);
    String body = responce.body;
    var json = jsonDecode(body);
    return ReleasesModel.fromJson(json);
  }
}

// Uri.https(ApiConstant.baseUrl, ApiConstant.NewReleaseEndpoint,
       // {'apikey': ApiConstant.Apikey});
