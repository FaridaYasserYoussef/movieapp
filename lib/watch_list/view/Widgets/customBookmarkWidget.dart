import 'package:flutter/material.dart';

class CustomBookMarkWidget extends StatelessWidget {
  const CustomBookMarkWidget({super.key, this.onTap});
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return   GestureDetector( 
      onTap: onTap,
    child: Stack(
    alignment: Alignment.center,  // Centers all children
    children: [
      Icon(Icons.bookmark, color: Colors.yellow, size: 60),
      Icon(Icons.check, color: Colors.white, size: 20),
    ],
    ),
  );
  }
}