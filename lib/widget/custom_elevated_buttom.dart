import 'package:equina_task/styles/colors.dart';
import 'package:equina_task/styles/text_mang.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class CustomElevatedButtom extends StatelessWidget {
  final String text;
  final void Function()? OnPressed;
  final double width;
  final double height;
  final Color colorButton;
  final Color colorText;

  CustomElevatedButtom({
    super.key,
    required this.text,
    required this.OnPressed,
    this.height = 40,
    this.width = 325,
    this.colorButton = mainBlue,
    this.colorText = white,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        child: SizedBox(
          width: width.w,
          height: height.h,
          child: ElevatedButton(
            onPressed: OnPressed,
            style: ElevatedButton.styleFrom(
                backgroundColor: colorButton,
                elevation: 0.0,
                shape: RoundedRectangleBorder(
            
                  borderRadius: BorderRadius.circular(7.r),
                )),
            child: Text(text,
                style: TextManager.regular(fontSize: 20).copyWith(color: colorText)
                ),
          ),
        ),
      ),
    );
  }
}