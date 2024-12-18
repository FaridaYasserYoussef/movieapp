import 'package:flutter/material.dart';
import 'package:movieapp/home/model/data_models/browse_model.dart';

class BrowseWidget extends StatelessWidget {
  const BrowseWidget({super.key, required this.genresModel});
  final Genres genresModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Stack(children: [
        Image.asset(
          'assets/default.png',
          fit: BoxFit.cover,
          height: 100,
        ),
        Center(
          child: Text(
            genresModel.name ?? '',
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(fontWeight: FontWeight.w600),
          ),
        )
      ]),
    );
  }
}
