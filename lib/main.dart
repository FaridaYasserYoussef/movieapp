import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:movieapp/authentication/view/screens/login_screen.dart';
import 'package:movieapp/authentication/view/screens/sign_up_screen.dart';
import 'package:movieapp/authentication/view/screens/temp_home_screen.dart';
import 'package:movieapp/watch_list/view/Screens/watchlistScreen.dart';
import 'firebase_options.dart';
void main() async{
    WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
   
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: LoginScreen()

      routes: {
        LoginScreen.routeName:(context) => LoginScreen(),
        HomeScreen.routeName :(context) => HomeScreen(),
        SignupScreen.routeName:(context) => SignupScreen(),
        WatchListScreen.routeName: (context)=>WatchListScreen()
      },
            initialRoute: FirebaseAuth.instance.currentUser?.uid == null? LoginScreen.routeName : WatchListScreen.routeName,

    );
  }
}

