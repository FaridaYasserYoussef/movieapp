import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp/watch_list/view/Widgets/watchListItemWidget.dart';
import 'package:movieapp/watch_list/view_model/watch_list_cubit.dart';
import 'package:movieapp/watch_list/view_model/watch_list_states.dart';

class WatchListScreen extends StatefulWidget {
  const WatchListScreen({super.key});
  static const routeName = "/watchlist";

  @override
  State<WatchListScreen> createState() => _WatchListScreenState();
}

class _WatchListScreenState extends State<WatchListScreen> {
  late WatchListCubit watchListCubit;

  @override
  void initState() {
    super.initState();
    // TODO: implement initState
    watchListCubit = WatchListCubit();
    watchListCubit.getWatchListMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1E1E1E),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 25, left: 10),
              child: Text(
                "Watchlist",
                style: TextStyle(color: Colors.white, fontSize: 22),
              ),
            ),
            BlocProvider(create: (BuildContext context) {
              return watchListCubit;
            }, child: BlocBuilder<WatchListCubit, WatchListState>(
                builder: (context, state) {
              if (state is WatchListLoadingState) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is GetMoviesSuccessState) {
                // print(state.watchListMovies[0].id);
                // print(state.watchListMovies[0].artists);
                // print(state.watchListMovies[0].imageUrl);
                // print(state.watchListMovies[0].movieName);
                // print(state.watchListMovies[0].year);

                if (state.watchListMovies.isEmpty) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 200),
                    child: Center(
                        child: Text(
                      "No Movies in Watch list",
                      style: TextStyle(color: Colors.white),
                    )),
                  );
                }
                return Expanded(
                    child: Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: ListView.separated(
                      itemBuilder: (context, index) {
                        return WatchListItem(
                            movieModel: state.watchListMovies[index]);
                      },
                      separatorBuilder: (context, index) =>
                          Divider(color: Colors.white),
                      itemCount: state.watchListMovies.length),
                ));
              } else if (state is WatchListErrorState) {
                return Center(
                  child: Text(
                    state.errorMessage,
                    style: TextStyle(color: Colors.red),
                  ),
                );
              } else {
                return SizedBox.shrink();
              }
            })),
          ],
        ),
      ),
    );
  }
}
