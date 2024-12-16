import 'package:flutter/material.dart';
import 'package:movieapp/home/model/data_models/release_model.dart';
import 'package:movieapp/home/model/data_sources/DataSource.dart';

class ReleaseProvider extends ChangeNotifier {
  DataSource dataSource = DataSource();
  ReleasesModel? releasesModel;
  String? errorMessage;
  bool watting = false;
  Future getNewRelease() async {
    watting = true;
    notifyListeners();
    try {
      ReleasesModel response = await dataSource.getNewRelease();
      releasesModel = response;
    } catch (e) {
      errorMessage = e.toString();
    }
    watting = false;
    notifyListeners();
  }
}
