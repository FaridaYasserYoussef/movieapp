import 'package:flutter/cupertino.dart';
import 'package:movieapp/common/service_locator.dart';
import 'package:movieapp/movies/model/data_models/movie_details/movie_details_model.dart';
import 'package:movieapp/movies/model/data_models/movie_search/movie_search_model.dart';
import 'package:movieapp/movies/model/data_models/similar_movies/similar_movies_model.dart';
import 'package:movieapp/movies/repository/movie_repository.dart';

class MovieProvider extends ChangeNotifier {
  MovieRepository movieRepository = MovieRepository(
    ServiceLocator.movieDataSource,
  );
  MovieDetailsModel? movieDetailsModel;
  SimilarMoviesModel? similarMoviesModel;
  MovieSearchModel? movieSearchModel;
  String? errorMessage;
  bool waiting = false;

  Future getMovieDetails(int movieId) async {
    waiting = true;
    notifyListeners();
    try {
      MovieDetailsModel? movieDetails =
          await movieRepository.getMovieDetails(movieId);
      movieDetailsModel = movieDetails;
    } catch (e) {
      errorMessage = e.toString();
    }
    waiting = false;
    getMovieSimilars(movieId);
    notifyListeners();
  }

  Future getMovieSimilars(int movieId) async {
    waiting = true;
    notifyListeners();
    try {
      SimilarMoviesModel? similarMovies =
          await movieRepository.getMovieSimilars(movieId);
      similarMoviesModel = similarMovies;
    } catch (e) {
      errorMessage = e.toString();
    }
    waiting = false;
    notifyListeners();
  }

  Future getSearchedMovie(String movieName) async {
    waiting = true;
    notifyListeners();
    try {
      MovieSearchModel? movieSearch =
          await movieRepository.getSearchedMovie(movieName);
      movieSearchModel = movieSearch;
    } catch (e) {
      errorMessage = e.toString();
    }
    waiting = false;
    notifyListeners();
  }
}
