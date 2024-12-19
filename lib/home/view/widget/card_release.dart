import 'package:flutter/material.dart';
import 'package:movieapp/home/model/data_models/release_model.dart';
import 'package:movieapp/home/view/widget/custom_button.dart';
import 'package:movieapp/watch_list/model/data_models/watch_list_movie_model.dart';
import 'package:movieapp/watch_list/view/Widgets/customBookmarkWidget.dart';
import 'package:movieapp/watch_list/view_model/watch_list_cubit.dart';

import '../../../movies/view/screens/movie_details_screen.dart';

class CardRelease extends StatelessWidget {
  CardRelease({
    super.key,
    required this.releaseModel,
  });
  final ResultsRelease releaseModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Stack(children: [
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(25))),
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      MovieDetailsScreen(movieId: releaseModel.id),
                ),
              );
            },
            child: Image.network(
                "https://image.tmdb.org/t/p/w500/${releaseModel.posterPath ?? ''}"),
          ),
        ),
        Positioned(
          top: -8,
          left: -13,
          child: CustomBookMarkWidget(
            onTap: () async {
              WatchListCubit watchListCubit = WatchListCubit();
              await watchListCubit.addToWatchList(WatchListMovieModel(
                  id: releaseModel.id.toString(),
                  movieName: releaseModel.title ?? '',
                  year: int.tryParse(releaseModel.releaseDate ?? ''),
                  imageUrl:
                      'https://image.tmdb.org/t/p/w500${releaseModel.posterPath ?? ''}'));
            },
          ),
        )
      ]),
    );
  }
}

//   child: Image.network(
//  "https://image.tmdb.org/t/p/w500/${releaseModel.posterPath ?? ''}"),
