import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp/authentication/model/data_models/user_model.dart';
import 'package:movieapp/authentication/repository/user_repository.dart';
import 'package:movieapp/authentication/view_model/AuthenticationState.dart';
import 'package:movieapp/common/serviceLocator.dart';

class AuthenticationCubit extends Cubit<AuthenticationState>{
  UserRepository userRepository;
  AuthenticationCubit():userRepository = UserRepository(dataSource: ServiceLocator.currentUserDataSource), super(AuthenticationInitialState());

  resetAuthenticationState(){
    emit(AuthenticationInitialState());
  }

  Future<void> logout() async{
    await userRepository.logout();
  }

  Future login(String email, String password) async{
    try{
      emit(AuthenticationLoadingState());
      UserModel? user = await userRepository.login(email, password);
      emit(AuthenticationSuccessState(userModel: user!));
     
    }
    catch(e){
     emit(AuthenticationErrorState(errorMessage: e.toString()));
    }
  }

  Future signup(UserModel user, String password)async{
    try{
      emit(AuthenticationLoadingState());
      UserModel? userModel = await userRepository.signup(user, password);
      emit(AuthenticationSuccessState(userModel: userModel));
    }
    catch(e){
       emit(AuthenticationErrorState(errorMessage: e.toString()));
    }
  }

}