import 'package:movieapp/watch_list/model/data_models/watch_list_movie_model.dart';
import 'package:movieapp/watch_list/model/data_sources/watch_list_data_source.dart';

class WatchListRepository{
  final WatchListDataSource dataSource;

  WatchListRepository({required this.dataSource});

  Stream<List<WatchListMovieModel>> getWatchListMovies()async*{
      yield* dataSource.getWatchListMovies();

  }
  Future addToWatchList(WatchListMovieModel movie)async{
    return await dataSource.addToWatchList(movie);


  }
  Future removeFromWatchList(String id)async{
    return await dataSource.removeFromWatchList(id);

  }
}