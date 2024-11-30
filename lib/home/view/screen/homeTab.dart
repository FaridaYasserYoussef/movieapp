import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:movieapp/home/view/widget/botton_widget.dart';
import 'package:movieapp/home/view/widget/middle_widget.dart';

class CustomHomeTab extends StatelessWidget {
  CustomHomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            child: CarouselSlider.builder(
          itemCount: 10,
          itemBuilder: ((context, index, realIndex) {
            return Stack(
              children: [
                Image.network(
                    'https://mir-s3-cdn-cf.behance.net/project_modules/1400/3ed155138856997.6226c3733c226.png'),
                Center(
                  child: IconButton(
                    color: Colors.white,
                    iconSize: 60,
                    icon: Icon(Icons.play_circle_fill_outlined),
                    onPressed: () {},
                  ),
                ),
              ],
            );
          }),
          options: CarouselOptions(
              initialPage: 0,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 3)),
        )),
        Text(
          'Dora and the lost city of gold',
          style: TextStyle(color: Colors.white),
        ),
        Text('2019  PG-13  2h 7m', style: TextStyle(color: Colors.white)),
        SizedBox(
          height: 10,
        ),
        MiddleWidget(),
        SizedBox(
          height: 10,
        ),
        bottonWidget()
      ],
    );
  }
}

//'https://mir-s3-cdn-cf.behance.net/project_modules/1400/3ed155138856997.6226c3733c226.png'
