import 'package:flutter/material.dart';
import 'package:movieapp/common/Appcolors.dart';

class CustomBookMarkWidget extends StatefulWidget {
  const CustomBookMarkWidget({super.key, this.onTap});
  final void Function()? onTap;

  @override
  State<CustomBookMarkWidget> createState() => _CustomBookMarkWidgetState();
}

class _CustomBookMarkWidgetState extends State<CustomBookMarkWidget> {
  @override
  bool isClecked = false;
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onTap?.call();
        setState(() {
          isClecked = !isClecked;
        });
      },
      child: Stack(
        alignment: Alignment.center, // Centers all children
        children: [
          Icon(Icons.bookmark,
              color:
                  isClecked == false ? AppColor.opacityGrayColor : Colors.amber,
              size: 60),
          // IconButton(
          //     onPressed: () {
          //       setState(() {
          //         isClecked = !isClecked;
          //       });
          //     },
          //     icon: Icon(
          //         isClecked == false ? Icons.add : Icons.done_outline_outlined))
          Icon(isClecked == false ? Icons.add : Icons.done_outline_outlined,
              color: Colors.white, size: 20),
        ],
      ),
    );
  }
}
