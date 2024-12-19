import 'package:flutter/material.dart';
import 'package:movieapp/common/Appcolors.dart';

class CustomButton extends StatefulWidget {
  const CustomButton({
    super.key,
    required this.onPressed,
  });
  final VoidCallback onPressed;
  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  bool iscleck = false;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: -14,
      left: -19,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Icon(Icons.bookmark,
              color:
                  iscleck == false ? AppColor.opacityGrayColor : Colors.amber,
              size: 50),
          IconButton(
              onPressed: () {
                widget.onPressed();
                setState(() {
                  iscleck = !iscleck;
                });
              },
              icon: Icon(
                iscleck == false ? Icons.add : Icons.done_outlined,
                size: 30,
                color: Colors.white,
              ))
        ],
      ),
    );
    ;
  }
}
    // return Positioned(
    //   top: -14,
    //   left: -19,
    //   child: Stack(
    //     alignment: Alignment.center,
    //     children: [
    //       IconButton(
    //         icon: Icon(Icons.bookmark),
    //          color: iscleck == false ? AppColor.opacityGrayColor : Colors.amber,
    //         iconSize: 50,
    //          onPressed: () {
    //            setState(() {
    //              iscleck = !iscleck;
    //            });
    //         },
    //        ),
    //       IconButton(
    //           onPressed: () {
    //              widget.onPressed();
    //             setState(() {
    //               iscleck = !iscleck;
    //             });
    //           },
    //           icon: Icon(
    //              iscleck == false ? Icons.add : Icons.done_outlined,
    //              size: 30,
    //              color: Colors.white,
    //            ))
    //     ],
    //   ),
    // );
  


//  IconButton(
//             icon: Icon(Icons.bookmark),
//             color: iscleck == false ? AppColor.opacityGrayColor : Colors.amber,
//             iconSize: 50,
//             onPressed: () {
//               setState(() {
//                 iscleck = !iscleck;
//               });
//             },
//           ),

//  IconButton(
//               onPressed: () {
//                 widget.onPressed;
//                 setState(() {
//                   iscleck = !iscleck;
//                 });
//               },
//               icon: Icon(
//                 iscleck == false ? Icons.add : Icons.done_outlined,
//                 size: 30,
//                 color: Colors.white,
//               ))


    // Stack(
    //   alignment: Alignment.center,
    //   children: [
    //     GestureDetector(
    //       onTap: () {
    //         buttonState.toggle();
    //       },
    //       child: Icon(
    //         Icons.bookmark,
    //         color: buttonState.isClicked
    //             ? Colors.amber
    //             : AppColor.opacityGrayColor,
    //         size: 50,
    //       ),
    //     ),
    //     GestureDetector(
    //       onTap: () {
    //         widget.onPressed();
    //         buttonState.toggle();
    //       },
    //       child: Icon(
    //         buttonState.isClicked ? Icons.done_outlined : Icons.add,
    //         color: Colors.white,
    //         size: 30,
    //       ),
    //     ),
    //   ],
    // );
  

