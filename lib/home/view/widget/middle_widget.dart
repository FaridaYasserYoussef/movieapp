import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movieapp/common/Appcolors.dart';
import 'package:movieapp/common/widget/error_widget.dart';
import 'package:movieapp/common/widget/loading_widget.dart';
import 'package:movieapp/home/view/widget/card_release.dart';
import 'package:movieapp/home/view_model/release_provider.dart';
import 'package:provider/provider.dart';

class MiddleWidget extends StatefulWidget {
  const MiddleWidget({super.key});

  @override
  State<MiddleWidget> createState() => _MiddleWidgetState();
}

class _MiddleWidgetState extends State<MiddleWidget> {
  late ReleaseProvider releaseProvider;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    releaseProvider = ReleaseProvider();
    releaseProvider.getNewRelease();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => releaseProvider,
      child: Consumer<ReleaseProvider>(
          builder: (context, value, child) => value.watting
              ? LoadingWidget()
              : value.errorMessage != null
                  ? CustomErrorWidget(errorMessage: value.errorMessage!)
                  : Container(
                      color: AppColor.grayColor,
                      child: Column(
                        children: [
                          Align(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'New Releases',
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                            ),
                            alignment: Alignment.topLeft,
                          ),
                          SizedBox(
                            height: 160.h,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: value.releasesModel!.results!.length,
                                itemBuilder: (context, index) {
                                  return CardRelease(
                                    releaseModel:
                                        value.releasesModel!.results![index],
                                  );
                                }),
                          ),
                        ],
                      ),
                    )),
    );
  }
}
