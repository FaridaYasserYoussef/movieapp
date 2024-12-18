import 'package:flutter/material.dart';
import 'package:movieapp/common/constants.dart';
import 'package:movieapp/movies/model/data_models/movie_card_model.dart';
import 'package:movieapp/movies/view/widgets/similar_movies_card.dart';
import 'package:movieapp/movies/view_model/movie_provider.dart';
import 'package:provider/provider.dart';

import '../widgets/genres_tag.dart';

class MovieDetailsScreen extends StatefulWidget {
  static const routeName = "/movieDetails";
  final int? movieId;
  const MovieDetailsScreen({
    super.key,
    required this.movieId,
  });

  @override
  State<MovieDetailsScreen> createState() => _MovieDetailsScreenState();
}

class _MovieDetailsScreenState extends State<MovieDetailsScreen> {
  late MovieProvider movieProvider;
  @override
  void initState() {
    super.initState();
    movieProvider = MovieProvider();
    movieProvider.getMovieDetails(widget.movieId!);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => movieProvider,
      child: Consumer<MovieProvider>(
        builder: (_, value, child) {
          if (value.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (value.errorMessage != null) {
            return Text(
              value.errorMessage.toString(),
              style: TextStyle(fontSize: 20, color: Colors.white),
            );
          } else {
            int movieDurationHours = value.movieDetailsModel!.runtime! ~/ 60;
            int movieDurationMinutes = value.movieDetailsModel!.runtime! % 60;
            return Scaffold(
              appBar: AppBar(
                leading: IconButton(
                  icon: Icon(Icons.arrow_back_rounded),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                title: Text(
                  '${value.movieDetailsModel?.title}',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              body: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    value.movieDetailsModel!.backdropPath != null
                        ? Image.network(
                            '${AppConst.imagebaseURL}${value.movieDetailsModel?.backdropPath}')
                        : SizedBox(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${value.movieDetailsModel?.title}',
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              SizedBox(
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      '${DateTime.parse(value.movieDetailsModel!.releaseDate!).year}',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall,
                                    ),
                                    value.movieDetailsModel!.adult!
                                        ? Container(
                                            margin: EdgeInsets.symmetric(
                                                horizontal: 5),
                                            child: Text(
                                              'PG-13',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleSmall,
                                            ),
                                          )
                                        : SizedBox(
                                            width: 10,
                                          ),
                                    Text(
                                      '${movieDurationHours}h ${movieDurationMinutes}m',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall,
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: Stack(
                                        children: [
                                          Image.network(
                                            '${AppConst.imagebaseURL}${value.movieDetailsModel?.posterPath}',
                                          ),
                                          IconButton(
                                            padding: EdgeInsets.zero,
                                            onPressed: () {},
                                            icon: Stack(
                                              alignment: Alignment.center,
                                              children: [
                                                Icon(
                                                  Icons.bookmark_rounded,
                                                  size: 50,
                                                  color: Colors.grey
                                                      .withOpacity(0.6),
                                                ),
                                                const Icon(
                                                  Icons.add,
                                                  size: 20,
                                                  color: Colors.white,
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      flex: 3,
                                      child: Column(
                                        children: [
                                          GridView.builder(
                                            gridDelegate:
                                                const SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount:
                                                  2, // Number of columns
                                              crossAxisSpacing:
                                                  15.0, // Horizontal spacing
                                              mainAxisSpacing:
                                                  5.0, // Vertical spacing
                                              childAspectRatio:
                                                  3, // Adjust button width/height ratio
                                            ),
                                            itemCount: value.movieDetailsModel!
                                                .genres!.length,
                                            shrinkWrap:
                                                true, // Wrap grid content
                                            itemBuilder: (context, index) {
                                              return GenresTags(
                                                  title: value
                                                      .movieDetailsModel!
                                                      .genres![index]
                                                      .name!);
                                            },
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            maxLines: 4,
                                            value.movieDetailsModel!.overview!,
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleSmall,
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            children: [
                                              const Icon(
                                                Icons.star_rounded,
                                                color: Color(0xFFFFBB3B),
                                                size: 30,
                                              ),
                                              Text(
                                                value.movieDetailsModel!
                                                    .voteAverage
                                                    .toString(),
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .titleMedium,
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20),
                          decoration: BoxDecoration(color: Color(0xFF282A28)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'More Like This',
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.3,
                                child: ListView.separated(
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return SimilarMoviesCard(
                                      movieCardModel: MovieCardModel(
                                          movieProvider: value, index: index),
                                    );
                                  },
                                  itemCount:
                                      value.similarMoviesModel!.results!.length,
                                  separatorBuilder:
                                      (BuildContext context, int index) {
                                    return SizedBox(
                                      width: 20,
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
