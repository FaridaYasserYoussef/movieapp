import 'package:flutter/material.dart';
import 'package:movieapp/common/App_color.dart';
import 'package:movieapp/home/model/data_models/popular_model.dart';

class TopCard extends StatelessWidget {
  TopCard({super.key, required this.resultsPopular});
  ResultsPopular? resultsPopular;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: [
            SizedBox(
              height: 200,
              child: Stack(
                children: [
                  Container(
                    height: 170,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          'https://image.tmdb.org/t/p/w500${resultsPopular!.posterPath ?? ''}'),
                    )),
                  ),
                  Center(
                    child: IconButton(
                      color: const Color.fromARGB(255, 42, 38, 38),
                      iconSize: 60,
                      icon: Icon(Icons.play_circle_fill_outlined),
                      onPressed: () {},
                    ),
                  ),
                  Stack(
                    alignment: Alignment.bottomLeft,
                    children: [
                      Container(
                        child: Image.network(
                            'https://image.tmdb.org/t/p/w500${resultsPopular!.posterPath ?? ''}'),
                        height: 120,
                        width: 80,
                      ),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Stack(children: [
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
                            )
                          ]))
                    ],
                  ),
                  Center(
                      // child: Column(
                      //   mainAxisAlignment: MainAxisAlignment.end,
                      //   children: [
                      //     Text(
                      //       resultsPopular!.originalTitle ?? '',
                      //       style: TextStyle(color: Colors.white),
                      //     ),
                      //     Text(resultsPopular!.releaseDate ?? '',
                      //         style: TextStyle(color: Colors.white)),
                      //   ],
                      // ),
                      )

                  // Text(resultsPopular!.releaseDate ?? '',
                  //     style: TextStyle(color: Colors.white)),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}




// class TopCard extends StatelessWidget {
//   TopCard({super.key, required this.resultsPopular});
//   ResultsPopular? resultsPopular;
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         // Featured Movie Section
//         Stack(
//           children: [
//             // Background Image
//             Container(
//               height: 300,
//               decoration: BoxDecoration(
//                 image: DecorationImage(
//                   image: NetworkImage(
//                       'https://image.tmdb.org/t/p/w500${resultsPopular!.posterPath ?? ''}'),
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ),
//             // Gradient Overlay
//             Container(
//               height: 300,
//               decoration: BoxDecoration(
//                 gradient: LinearGradient(
//                   colors: [
//                     Colors.black.withOpacity(0.8),
//                     Colors.transparent,
//                   ],
//                   begin: Alignment.bottomCenter,
//                   end: Alignment.topCenter,
//                 ),
//               ),
//             ),
//             // Play Button and Details
//             Positioned(
//               bottom: 20,
//               left: 20,
//               child: Row(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   // Play Button
//                   ElevatedButton(
//                     onPressed: () {},
//                     style: ElevatedButton.styleFrom(
//                       shape: const CircleBorder(),
//                       padding: const EdgeInsets.all(12),
//                       primary: Colors.white,
//                     ),
//                     child: const Icon(
//                       Icons.play_arrow,
//                       color: Colors.black,
//                       size: 30,
//                     ),
//                   ),
//                   const SizedBox(width: 10),
//                   // Movie Title
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: const [
//                       Text(
//                         "Dora and the Lost City of Gold",
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 18,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       SizedBox(height: 5),
//                       Text(
//                         "2019  PG-13  2h 7m",
//                         style: TextStyle(
//                           color: Colors.white70,
//                           fontSize: 14,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//         const SizedBox(height: 20),

//         // New Releases Section
//         Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 10),
//           child: const Text(
//             "New Releases",
//             style: TextStyle(
//               color: Colors.white,
//               fontSize: 20,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         ),
//         const SizedBox(height: 10),
//         // Movie Thumbnails
//         SingleChildScrollView(
//           scrollDirection: Axis.horizontal,
//           child: Row(
//             children: List.generate(
//               5,
//               (index) => Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 5),
//                 child: ClipRRect(
//                   borderRadius: BorderRadius.circular(10),
//                   child: Image.network(
//                     'https://image.tmdb.org/t/p/w500${resultsPopular!.posterPath ?? ''}',
//                     width: 100,
//                     height: 150,
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
