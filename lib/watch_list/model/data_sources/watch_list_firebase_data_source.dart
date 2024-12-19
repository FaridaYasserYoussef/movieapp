import 'package:movieapp/authentication/model/data_sources/user_firebase_data_sources.dart';
import 'package:movieapp/watch_list/model/data_models/watch_list_movie_model.dart';
import 'package:movieapp/watch_list/model/data_sources/watch_list_data_source.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class WatchListFirebaseDataSource extends WatchListDataSource{
  @override
  Future addToWatchList(WatchListMovieModel movie) async{
    DocumentReference<WatchListMovieModel> movieDocumentReference = getwatchListMoviesCollection().doc(movie.id);
    // movie.id = movieDocumentReference.id;
    await movieDocumentReference.set(movie);
  }

  CollectionReference<WatchListMovieModel> getwatchListMoviesCollection(){
    return UserFirebaseDataSource.getUserCollection().doc(FirebaseAuth.instance.currentUser!.uid)
    .collection("movies")
    .withConverter<WatchListMovieModel>(fromFirestore: (snapshot, _)=>WatchListMovieModel.fromJson(snapshot.data() ?? {}), 
    toFirestore: (value, _) => value.toJson());
  }

  @override
  Stream<List<WatchListMovieModel>> getWatchListMovies() async*{
   Stream<QuerySnapshot<WatchListMovieModel>> watchlistMoviesQuerySnapshot = getwatchListMoviesCollection().snapshots();
   var data = watchlistMoviesQuerySnapshot.map((event) => event.docs.map((e) => e.data()).toList());
   yield* data;
  }

  @override
  Future removeFromWatchList(String id) async{
    await getwatchListMoviesCollection().doc(id).delete();
  }

}