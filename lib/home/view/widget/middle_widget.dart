import 'package:flutter/material.dart';
import 'package:movieapp/common/App_color.dart';
import 'package:movieapp/home/model/data_models/release_model.dart';
import 'package:movieapp/home/model/data_sources/DataSource.dart';
import 'package:movieapp/home/view/widget/card_release.dart';

class MiddleWidget extends StatefulWidget {
  const MiddleWidget({super.key});

  @override
  State<MiddleWidget> createState() => _MiddleWidgetState();
}

class _MiddleWidgetState extends State<MiddleWidget> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: DataSource.getNewRelease(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text(
                'Erorrrr',
                style: TextStyle(color: Colors.red),
              ),
            );
          } else if (snapshot.hasData) {
            ReleasesModel? releasesModel = snapshot.data;
            var resultsListrelease = releasesModel?.results ?? [];

            return Container(
              color: AppColor.grayColor,
              child: Column(
                children: [
                  Align(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'New Releases',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    alignment: Alignment.topLeft,
                  ),
                  SizedBox(
                    height: 140,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: resultsListrelease.length,
                        itemBuilder: (context, index) {
                          return CardRelease(
                            releaseModel: resultsListrelease[index],
                          );
                        }),
                  ),
                ],
              ),
            );
          }
          print('yaaaa');
          return Text(
            'data not found',
            style: TextStyle(color: Colors.red),
          );
        });
  }
}


//  Container(
//       color: AppColor.grayColor,
//       child: SizedBox(
//         height: 190,
//         child: ListView.separated(
//             separatorBuilder: (context, int) => SizedBox(
//                   width: 20,
//                 ),
//             scrollDirection: Axis.horizontal,
//             itemCount: ,
//             itemBuilder: (context, int) {
//              return CardRelease(releaseModel:value.releaseModel.ar   );
//             }),
//       ),
//     );
