import 'package:flutter/material.dart';
import 'package:movieapp/common/app_theme.dart';
import 'package:movieapp/home/view/screen/HomeScreen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
          home: child,
        );
      },
      child: HomeScreen(),
    );
  }
}
