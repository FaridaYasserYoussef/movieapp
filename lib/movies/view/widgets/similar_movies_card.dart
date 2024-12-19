import 'package:flutter/material.dart';
import 'package:movieapp/movies/model/data_models/movie_card_model.dart';
import 'package:movieapp/movies/model/data_models/movie_search/Results.dart';
import 'package:movieapp/movies/model/data_models/similar_movies/similar_movies_model.dart';
import 'package:movieapp/watch_list/model/data_models/watch_list_movie_model.dart';
import 'package:movieapp/watch_list/view/Widgets/customBookmarkWidget.dart';
import 'package:movieapp/watch_list/view_model/watch_list_cubit.dart';

import '../../../common/constants.dart';
import '../../../home/view/widget/custom_button.dart';
import '../screens/movie_details_screen.dart';

class SimilarMoviesCard extends StatelessWidget {
  final MovieCardModel movieCardModel;
  const SimilarMoviesCard({
    super.key,
    required this.movieCardModel,
  });

  @override
  Widget build(BuildContext context) {
    SimilarMoviesModel? similarMoviesModel =
        movieCardModel.movieProvider?.similarMoviesModel;
    int? index = movieCardModel.index;
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MovieDetailsScreen(
              movieId: similarMoviesModel.results![index].id,
            ),
          ),
        );
      },
      child: SizedBox(
        width: 120,
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          elevation: 5,
          margin: const EdgeInsets.symmetric(vertical: 10),
          color: const Color(0xFF343534),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              similarMoviesModel?.results?[index!].backdropPath != null
                  ? Expanded(
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          Image.network(
                            fit: BoxFit.fill,
                            '${AppConst.imagebaseURL}${similarMoviesModel?.results?[index!].backdropPath}',
                          ),
                          Positioned(
                              top: -8, left: -13, child: CustomBookMarkWidget())
                          // Align(
                          //   alignment: Alignment.topLeft,
                          //   child: IconButton(
                          //     padding: EdgeInsets.zero,
                          //     onPressed: () {},
                          //     icon: Stack(
                          //       alignment: Alignment.center,
                          //       children: [
                          //         Icon(
                          //           Icons.bookmark_rounded,
                          //           size: 50,
                          //           color: Colors.grey.withOpacity(0.6),
                          //         ),
                          //         const Icon(
                          //           Icons.add,
                          //           size: 20,
                          //           color: Colors.white,
                          //         ),
                          //       ],
                          //     ),
                          //   ),
                          // )
                        ],
                      ),
                    )
                  : Expanded(
                      child: Stack(
                        children: [
                          Container(),
                          CustomButton(onPressed: () {})
                          // Align(
                          //   alignment: Alignment.topLeft,
                          //   child: IconButton(
                          //     padding: EdgeInsets.zero,
                          //     onPressed: () {},
                          //     icon: Stack(
                          //       alignment: Alignment.center,
                          //       children: [
                          //         Icon(
                          //           Icons.bookmark_rounded,
                          //           size: 50,
                          //           color: Colors.grey.withOpacity(0.6),
                          //         ),
                          //         const Icon(
                          //           Icons.add,
                          //           size: 20,
                          //           color: Colors.white,
                          //         ),
                          //       ],
                          //     ),
                          //   ),
                          // ),
                        ],
                      ),
                    ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: SizedBox(
                    width: 100,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Icon(
                              Icons.star_rounded,
                              color: Color(0xFFFFBB3B),
                              size: 20,
                            ),
                            Text(
                              similarMoviesModel!.results![index!].voteAverage
                                  .toString(),
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          '${similarMoviesModel.results![index].title}',
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(color: Colors.white),
                          maxLines: 2,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              similarMoviesModel
                                      .results![index].releaseDate!.isNotEmpty
                                  ? '${DateTime.parse(similarMoviesModel.results![index].releaseDate!).year}'
                                  : '',
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                            similarMoviesModel.results![index].adult!
                                ? Container(
                                    margin: const EdgeInsets.symmetric(
                                      horizontal: 5,
                                    ),
                                    child: Text(
                                      'PG-13',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall,
                                    ),
                                  )
                                : const SizedBox(
                                    width: 10,
                                  ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
