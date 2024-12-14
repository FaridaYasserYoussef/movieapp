import 'package:flutter/material.dart';
import 'package:movieapp/watch_list/model/data_models/watch_list_movie_model.dart';
import 'package:movieapp/watch_list/view/Widgets/customBookmarkWidget.dart';
import 'package:movieapp/watch_list/view_model/watch_list_cubit.dart';

class WatchListItem extends StatefulWidget {
  const WatchListItem({super.key, required this.movieModel});

  final WatchListMovieModel movieModel;

  @override
  State<WatchListItem> createState() => _WatchListItemState();
}

class _WatchListItemState extends State<WatchListItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      child: Row(

        crossAxisAlignment: CrossAxisAlignment.end,
        
        children: [
           Stack(
            children: [
              widget.movieModel.imageUrl == null? Image.asset('assets/poster_not_found.jpg',
              width: 175,
              height: 130,
      
              ): Padding(
                
                padding:  EdgeInsets.only(left: 12,
                top: 5
                ),
                child: Image.network(widget.movieModel.imageUrl!,
                
                width: 179,
                height: 130,
                ),
              ),

                            Positioned(
                              top: 0,
                              left: 0,
                              child: CustomBookMarkWidget(
                                          
                                onTap: () async{
                                          
                                WatchListCubit  watchListCubit = WatchListCubit();
                                          
                               await watchListCubit.removeFromWatchList(widget.movieModel.id!);
                                          
                                },
                                          
                              ),
                            ),              
             
            ],
           ),
    
           Padding(
             padding: const EdgeInsets.only(left: 40, bottom: 30),
             child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(widget.movieModel.movieName!, style: TextStyle(fontSize: 15, color: Colors.white),),
                Text((widget.movieModel.year).toString(),  style: TextStyle(fontSize: 13, color: Color.fromRGBO(255, 255, 255, 0.6745)),),
                Text(widget.movieModel.artists!, style: TextStyle(fontSize: 13, color: Color.fromRGBO(255, 255, 255, 0.6745)))
              ],
             ),
           )
    
        ]
      ),
    );
  }
}