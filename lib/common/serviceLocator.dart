import 'package:movieapp/authentication/model/data_sources/user_data_source.dart';
import 'package:movieapp/authentication/model/data_sources/user_firebase_data_sources.dart';
import 'package:movieapp/watch_list/model/data_sources/watch_list_data_source.dart';
import 'package:movieapp/watch_list/model/data_sources/watch_list_firebase_data_source.dart';

class ServiceLocator{
  static  UserDataSource currentUserDataSource = UserFirebaseDataSource();
  static WatchListDataSource currentWatchListDataSource = WatchListFirebaseDataSource();
}