import 'package:flutter/material.dart';
import 'package:movieapp/common/App_color.dart';
import 'package:movieapp/home/model/data_models/recomend_model.dart';
import 'package:movieapp/home/model/data_sources/DataSource.dart';
import 'package:movieapp/home/view/widget/card_recomend.dart';

class bottonWidget extends StatelessWidget {
  const bottonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: DataSource.getRecommended(),
        builder: (context, snapshot) {
          if (ConnectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Erorrrrr'),
            );
          } else if (snapshot.hasData) {
            RecomendModel? recomendModel = snapshot.data;
            var recomendList = recomendModel?.results ?? [];
            return Container(
              color: AppColor.grayColor,
              child: Column(
                children: [
                  Align(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Recomended',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    alignment: Alignment.topLeft,
                  ),
                  SizedBox(
                    height: 190,
                    child: ListView.separated(
                        separatorBuilder: (context, index) => SizedBox(
                              width: 10,
                            ),
                        scrollDirection: Axis.horizontal,
                        itemCount: recomendList.length,
                        itemBuilder: (context, index) {
                          return CardRecomend(
                            recomendModel: recomendList[index],
                          );
                        }),
                  ),
                ],
              ),
            );
          }
          ;
          return Container();
        });
  }
}
    
    
    
    
    
    
//      Container(
//       color: AppColor.grayColor,
//       child: Column(
//         children: [
//           Align(
//             child: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Text(
//                 'New Releases',
//                 style: TextStyle(fontSize: 20),
//               ),
//             ),
//             alignment: Alignment.topLeft,
//           ),
//           SizedBox(
//             height: 190,
//             child: ListView.separated(
//                 separatorBuilder: (context, index) => SizedBox(
//                       width: 10,
//                     ),
//                 scrollDirection: Axis.horizontal,
//                 itemCount: 10,
//                 itemBuilder: (context, index) {
//                   return CardRecomend(recomendModel: ,);
//                 }),
//           ),
//         ],
//       ),
//     );
//   }
// }
