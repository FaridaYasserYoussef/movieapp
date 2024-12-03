import 'package:flutter/material.dart';
import 'package:movieapp/common/app_colors.dart';

class CustomFormButton extends StatelessWidget {
  const CustomFormButton({super.key, this.onTap, required this.text});
 final void Function()? onTap;
 final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
                color: AppColors.mainColor,
                
    
      ),
          width: double.infinity,
          height: 35,
          child: Center(child: Text(text, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),)),
    
        ),
      ),
    );
  }
}