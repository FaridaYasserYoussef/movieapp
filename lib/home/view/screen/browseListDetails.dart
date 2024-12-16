import 'package:flutter/material.dart';
import 'package:movieapp/common/widget/error_widget.dart';
import 'package:movieapp/common/widget/loading_widget.dart';
import 'package:movieapp/home/view/widget/card_browse_list.dart';
import 'package:movieapp/home/view_model/browse_list_provider.dart';
import 'package:provider/provider.dart';

class BrowseListDetails extends StatefulWidget {
  BrowseListDetails({
    super.key,
  });

  @override
  State<BrowseListDetails> createState() => _BrowseListDetailsState();
}

class _BrowseListDetailsState extends State<BrowseListDetails> {
  late BrowseListProvider browseListProvider;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    browseListProvider = BrowseListProvider();
    browseListProvider.getBrowseList();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => browseListProvider,
        child: Consumer<BrowseListProvider>(
            builder: (context, value, child) => value.watting
                ? LoadingWidget()
                : value.errorMessage != null
                    ? CustomErrorWidget(errorMessage: value.errorMessage!)
                    : Scaffold(
                        backgroundColor: Colors.black,
                        appBar: AppBar(
                          backgroundColor: Colors.black,
                          leading: IconButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              icon: Icon(
                                Icons.arrow_back,
                                color: Colors.white,
                              )),
                        ),
                        body: ListView.separated(
                            itemBuilder: (context, index) {
                              return CardBrowseList(
                                resultsBrowseList:
                                    value.browseListModel!.results![index],
                              );
                            },
                            separatorBuilder: ((context, index) => Divider(
                                  height: 5,
                                  color: Colors.white,
                                )),
                            itemCount: value.browseListModel!.results!.length),
                      )));
  }
}



//  FutureBuilder(
//         future: DataSource.getBrowseList(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(
//               child: CircularProgressIndicator(),
//             );
//           } else if (snapshot.hasError) {
//             return Center(
//               child: Text(
//                 'Erorrrr',
//                 style: TextStyle(color: Colors.red),
//               ),
//             );
//           } else if (snapshot.hasData) {
//             BrowseListModel? browseListModel = snapshot.data;
//             var browseList = browseListModel?.results ?? [];

          //   return Scaffold(
          //     backgroundColor: Colors.black,
          //     appBar: AppBar(
          //       backgroundColor: Colors.black,
          //       leading: IconButton(
          //           onPressed: () {
          //             Navigator.of(context).pop();
          //           },
          //           icon: Icon(
          //             Icons.arrow_back,
          //             color: Colors.white,
          //           )),
          //     ),
          //     body: ListView.separated(
          //         itemBuilder: (context, index) {
          //           return CardBrowseList(
          //             resultsBrowseList: browseList[index],
          //           );
          //         },
          //         separatorBuilder: ((context, index) => Divider(
          //               height: 5,
          //               color: Colors.white,
          //             )),
          //         itemCount: 20),
          //   );
          // }
//           return Container();
//         });