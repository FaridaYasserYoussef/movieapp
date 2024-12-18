import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movieapp/authentication/view/screens/login_screen.dart';
import 'package:movieapp/authentication/view/screens/sign_up_screen.dart';
// import 'package:movieapp/authentication/view/screens/temp_home_screen.dart';
import 'package:movieapp/common/app_theme.dart';
import 'package:movieapp/home/view/screen/HomeScreen.dart';
import 'package:movieapp/movies/view/screens/movie_search_screen.dart';
import 'package:movieapp/watch_list/view/Screens/watchlistScreen.dart';

import 'firebase_options.dart';

void main() async {
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
    return ScreenUtilInit(
      designSize: Size(412, 890),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
          theme: AppTheme.themeData,
          debugShowCheckedModeBanner: false,
          themeMode: ThemeMode.dark,
          darkTheme: AppTheme.darkTheme,
          home: child,
          routes: {
            LoginScreen.routeName: (context) => LoginScreen(),
            HomeScreen.routeName: (context) => HomeScreen(),
            SignupScreen.routeName: (context) => SignupScreen(),
            WatchListScreen.routeName: (context) => WatchListScreen(),
            MovieSearchScreen.routeName: (context) => MovieSearchScreen(),
          },
          initialRoute: FirebaseAuth.instance.currentUser?.uid == null
              ? LoginScreen.routeName
              : HomeScreen.routeName,
        );
      },
      child: HomeScreen(),
    );
  }
}
