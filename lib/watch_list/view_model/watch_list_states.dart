import 'package:movieapp/watch_list/model/data_models/watch_list_movie_model.dart';

abstract class WatchListState{}
class WatchListInitialState extends WatchListState{}
class WatchListLoadingState extends WatchListState{}
abstract class WatchListSuccessState extends WatchListState{}

class GetMoviesSuccessState extends WatchListSuccessState{
  final List<WatchListMovieModel> watchListMovies;

  GetMoviesSuccessState({required this.watchListMovies});
}

class AddMovieSuccessState extends WatchListSuccessState{
  final String successMessage;

  AddMovieSuccessState({required this.successMessage});
}

class RemoveMovieSuccessState extends WatchListSuccessState{
    final String successMessage;

  RemoveMovieSuccessState({required this.successMessage});

}

class WatchListErrorState extends WatchListState{
 final String errorMessage;

  WatchListErrorState({required this.errorMessage});
}