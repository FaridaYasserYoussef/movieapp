import 'package:flutter/material.dart';
import 'package:movieapp/home/model/data_models/browse_model.dart';
import 'package:movieapp/home/model/data_sources/DataSource.dart';

class BrowseProvider extends ChangeNotifier {
  DataSource dataSource = DataSource();
  BrowseModel? browseModel;
  String? errorMessage;
  bool watting = false;
  Future getBrowse() async {
    watting = true;
    notifyListeners();
    try {
      BrowseModel response = await dataSource.getBrowse();
      browseModel = response;
    } catch (e) {
      errorMessage = e.toString();
    }
    watting = false;
    notifyListeners();
  }
}
