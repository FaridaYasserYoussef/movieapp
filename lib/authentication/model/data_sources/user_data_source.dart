import 'package:movieapp/authentication/model/data_models/user_model.dart';

abstract class UserDataSource{
 Future<UserModel> signup(UserModel user, String password);
 Future<UserModel?> login(String email, String password);
 Future<void> logout();
}