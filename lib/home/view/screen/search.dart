import 'package:flutter/material.dart';

class CustomSearch extends StatelessWidget {
  const CustomSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(height: 90,
      child: ListView.builder(itemBuilder: (context, int) {
        return Container(
          height:90,
          color: Colors.red,
        );
      }),
    );
  }
}