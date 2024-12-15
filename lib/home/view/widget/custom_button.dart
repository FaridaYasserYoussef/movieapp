import 'package:flutter/material.dart';
import 'package:movieapp/common/Appcolors.dart';

class CustomButton extends StatefulWidget {
  const CustomButton({super.key});

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

bool iscleck = false;

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
            bottom: -6,
            right: -4,
            child: IconButton(
              icon: Icon(Icons.bookmark),
              color:
                  iscleck == false ? AppColor.opacityGrayColor : Colors.amber,
              iconSize: 50,
              onPressed: () {
                setState(() {
                  iscleck = !iscleck;
                });
              },
            )),
        IconButton(
            onPressed: () {
              setState(() {
                iscleck = !iscleck;
              });
            },
            icon: Stack(
              children: [
                Positioned(
                  right: 9,
                  bottom: 8,
                  child: Icon(
                    iscleck == false ? Icons.add : Icons.done_outlined,
                    size: 20,
                    color: Colors.white,
                  ),
                ),
              ],
            ))
      ],
    );
  }
}
