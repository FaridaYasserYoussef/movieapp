import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp/authentication/view/screens/login_screen.dart';
import 'package:movieapp/authentication/view_model/AuthenticationCubit.dart';
import 'package:movieapp/authentication/view_model/AuthenticationState.dart';
import 'package:movieapp/common/app_colors.dart';

class LogoutButton extends StatelessWidget {
   LogoutButton({super.key});
  AuthenticationCubit authenticationCubit = AuthenticationCubit();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context)=> authenticationCubit,
    child: BlocListener<AuthenticationCubit, AuthenticationState>(
      child: IconButton(
      onPressed: () async{
       await authenticationCubit.logout();
        authenticationCubit.resetAuthenticationState();
      },
      icon: Icon(Icons.logout,
      color: AppColors.mainColor,),
    ),
      listener: (context, state) {
        if(state is AuthenticationInitialState){
          Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);
        }
      
    },)
    );
  }
}