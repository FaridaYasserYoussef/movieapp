import 'package:movieapp/authentication/model/data_models/user_model.dart';

abstract class AuthenticationState{}

class AuthenticationLoadingState extends AuthenticationState{}

class AuthenticationInitialState extends AuthenticationState{}
class AuthenticationErrorState extends AuthenticationState{
  final String errorMessage;

  AuthenticationErrorState({required this.errorMessage});
}

class AuthenticationSuccessState extends AuthenticationState{
  final UserModel userModel;

  AuthenticationSuccessState({required this.userModel});
}