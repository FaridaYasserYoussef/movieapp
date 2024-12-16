import 'package:flutter/material.dart';
import 'package:movieapp/common/widget/error_widget.dart';
import 'package:movieapp/common/widget/loading_widget.dart';
import 'package:movieapp/home/view/screen/browseListDetails.dart';
import 'package:movieapp/home/view/widget/browse_widget.dart';
import 'package:movieapp/home/view_model/browse_provider.dart';
import 'package:provider/provider.dart';

class CustomBrowse extends StatefulWidget {
  const CustomBrowse({super.key});

  @override
  State<CustomBrowse> createState() => _CustomBrowseState();
}

class _CustomBrowseState extends State<CustomBrowse> {
  late BrowseProvider browseProvider;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    browseProvider = BrowseProvider();
    browseProvider.getBrowse();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => browseProvider,
        child: Consumer<BrowseProvider>(
            builder: (context, value, child) => value.watting
                ? LoadingWidget()
                : value.errorMessage != null
                    ? CustomErrorWidget(errorMessage: value.errorMessage!)
                    : Column(
                        children: [
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Text(
                                  'Browse Category ',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .copyWith(fontSize: 20),
                                ),
                              )),
                          Expanded(
                            child: GridView.builder(
                                itemCount:
                                    value.browseModel!.genres!.length - 1,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  mainAxisSpacing: 0,
                                  childAspectRatio: 1.2,
                                  crossAxisCount: 2,
                                ),
                                itemBuilder: (BuildContext, index) {
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10, right: 10),
                                    child: GestureDetector(
                                        onTap: () {
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (_) =>
                                                      BrowseListDetails()));
                                        },
                                        child: BrowseWidget(
                                            genresModel: value
                                                .browseModel!.genres![index])),
                                  );
                                }),
                          ),
                        ],
                      )));
  }
}
