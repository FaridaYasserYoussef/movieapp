import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:movieapp/authentication/view/screens/sign_up_screen.dart';
import 'package:movieapp/authentication/view/widgets/custom_form_button.dart';
import 'package:movieapp/authentication/view/widgets/custom_form_textField.dart';
import 'package:movieapp/authentication/view_model/AuthenticationCubit.dart';
import 'package:movieapp/authentication/view_model/AuthenticationState.dart';
import 'package:movieapp/common/app_colors.dart';
import 'package:movieapp/common/widgets/custom_error_widget.dart';
import 'package:movieapp/common/widgets/loading_widget.dart';
import 'package:movieapp/home/view/screen/HomeScreen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  static const String routeName = "login";

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  late AuthenticationCubit authenticationCubit;

  @override
  void initState() {
    super.initState();

    authenticationCubit = AuthenticationCubit();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff121312),
      body: SingleChildScrollView(
          child: BlocProvider(
        create: (context) => authenticationCubit,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50.0),
              child: Center(
                  child: Image(
                image: AssetImage("assets/movies.png"),
                height: 150,
              )),
            ),

            //  Text("Welcome Back!!", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),

            BlocBuilder<AuthenticationCubit, AuthenticationState>(
                builder: (context, state) {
              if (state is AuthenticationLoadingState) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15.0),
                  child: LoadingWidget(),
                );
              } else if (state is AuthenticationErrorState) {
                return CustomErrorWidget(errorMessage: state.errorMessage);
              }

              return SizedBox();
            }),

            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Form(
                  key: formkey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      CustomTextFormField(
                        hintText: 'Email',
                        controller: emailController,
                        validator: (p0) {
                          if (p0 == "") {
                            return "Email field cannot be empty";
                          }
                          if (!p0!.contains("@")) {
                            return "Email must contain @";
                          }
                          if (!p0.endsWith(".com")) {
                            return "Email must end with .com";
                          }
                        },
                      ),
                      CustomTextFormField(
                        hintText: 'Password',
                        controller: passwordController,
                        type: "password",
                        validator: (p0) {
                          if (p0 == "") {
                            return "Paaword field cannot be empty";
                          }
                          if (p0!.length < 8) {
                            return "The Password should ne at least 8 characters";
                          }
                        },
                      ),
                      BlocListener<AuthenticationCubit, AuthenticationState>(
                        child: CustomFormButton(
                          text: "Login",
                          onTap: () async {
                            if (formkey.currentState!.validate()) {
                              await authenticationCubit.login(
                                  emailController.text,
                                  passwordController.text);
                            }
                          },
                        ),
                        listener: (context, state) {
                          if (state is AuthenticationSuccessState) {
                            Fluttertoast.showToast(
                                msg: "Login successful",
                                gravity: ToastGravity.BOTTOM,
                                textColor: Colors.white,
                                backgroundColor: AppColors.mainColor);
                            emailController.text = "";
                            passwordController.text = "";
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) => HomeScreen()));
                          }
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 70),
                        child: Row(
                          children: [
                            Text(
                              "Don't have an account? ",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15),
                            ),
                            TextButton(
                                onPressed: () {
                                  Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              SignupScreen()));
                                },
                                child: Text(
                                  "Sign up",
                                  style: TextStyle(
                                      color: AppColors.mainColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ))
                          ],
                        ),
                      )
                    ],
                  )),
            )
          ],
        ),
      )),
    );
  }
}
