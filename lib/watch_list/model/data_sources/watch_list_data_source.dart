import 'package:movieapp/watch_list/model/data_models/watch_list_movie_model.dart';

abstract class WatchListDataSource{
  Stream<List<WatchListMovieModel>> getWatchListMovies();
  Future addToWatchList(WatchListMovieModel movie);
  Future removeFromWatchList(String id);
}