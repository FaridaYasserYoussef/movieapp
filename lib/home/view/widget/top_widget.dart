import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movieapp/home/model/data_models/popular_model.dart';
import 'package:movieapp/home/model/data_sources/DataSource.dart';
import 'package:movieapp/home/view/widget/Top_card.dart';
class TopWidget extends StatelessWidget {
  TopWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: DataSource.getPopular(),
        builder: (context, snapshot) {
          if (ConnectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Erorrr'),
            );
          } else if (snapshot.hasData) {
            PopularModel? popularModel = snapshot.data;
            var popularList = popularModel?.results;
            return Column(
              children: [
                Container(
                    child: CarouselSlider.builder(
                  itemCount: popularList!.length,
                  itemBuilder: ((context, index, realIndex) {
                    return TopCard(resultsPopular: popularList[index]);
                  }),
                  options: CarouselOptions(
                      initialPage: 0,
                      autoPlay: true,
                      autoPlayInterval: Duration(seconds: 2)),
                )),
                // Text(
                //   'Dora and the lost city of gold',
                //   style: TextStyle(color: Colors.white),
                // ),
                // Text('2019  PG-13  2h 7m', style: TextStyle(color: Colors.white)),
                SizedBox(
                  height: 10,
                ),
                // MiddleWidget(),
                // SizedBox(
                //   height: 10,
                // ),
                // bottonWidget()
              ],
            );
          }
          return Container();
        });
  }
}
