import 'package:flutter/material.dart';
import 'package:movieapp/home/model/data_models/recomend_model.dart';
import 'package:movieapp/home/view/widget/custom_button.dart';

class CardRecomend extends StatelessWidget {
  CardRecomend({
    super.key,
    required this.recomendModel,
  });
  final ResultsRecomend recomendModel;
  @override
  Widget build(BuildContext context) {
    final String? text = recomendModel.title;
    return Column(
      children: [
        Stack(
          children: [
            Container(
              child: Image.network(
                "https://image.tmdb.org/t/p/w500${recomendModel.posterPath ?? ''}",
                fit: BoxFit.fill,
              ),
              height: 120,
              width: 80,
            ),
            CustomButton()
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
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
              Text(text!.length > 11 ? '${text.substring(0, 11)}..' : text),
              Text(recomendModel.releaseDate ?? '')
            ],
          ),
        ),
      ],
    );
  }
}
