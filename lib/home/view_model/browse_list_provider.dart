import 'package:flutter/material.dart';
import 'package:movieapp/home/model/data_models/browseList_model.dart';
import 'package:movieapp/home/model/data_sources/DataSource.dart';

class BrowseListProvider extends ChangeNotifier {
  DataSource dataSource = DataSource();
  BrowseListModel? browseListModel;
  String? errorMessage;
  bool watting = false;
  Future getBrowseList() async {
    watting = true;
    notifyListeners();
    try {
      BrowseListModel response = await dataSource.getBrowseList();
      browseListModel = response;
    } catch (e) {
      errorMessage = e.toString();
    }
    watting = false;
    notifyListeners();
  }
}
