import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:movieapp/authentication/model/data_models/user_model.dart';
import 'package:movieapp/authentication/view/screens/login_screen.dart';
import 'package:movieapp/authentication/view/widgets/custom_form_button.dart';
import 'package:movieapp/authentication/view/widgets/custom_form_textField.dart';
import 'package:movieapp/authentication/view_model/AuthenticationCubit.dart';
import 'package:movieapp/authentication/view_model/AuthenticationState.dart';
import 'package:movieapp/common/app_colors.dart';
import 'package:movieapp/common/widgets/custom_error_widget.dart';
import 'package:movieapp/common/widgets/loading_widget.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});
  static const String routeName = "signup";

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();

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

            //  Text("Welcome Back!!", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),

            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Form(
                  key: formkey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      CustomTextFormField(
                        hintText: 'Name',
                        controller: nameController,
                        validator: (p0) {
                          if (p0 == "") {
                            return "Name field cannot be empty";
                          }
                          if (p0!.length < 2) {
                            return "Name should ne at least 2 characters";
                          }
                        },
                      ),
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
                          text: "Sign up",
                          onTap: () async {
                            if (formkey.currentState!.validate()) {
                              UserModel user = UserModel(
                                  email: emailController.text,
                                  name: nameController.text);
                              await authenticationCubit.signup(
                                  user, passwordController.text);
                            }
                          },
                        ),
                        listener: (context, state) {
                          if (state is AuthenticationSuccessState) {
                            Fluttertoast.showToast(
                                msg: "Sign up successful",
                                gravity: ToastGravity.BOTTOM,
                                textColor: Colors.white,
                                backgroundColor: AppColors.mainColor);
                            emailController.text = "";
                            nameController.text = "";
                            passwordController.text = "";
                            authenticationCubit.resetAuthenticationState();
                          }
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 70),
                        child: Row(
                          children: [
                            Text(
                              "Already have an account? ",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15),
                            ),
                            TextButton(
                                onPressed: () {
                                  Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                          builder: (context) => LoginScreen()));
                                },
                                child: Text(
                                  "Login",
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
