import 'package:flutter/material.dart';
import 'package:movieapp/common/App_color.dart';
import 'package:movieapp/home/model/data_models/release_model.dart';

class CardRelease extends StatelessWidget {
  CardRelease({
    super.key,
    required this.releaseModel,
  });
  final Results releaseModel;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          child: Text(
            releaseModel.id.toString(),
            style: TextStyle(color: Colors.red),
          ),
          height: 120,
          width: 80,
        ),
        Align(
            alignment: Alignment.topLeft,
            child: Stack(children: [
              Icon(
                Icons.bookmark,
                color: AppColor.opacityGrayColor,
                size: 36,
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.add),
                iconSize: 20,
                color: Colors.white,
              )
            ]))
      ],
    );
  }
}
//'https://mir-s3-cdn-cf.behance.net/project_modules/1400/3ed155138856997.6226c3733c226.png'

// 'https://image.tmdb.org/t/p/w500${releaseModel.posterPath ?? ''}'


// Image.network(
//             errorBuilder: (context, error, stackTrace) => Image.network(
//                 'https://mir-s3-cdn-cf.behance.net/project_modules/1400/3ed155138856997.6226c3733c226.png'),
//             'https://image.tmdb.org/t/p/w500${releaseModel.posterPath ?? ''}',
//             fit: BoxFit.fill,
//           ),
