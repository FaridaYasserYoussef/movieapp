import 'package:flutter/material.dart';
import 'package:movieapp/common/app_theme.dart';
import 'package:movieapp/movies/view/screens/movie_search_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      darkTheme: AppTheme.darkTheme,
      home: const MovieSearchScreen(),
      // home: const MovieDetailsScreen(
      //   movieId: 499701,
      // ),
    );
  }
}
