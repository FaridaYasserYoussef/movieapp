import 'package:flutter/material.dart';

class GenresTags extends StatelessWidget {
  final String? title;
  const GenresTags({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {},
      child: Text(
        title!,
        style: Theme.of(context).textTheme.titleSmall,
      ),
      shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.circular(5)),
    );
  }
}
