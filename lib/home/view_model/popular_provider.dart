import 'package:flutter/material.dart';
import 'package:movieapp/home/model/data_models/popular_model.dart';
import 'package:movieapp/home/model/data_sources/DataSource.dart';

class PopularProvider extends ChangeNotifier {
  DataSource dataSource = DataSource();
  PopularModel? popularModel;
  String? errorMessage;
  bool watting = false;
  Future getPopular() async {
    watting = true;
    notifyListeners();
    try {
      PopularModel response = await dataSource.getPopular();
      popularModel = response;
    } catch (e) {
      errorMessage = e.toString();
    }
    watting = false;
    notifyListeners();
  }
}
