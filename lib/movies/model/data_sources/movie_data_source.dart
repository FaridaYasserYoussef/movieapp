import '../data_models/movie_details/movie_details_model.dart';
import '../data_models/movie_search/movie_search_model.dart';
import '../data_models/similar_movies/similar_movies_model.dart';

abstract class MovieDataSource {
  Future<MovieDetailsModel> getMovieDetails(int movieId);
  Future<SimilarMoviesModel> getSimilarMovies(int movieId);
  Future<MovieSearchModel> getSearchedMovie(String movieName);
}
