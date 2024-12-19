import 'package:flutter/material.dart';
import 'package:movieapp/common/Appcolors.dart';
import 'package:movieapp/home/model/data_models/popular_model.dart';
import 'package:movieapp/home/view/widget/custom_button.dart';
import 'package:movieapp/movies/view/screens/movie_details_screen.dart';
import 'package:movieapp/watch_list/model/data_models/watch_list_movie_model.dart';
import 'package:movieapp/watch_list/view/Widgets/customBookmarkWidget.dart';
import 'package:movieapp/watch_list/view_model/watch_list_cubit.dart';

// ignore: must_be_immutable
class TopCard extends StatelessWidget {
  TopCard({super.key, required this.resultsPopular});
  ResultsPopular? resultsPopular;
  @override
  Widget build(BuildContext context) {
    int dateString = 2024 - 10 - 22;
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
                        onPressed: () {}),
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
                          child: Align(
                            alignment: Alignment.bottomLeft,
                            child: Container(
                              child: Image.network(
                                  'https://image.tmdb.org/t/p/w500${resultsPopular!.posterPath ?? ''}'),
                              width: 80,
                            ),
                          ),
                        ),
                        Positioned(
                          top: 70,
                          left: -14,
                          child: CustomBookMarkWidget(
                            onTap: () async {
                              WatchListCubit watchListCubit = WatchListCubit();
                              // await watchListCubit.removeFromWatchList(resultsPopular!.id.toString());

                              await watchListCubit.addToWatchList(
                                  WatchListMovieModel(
                                      artists: resultsPopular!.title ?? '',
                                      id: resultsPopular!.id.toString(),
                                      movieName: resultsPopular!.title ?? '',
                                      year: textDate != null
                                          ? int.tryParse(textDate.split('-')[0])
                                          : null,
                                      imageUrl:
                                          'https://image.tmdb.org/t/p/w500${resultsPopular!.posterPath ?? ''}'));
                            },
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




// import 'package:flutter/material.dart';
// import 'package:movieapp/home/model/data_models/popular_model.dart';
// import 'package:movieapp/movies/view/screens/movie_details_screen.dart';
// import 'package:movieapp/watch_list/model/data_models/watch_list_movie_model.dart';
// import 'package:movieapp/watch_list/view/Widgets/customBookmarkWidget.dart';
// import 'package:movieapp/watch_list/view_model/watch_list_cubit.dart';

// // ignore: must_be_immutable
// class TopCard extends StatelessWidget {
//   TopCard({super.key, required this.resultsPopular});
//   ResultsPopular? resultsPopular;
//   @override
//   Widget build(BuildContext context) {
//     final String? textDate = resultsPopular!.releaseDate;
//     return Column(
//       children: [
//         Column(children: [
//           SizedBox(
//               height: 201,
//               child: Stack(
//                 children: [
//                   GestureDetector(
//                     onTap: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) =>
//                               MovieDetailsScreen(movieId: resultsPopular!.id),
//                         ),
//                       );
//                     },
//                     child: Container(
//                       width: 600,
//                       height: 170,
//                       decoration: BoxDecoration(
//                           image: DecorationImage(
//                         fit: BoxFit.fill,
//                         image: NetworkImage(
//                             'https://image.tmdb.org/t/p/w500${resultsPopular!.posterPath ?? ''}'),
//                       )),
//                     ),
//                   ),
//                   Center(
//                     child: IconButton(
//                       color: const Color.fromARGB(255, 42, 38, 38),
//                       iconSize: 60,
//                       icon: Icon(
//                         Icons.play_circle_fill_outlined,
//                         color: Colors.white,
//                       ),
//                       onPressed: () {},
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(left: 10),
//                     child: Stack(
//                       alignment: Alignment.bottomLeft,
//                       children: [
//                         GestureDetector(
//                           onTap: () {
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (context) => MovieDetailsScreen(
//                                     movieId: resultsPopular!.id),
//                               ),
//                             );
//                           },
//                           child: Container(
//                             child: Image.network(
//                                 'https://image.tmdb.org/t/p/w500${resultsPopular!.posterPath ?? ''}'),
//                             width: 80,
//                           ),
//                         ),
//                         Align(
//                           alignment: Alignment.centerLeft,
//                           child: CustomBookMarkWidget(onTap: () async {
//                             WatchListCubit watchListCubit = WatchListCubit();
//                             // await watchListCubit.removeFromWatchList(resultsPopular!.id.toString());

//                             await watchListCubit.addToWatchList(WatchListMovieModel(
//                                 id: resultsPopular!.id.toString(),
//                                 movieName: resultsPopular!.title ?? '',
//                                 year: 100,
//                                 imageUrl:
//                                     'https://image.tmdb.org/t/p/w500${resultsPopular!.posterPath ?? ''}'));
//                           }),
//                         )
//                       ],
//                     ),
//                   ),
//                 ],
//               ))
//         ]),
//       ],
//     );
//   }
// }







// import 'package:flutter/material.dart';
// import 'package:movieapp/common/Appcolors.dart';
// import 'package:movieapp/home/model/data_models/popular_model.dart';
// import 'package:movieapp/home/view/widget/custom_button.dart';
// import 'package:movieapp/movies/view/screens/movie_details_screen.dart';
// import 'package:movieapp/watch_list/model/data_models/watch_list_movie_model.dart';
// import 'package:movieapp/watch_list/view_model/watch_list_cubit.dart';

// // ignore: must_be_immutable
// class TopCard extends StatefulWidget {
//   TopCard({super.key, required this.resultsPopular});
//   ResultsPopular? resultsPopular;

//   @override
//   State<TopCard> createState() => _TopCardState();
// }

// class _TopCardState extends State<TopCard> {
//   @override
//   bool iscleck = false;
//   Widget build(BuildContext context) {
//     final String? textDate = widget.resultsPopular!.releaseDate;
//     return Column(
//       children: [
//         Column(
//           children: [
//             SizedBox(
//               height: 201,
//               child: Stack(
//                 children: [
//                   GestureDetector(
//                     onTap: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => MovieDetailsScreen(
//                               movieId: widget.resultsPopular!.id),
//                         ),
//                       );
//                     },
//                     child: Container(
//                       width: 600,
//                       height: 170,
//                       decoration: BoxDecoration(
//                           image: DecorationImage(
//                         fit: BoxFit.fill,
//                         image: NetworkImage(
//                             'https://image.tmdb.org/t/p/w500${widget.resultsPopular!.posterPath ?? ''}'),
//                       )),
//                     ),
//                   ),
//                   Center(
//                     child: IconButton(
//                       color: const Color.fromARGB(255, 42, 38, 38),
//                       iconSize: 60,
//                       icon: Icon(
//                         Icons.play_circle_fill_outlined,
//                         color: Colors.white,
//                       ),
//                       onPressed: () {},
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(left: 10),
//                     child: Stack(
//                       alignment: Alignment.bottomLeft,
//                       children: [
//                         GestureDetector(
//                           onTap: () {
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (context) => MovieDetailsScreen(
//                                     movieId: widget.resultsPopular!.id),
//                               ),
//                             );
//                           },
//                           child: Container(
//                             child: Image.network(
//                                 'https://image.tmdb.org/t/p/w500${widget.resultsPopular!.posterPath ?? ''}'),
//                             width: 80,
//                           ),
//                         ),
//                         Align(
//                           alignment: Alignment.centerLeft,
//                           child: Stack(
//                             children: [
//                               // Icon(
//                               //   Icons.bookmark,
//                               //   color: AppColor.opacityGrayColor,
//                               //   size: 36,
//                               // ),
//                               IconButton(
//                                 alignment: Alignment.bottomLeft,
//                                 onPressed: () async {
//                                   WatchListCubit watchListCubit =
//                                       WatchListCubit();
//                                   await watchListCubit.addToWatchList(
//                                       WatchListMovieModel(
//                                           id: widget.resultsPopular!.id
//                                               .toString(),
//                                           movieName:
//                                               widget.resultsPopular!.title ??
//                                                   '',
//                                           year: 100,
//                                           imageUrl:
//                                               'https://image.tmdb.org/t/p/w500${widget.resultsPopular!.posterPath ?? ''}'));
//                                 },
//                                 icon: Icon(Icons.add),
//                                 iconSize: 20,
//                                 color: Colors.white,
//                               ),
//                               // CustomButton(
//                               //   onPressed: () async {
//                               //     WatchListCubit watchListCubit =
//                               //         WatchListCubit();
//                               //     await watchListCubit.addToWatchList(
//                               //         WatchListMovieModel(
//                               //             id: resultsPopular!.id.toString(),
//                               //             movieName:
//                               //                 resultsPopular!.title ?? '',
//                               //             year: 100 //int.parse(
//                               //             //     resultsPopular!.releaseDate ??
//                               //             //         '')
//                               //             ,
//                               //             imageUrl:
//                               //                 'https://image.tmdb.org/t/p/w500${resultsPopular!.posterPath ?? ''}'));
//                               //   },
//                               // )
//                             ],
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//                   Positioned(
//                       left: 100,
//                       bottom: 15,
//                       child: Text(
//                         widget.resultsPopular!.title ?? '',
//                         style: Theme.of(context).textTheme.titleMedium,
//                       )),
//                   Positioned(
//                     left: 100,
//                     bottom: -1,
//                     child: Text(
//                       textDate!.length > 4
//                           ? '${textDate.substring(0, 4)}'
//                           : textDate,
//                       style: Theme.of(context)
//                           .textTheme
//                           .labelSmall!
//                           .copyWith(color: AppColor.DateColor)
//                           .copyWith(color: Colors.white),
//                     ),
//                   )
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ],
//     );
//   }
// }

// // Align(
// //                   alignment: Alignment.bottomCenter,
// //                   child: Text(
// //                     resultsPopular!.releaseDate ?? '',
// //                     style: TextStyle(color: Colors.white),
// //                   ),
// //                 ),

// //                 Align(
// //                   alignment: Alignment.bottomCenter,
// //                   child: Padding(
// //                     padding: EdgeInsets.all(13),
// //                     child: Text(
// //                       resultsPopular!.title ?? '',
// //                       style: TextStyle(color: Colors.white),
// //                     ),
// //                   ),
// //                 ),
