import 'package:movieapp/authentication/model/data_models/user_model.dart';
import 'package:movieapp/authentication/model/data_sources/user_data_source.dart';

class UserRepository{
 final UserDataSource dataSource;

  UserRepository({required this.dataSource});

   Future<UserModel>  signup(UserModel user, String password)async{
   UserModel userModel =  await dataSource.signup(user, password);
   return userModel;
  }

 Future<UserModel?>  login(String email, String password)async{
    UserModel? userModel = await dataSource.login(email, password);
    return userModel;
  }

  Future<void> logout() async{
    await dataSource.logout();
  }

}