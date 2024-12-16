import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movieapp/common/Appcolors.dart';
import 'package:movieapp/common/widget/error_widget.dart';
import 'package:movieapp/common/widget/loading_widget.dart';
import 'package:movieapp/home/view/widget/card_recomenf.dart';
import 'package:movieapp/home/view_model/recomend_provider.dart';
import 'package:provider/provider.dart';

class bottonWidget extends StatefulWidget {
  const bottonWidget({super.key});

  @override
  State<bottonWidget> createState() => _bottonWidgetState();
}

class _bottonWidgetState extends State<bottonWidget> {
  late RecomendProvider recomendProvider;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    recomendProvider = RecomendProvider();
    recomendProvider.getRecomend();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => recomendProvider,
      child: Consumer<RecomendProvider>(
          builder: (context, value, child) => value.watting
              ? LoadingWidget()
              : value.errorMessage != null
                  ? CustomErrorWidget(errorMessage: value.errorMessage!)
                  : Container(
                      height: 300.h,
                      color: AppColor.grayColor,
                      child: Column(
                        children: [
                          Align(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Recomended',
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                            ),
                            alignment: Alignment.topLeft,
                          ),
                          SizedBox(
                            height: 220.h,
                            child: ListView.separated(
                                separatorBuilder: (context, index) => SizedBox(
                                      width: 10,
                                    ),
                                scrollDirection: Axis.horizontal,
                                itemCount: value.recomendModel!.results!.length,
                                itemBuilder: (context, index) {
                                  return CardRecomend(
                                    recomendModel:
                                        value.recomendModel!.results![index],
                                  );
                                }),
                          ),
                        ],
                      ),
                    )),
    );
  }
}
