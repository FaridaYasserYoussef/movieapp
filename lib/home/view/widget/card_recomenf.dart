import 'package:flutter/material.dart';
import 'package:movieapp/common/Appcolors.dart';
import 'package:movieapp/home/model/data_models/recomend_model.dart';
import 'package:movieapp/home/view/widget/custom_button.dart';
import 'package:movieapp/movies/view/screens/movie_details_screen.dart';

class CardRecomend extends StatelessWidget {
  CardRecomend({
    super.key,
    required this.recomendModel,
  });
  final ResultsRecomend recomendModel;
  @override
  Widget build(BuildContext context) {
    final String? text = recomendModel.title;
    final String? textDate = recomendModel.releaseDate;
    return Container(
      height: 130,
      color: AppColor.CardGray,
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            MovieDetailsScreen(movieId: recomendModel.id),
                      ),
                    );
                  },
                  child: Image.network(
                    "https://image.tmdb.org/t/p/w500${recomendModel.posterPath ?? ''}",
                    fit: BoxFit.fill,
                  ),
                ),
                height: 110,
                width: 80,
              ),
              CustomButton(
                onPressed: () {},
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.only(left: 2),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.star_rate_rounded,
                      color: Colors.amber,
                    ),
                    Text(
                      "${recomendModel.voteAverage ?? ''}".toString(),
                      style: Theme.of(context).textTheme.titleMedium,
                    )
                  ],
                ),
                Text(text!.length > 11 ? '${text.substring(0, 11)}..' : text,
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(fontSize: 13)),
                Text(
                    textDate!.length > 4
                        ? '${textDate.substring(0, 4)}'
                        : textDate,
                    style: Theme.of(context)
                        .textTheme
                        .labelSmall!
                        .copyWith(color: Colors.white))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
