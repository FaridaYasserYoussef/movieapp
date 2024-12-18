import 'package:flutter/material.dart';
import 'package:movieapp/movies/model/data_models/movie_card_model.dart';
import 'package:provider/provider.dart';

import '../../view_model/movie_provider.dart';
import '../widgets/custom_search_text_field.dart';
import '../widgets/search_movie_item.dart';

class MovieSearchScreen extends StatefulWidget {
  static const routeName = "movieSearchScreen";
  const MovieSearchScreen({super.key});
  static TextEditingController searchController = TextEditingController();

  @override
  State<MovieSearchScreen> createState() => _MovieSearchScreenState();
}

class _MovieSearchScreenState extends State<MovieSearchScreen> {
  MovieProvider? movieProvider;
  @override
  void initState() {
    super.initState();
    movieProvider = MovieProvider();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
          child: ChangeNotifierProvider(
            create: (BuildContext context) => movieProvider,
            child: Column(
              children: [
                CustomSearchTextField(
                  onChanged: (value) {
                    value = MovieSearchScreen.searchController.value.text;
                    movieProvider!.getSearchedMovie(value);
                  },
                  searchController: MovieSearchScreen.searchController,
                ),
                Consumer<MovieProvider>(
                  builder: (_, value, child) {
                    if (value.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (value.errorMessage != null) {
                      return Text(
                        value.errorMessage.toString(),
                        style:
                            const TextStyle(fontSize: 20, color: Colors.white),
                      );
                    } else if (value.movieSearchModel != null) {
                      return SizedBox(
                        height: MediaQuery.of(context).size.height,
                        child: ListView.separated(
                            itemBuilder: (context, index) {
                              return SearchMovieItem(
                                movieCardModel: MovieCardModel(
                                  movieProvider: value,
                                  index: index,
                                ),
                              );
                            },
                            separatorBuilder: (context, index) {
                              return const SizedBox(
                                height: 10,
                                child: Divider(
                                  height: 2,
                                ),
                              );
                            },
                            itemCount: value.movieSearchModel!.results!.length),
                      );
                    } else {
                      return Container(
                        height: MediaQuery.of(context).size.height * 0.8,
                        child: Center(child: Image.asset('assets/Empty.png')),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
