import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movieapp/common/widget/error_widget.dart';
import 'package:movieapp/common/widget/loading_widget.dart';
import 'package:movieapp/home/view/widget/TopCard.dart';
import 'package:movieapp/home/view_model/popular_provider.dart';
import 'package:provider/provider.dart';

class TopWidget extends StatefulWidget {
  TopWidget({
    super.key,
  });

  @override
  State<TopWidget> createState() => _TopWidgetState();
}

class _TopWidgetState extends State<TopWidget> {
  late PopularProvider topPopularProvider;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    topPopularProvider = PopularProvider();
    topPopularProvider.getPopular();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => topPopularProvider,
      child: Consumer<PopularProvider>(
          builder: (context, value, child) => value.watting
              ? LoadingWidget()
              : value.errorMessage != null
                  ? CustomErrorWidget(errorMessage: value.errorMessage!)
                  : Column(
                      children: [
                        SizedBox(
                            width: 500,
                            child: CarouselSlider.builder(
                              itemCount: value.popularModel!.results!.length,
                              itemBuilder: ((context, index, realIndex) {
                                return TopCard(
                                    resultsPopular:
                                        value.popularModel!.results![index]);
                              }),
                              options: CarouselOptions(
                                  viewportFraction: 1,
                                  initialPage: 0,
                                  autoPlay: true,
                                  autoPlayInterval: Duration(seconds: 2)),
                            )),
                      ],
                    )),
    );
  }
}

// FutureBuilder(
//         future: DataSource.getPopular(),
//         builder: (context, snapshot) {
//           if (ConnectionState == ConnectionState.waiting) {
//             return Center(
//               child: CircularProgressIndicator(),
//             );
//           } else if (snapshot.hasError) {
//             return Center(
//               child: Text('Erorrr'),
//             );
//           } else if (snapshot.hasData) {
//             PopularModel? popularModel = snapshot.data;
//             var popularList = popularModel?.results;
            //  return Column(
            //   children: [
            //     SizedBox(
            //         width: 500,
            //         // height: 150,
            //         child: CarouselSlider.builder(
            //           itemCount: popularList!.length,
            //           itemBuilder: ((context, index, realIndex) {
            //             return TopCard(resultsPopular: popularList[index]);
            //           }),
            //           options: CarouselOptions(
            //               viewportFraction: 1,
            //               // aspectRatio: 16 / 9,
            //               initialPage: 0,
            //               autoPlay: true,
            //               autoPlayInterval: Duration(seconds: 2)),
            //         )),
            //   ],
            // );
//           }
//           return Container();
//         });