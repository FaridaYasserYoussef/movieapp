import 'package:flutter/material.dart';
import 'package:movieapp/common/Appcolors.dart';
import 'package:movieapp/home/model/data_models/popular_model.dart';
import 'package:movieapp/home/view/widget/custom_button.dart';
import 'package:movieapp/movies/view/screens/movie_details_screen.dart';

// ignore: must_be_immutable
class TopCard extends StatelessWidget {
  TopCard({super.key, required this.resultsPopular});
  ResultsPopular? resultsPopular;
  @override
  Widget build(BuildContext context) {
    final String? textDate = resultsPopular!.releaseDate;
    return Column(
      children: [
        Column(
          children: [
            SizedBox(
              height: 201,
              child: Stack(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              MovieDetailsScreen(movieId: resultsPopular!.id),
                        ),
                      );
                    },
                    child: Container(
                      width: 600,
                      height: 170,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                        fit: BoxFit.fill,
                        image: NetworkImage(
                            'https://image.tmdb.org/t/p/w500${resultsPopular!.posterPath ?? ''}'),
                      )),
                    ),
                  ),
                  Center(
                    child: IconButton(
                      color: const Color.fromARGB(255, 42, 38, 38),
                      iconSize: 60,
                      icon: Icon(
                        Icons.play_circle_fill_outlined,
                        color: Colors.white,
                      ),
                      onPressed: () {},
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Stack(
                      alignment: Alignment.bottomLeft,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MovieDetailsScreen(
                                    movieId: resultsPopular!.id),
                              ),
                            );
                          },
                          child: Container(
                            child: Image.network(
                                'https://image.tmdb.org/t/p/w500${resultsPopular!.posterPath ?? ''}'),
                            width: 80,
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Stack(
                            children: [
                              Icon(
                                Icons.bookmark,
                                color: AppColor.opacityGrayColor,
                                size: 36,
                              ),
                              IconButton(
                                alignment: Alignment.bottomLeft,
                                onPressed: () {},
                                icon: Icon(Icons.add),
                                iconSize: 20,
                                color: Colors.white,
                              ),
                              CustomButton(
                                onPressed: () {},
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Positioned(
                      left: 100,
                      bottom: 15,
                      child: Text(
                        resultsPopular!.title ?? '',
                        style: Theme.of(context).textTheme.titleMedium,
                      )),
                  Positioned(
                    left: 100,
                    bottom: -1,
                    child: Text(
                      textDate!.length > 4
                          ? '${textDate.substring(0, 4)}'
                          : textDate,
                      style: Theme.of(context)
                          .textTheme
                          .labelSmall!
                          .copyWith(color: Colors.white),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

// Align(
//                   alignment: Alignment.bottomCenter,
//                   child: Text(
//                     resultsPopular!.releaseDate ?? '',
//                     style: TextStyle(color: Colors.white),
//                   ),
//                 ),

//                 Align(
//                   alignment: Alignment.bottomCenter,
//                   child: Padding(
//                     padding: EdgeInsets.all(13),
//                     child: Text(
//                       resultsPopular!.title ?? '',
//                       style: TextStyle(color: Colors.white),
//                     ),
//                   ),
//                 ),
