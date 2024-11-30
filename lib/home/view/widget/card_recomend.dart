import 'package:flutter/material.dart';
import 'package:movieapp/common/App_color.dart';

class CardRecomend extends StatelessWidget {
  CardRecomend({
    super.key,
  });
  //final Results releaseModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              child: Image.network(
                'https://mir-s3-cdn-cf.behance.net/project_modules/1400/3ed155138856997.6226c3733c226.png',
                fit: BoxFit.fill,
              ),
              height: 120,
              width: 80,
            ),
            Align(
                alignment: Alignment.topLeft,
                child: Stack(children: [
                  Icon(
                    Icons.bookmark,
                    color: AppColor.opacityGrayColor,
                    size: 36,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.add),
                    iconSize: 20,
                    color: Colors.white,
                  )
                ]))
          ],
        ),
        Padding(
          padding:  EdgeInsets.only(left: .9),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [Icon(Icons.star_rate_rounded), Text('7.7')],
              ),
              Text('Deponded'),
              Text('2018 R 1h59m')
            ],
          ),
        ),
      ],
    );
  }
}
