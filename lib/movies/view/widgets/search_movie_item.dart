import 'package:flutter/material.dart';
import 'package:movieapp/movies/view/screens/movie_details_screen.dart';

import '../../../common/constants.dart';
import '../../model/data_models/movie_card_model.dart';
import '../../model/data_models/movie_search/Results.dart';

class SearchMovieItem extends StatelessWidget {
  final MovieCardModel movieCardModel;
  const SearchMovieItem({super.key, required this.movieCardModel});

  @override
  Widget build(BuildContext context) {
    List<Results>? movies =
        movieCardModel.movieProvider!.movieSearchModel!.results;
    int? index = movieCardModel.index;
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MovieDetailsScreen(movieId: movies[index].id),
          ),
        );
      },
      child: Row(
        children: [
          Expanded(
            flex: 5,
            child: SizedBox(
              height: 100,
              child: movies![index!].backdropPath != null
                  ? Image.network(
                      '${AppConst.imagebaseURL}/${movies[index].backdropPath}')
                  : const SizedBox(),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            flex: 6,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  maxLines: 2,
                  movies[index].title!,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(fontSize: 16),
                ),
                Text(
                  movies[index].releaseDate!.isNotEmpty
                      ? '${DateTime.parse(movies[index].releaseDate!).year}'
                      : '',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.star_rounded,
                      color: Color(0xFFFFBB3B),
                      size: 20,
                    ),
                    Text(
                      '${movies[index].voteAverage}',
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
