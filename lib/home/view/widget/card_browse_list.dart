import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movieapp/home/model/data_models/browseList_model.dart';
import 'package:movieapp/home/view/widget/custom_button.dart';

class CardBrowseList extends StatelessWidget {
  // static const String routName = 'Card_Browse_List';
  const CardBrowseList({
    super.key,
    required this.resultsBrowseList,
  });
  final ResultsBrowseList resultsBrowseList;
  @override
  Widget build(BuildContext context) {
    final String? textDate = resultsBrowseList.releaseDate;
    return ListTile(
      leading: Stack(
        children: [
          Container(
            height: 150.h,
            width: 100.w,
            child: Image.network(
              "https://image.tmdb.org/t/p/w500/${resultsBrowseList.posterPath ?? ''}",
              fit: BoxFit.cover,
            ),
          ),
          CustomButton(
            onPressed: () {},
          )
        ],
      ),
      title: Text(
        resultsBrowseList.title ?? '',
        style: Theme.of(context).textTheme.titleMedium,
      ),
      subtitle: Text(
          textDate!.length > 4 ? '${textDate.substring(0, 4)}' : textDate,
          style: Theme.of(context).textTheme.labelSmall),
    );
  }
}
