import 'package:flutter/material.dart';
import 'package:movieapp/home/view/widget/botton_widget.dart';
import 'package:movieapp/home/view/widget/middle_widget.dart';
import 'package:movieapp/home/view/widget/top_widget.dart';

class CustomHomeTab extends StatelessWidget {
  CustomHomeTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TopWidget(),
        SizedBox(
          height: 20,
        ),
        MiddleWidget(),
        SizedBox(
          height: 20,
        ),
        bottonWidget()
      ],
    );
  }
}

//'https://mir-s3-cdn-cf.behance.net/project_modules/1400/3ed155138856997.6226c3733c226.png'
