import 'package:dio/dio.dart';
import 'package:movieapp/movies/model/data_models/movie_details/movie_details_model.dart';
import 'package:movieapp/movies/model/data_models/movie_search/movie_search_model.dart';
import 'package:movieapp/movies/model/data_models/similar_movies/similar_movies_model.dart';
import 'package:movieapp/movies/model/data_sources/movie_data_source.dart';

class MovieApiDataSource extends MovieDataSource {
  final dio = Dio();

  @override
  Future<MovieDetailsModel> getMovieDetails(int movieId) async {
    final response = await dio.get(
      'https://api.themoviedb.org/3/movie/$movieId?language=en-US',
      options: Options(
        headers: {
          'Authorization':
              'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIzODgxOTJmZTBhNWJiZTgyMmEwNDVkNmYzNDQwNWFmOSIsIm5iZiI6MTczMjk5MzM1Ny43NTYsInN1YiI6IjY3NGI2MTRkNjE1ZDNhM2I0MWI3MTVlOSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.x8tr6SZHHhNhvxyjdxoDL11ytip9KvsyJEz70V-avRI'
        },
      ),
    );
    MovieDetailsModel movieDetailsModel =
        MovieDetailsModel.fromJson(response.data);
    return movieDetailsModel;
  }

  @override
  Future<SimilarMoviesModel> getSimilarMovies(int movieId) async {
    final response = await dio.get(
      'https://api.themoviedb.org/3/movie/$movieId/similar?language=en-US',
      options: Options(
        headers: {
          'Authorization':
              'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIzODgxOTJmZTBhNWJiZTgyMmEwNDVkNmYzNDQwNWFmOSIsIm5iZiI6MTczMjk5MzM1Ny43NTYsInN1YiI6IjY3NGI2MTRkNjE1ZDNhM2I0MWI3MTVlOSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.x8tr6SZHHhNhvxyjdxoDL11ytip9KvsyJEz70V-avRI'
        },
      ),
    );
    SimilarMoviesModel similarMoviesModel =
        SimilarMoviesModel.fromJson(response.data);
    return similarMoviesModel;
  }

  @override
  Future<MovieSearchModel> getSearchedMovie(String movieName) async {
    final response = await dio.get(
      'https://api.themoviedb.org/3/search/movie?query=$movieName&include_adult=false&language=en-US&page=1',
      options: Options(
        headers: {
          'Authorization':
              'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIzODgxOTJmZTBhNWJiZTgyMmEwNDVkNmYzNDQwNWFmOSIsIm5iZiI6MTczMjk5MzM1Ny43NTYsInN1YiI6IjY3NGI2MTRkNjE1ZDNhM2I0MWI3MTVlOSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.x8tr6SZHHhNhvxyjdxoDL11ytip9KvsyJEz70V-avRI'
        },
      ),
    );
    MovieSearchModel movieSearchModel =
        MovieSearchModel.fromJson(response.data);
    return movieSearchModel;
  }
}
