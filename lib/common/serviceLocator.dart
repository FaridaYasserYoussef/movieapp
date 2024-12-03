import 'package:movieapp/authentication/model/data_sources/user_data_source.dart';
import 'package:movieapp/authentication/model/data_sources/user_firebase_data_sources.dart';

class ServiceLocator{
  static  UserDataSource currentUserDataSource = UserFirebaseDataSource();
}