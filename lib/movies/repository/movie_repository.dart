import 'package:movieapp/movies/model/data_models/movie_search/movie_search_model.dart';
import 'package:movieapp/movies/model/data_models/similar_movies/similar_movies_model.dart';
import 'package:movieapp/movies/model/data_sources/movie_data_source.dart';

import '../model/data_models/movie_details/movie_details_model.dart';

class MovieRepository {
  final MovieDataSource movieDataSource;
  MovieRepository(this.movieDataSource);
  Future<MovieDetailsModel?> getMovieDetails(int movieId) async {
    MovieDetailsModel? movieDetailsModel =
        await movieDataSource.getMovieDetails(movieId);
    return movieDetailsModel;
  }

  Future<SimilarMoviesModel?> getMovieSimilars(int movieId) async {
    SimilarMoviesModel? similarMoviesModel =
        await movieDataSource.getSimilarMovies(movieId);
    return similarMoviesModel;
  }

  Future<MovieSearchModel?> getSearchedMovie(String movieName) async {
    MovieSearchModel? movieSearchModel =
        await movieDataSource.getSearchedMovie(movieName);
    return movieSearchModel;
  }
}
