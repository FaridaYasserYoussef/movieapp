import 'package:flutter/material.dart';
import 'package:movieapp/common/app_colors.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({super.key, required this.hintText,  this.type ="text", required this.controller, this.validator});
final String hintText;
final String type;
final TextEditingController controller;
final String? Function(String?)? validator;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool hideText = true;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: TextFormField(
        
        obscureText: widget.type == "text"? false: hideText,
        controller: widget.controller,
        validator: widget.validator,
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20),  borderSide: BorderSide(color: AppColors.mainColor)),
          enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20), borderSide: BorderSide(color: AppColors.mainColor)),
          focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20), borderSide: BorderSide(color: AppColors.mainColor)),
          hintText: widget.hintText,
          hintStyle: TextStyle(color: Colors.white),
          suffixIconColor: AppColors.mainColor,
          suffixIcon: widget.type == "password"?  GestureDetector(
            child: Icon(hideText ? Icons.visibility: Icons.visibility_off),
            onTap: () {
              hideText = !hideText;
              setState(() {
                
              });
            },
          ): null
          

        ),
      ),
    );
  }
}