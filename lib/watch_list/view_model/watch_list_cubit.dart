import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp/common/serviceLocator.dart';
import 'package:movieapp/watch_list/model/data_models/watch_list_movie_model.dart';
import 'package:movieapp/watch_list/repository/watch_list_repository.dart';
import 'package:movieapp/watch_list/view_model/watch_list_states.dart';

class WatchListCubit extends Cubit<WatchListState>{
  WatchListRepository watchListrepository;
  WatchListCubit(): watchListrepository = WatchListRepository(dataSource: ServiceLocator.currentWatchListDataSource), super(WatchListInitialState());

  Future addToWatchList(WatchListMovieModel movie) async{
    try{
      emit(WatchListLoadingState());
    await watchListrepository.addToWatchList(movie);
    emit(AddMovieSuccessState(successMessage: "Movie added successfuly to watchlist"));
    }catch(errorMessage){
      emit(WatchListErrorState(errorMessage: errorMessage.toString()));
    }

  }

  Future<void> getWatchListMovies() async {
  try {
    emit(WatchListLoadingState());

    // Listen to the stream and fetch the movies
    await for (var listOfMovies in watchListrepository.getWatchListMovies()) {
      emit(GetMoviesSuccessState(watchListMovies: listOfMovies));
    }
  } catch (errorMessage) {
    emit(WatchListErrorState(errorMessage: errorMessage.toString()));
  }
}

   Future removeFromWatchList(String id)async{
   try{
      emit(WatchListLoadingState());
   await watchListrepository.removeFromWatchList(id);
    emit(RemoveMovieSuccessState(successMessage: "Movie removed Successfully from watchlist"));
    }catch(errorMessage){
      emit(WatchListErrorState(errorMessage: errorMessage.toString()));
    }
  }
  
}