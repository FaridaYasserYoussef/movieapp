import 'package:movieapp/movies/model/data_sources/movie_api_data_source.dart';
import 'package:movieapp/movies/model/data_sources/movie_data_source.dart';

class ServiceLocator {
  static MovieDataSource movieDataSource = MovieApiDataSource();
}
