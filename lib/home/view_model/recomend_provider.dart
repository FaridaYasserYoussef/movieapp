import 'package:flutter/material.dart';
import 'package:movieapp/home/model/data_models/recomend_model.dart';
import 'package:movieapp/home/model/data_sources/DataSource.dart';

class RecomendProvider extends ChangeNotifier {
  DataSource dataSource = DataSource();
  RecomendModel? recomendModel;
  String? errorMessage;
  bool watting = false;
  Future getRecomend() async {
    watting = true;
    notifyListeners();
    try {
      RecomendModel response = await dataSource.getRecommended();
      recomendModel = response;
    } catch (e) {
      errorMessage = e.toString();
    }
    watting = false;
    notifyListeners();
  }
}
