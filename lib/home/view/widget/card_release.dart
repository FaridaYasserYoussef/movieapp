import 'package:flutter/material.dart';
import 'package:movieapp/home/model/data_models/release_model.dart';
import 'package:movieapp/home/view/widget/custom_button.dart';

class CardRelease extends StatelessWidget {
  CardRelease({
    super.key,
    required this.releaseModel,
  });
  final ResultsRelease releaseModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Stack(children: [
        Container(decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(25))),
          child: Image.network(
              "https://image.tmdb.org/t/p/w500/${releaseModel.posterPath ?? ''}"),
        ),
        CustomButton()
      ]),
    );
  }
}


//   child: Image.network(
            //  "https://image.tmdb.org/t/p/w500/${releaseModel.posterPath ?? ''}"),