import 'package:flutter/material.dart';
import 'package:movieapp/common/App_color.dart';
import 'package:movieapp/home/view/widget/card_recomend.dart';

class bottonWidget extends StatelessWidget {
  const bottonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.grayColor,
      child: Column(
        children: [
          Align(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'New Releases',
                style: TextStyle(fontSize: 20),
              ),
            ),
            alignment: Alignment.topLeft,
          ),
          SizedBox(
            height: 190,
            child: ListView.separated(
                separatorBuilder: (context, index) => SizedBox(
                      width: 10,
                    ),
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return CardRecomend();
                }),
          ),
        ],
      ),
    );
  }
}
