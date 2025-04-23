import 'package:equina_task/styles/colors.dart';
import 'package:equina_task/styles/text_mang.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class UsersTypeButton extends StatelessWidget {
  final void Function()? onPressed;
  final String user;
  final bool select;

  UsersTypeButton({
    super.key,
    required this.onPressed,
    required this.user,
    this.select = false,
  });
  

  @override
  Widget build(BuildContext context) {
    Color selectColor = select ? mainBlue : lightGreyLabel;
    Color radioColor = select
        ? mainBlue
        : lightGreyFilter;

    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 80.h,
        width: 90.w,
        margin: EdgeInsets.all(10.w),
        decoration: BoxDecoration(
          border: Border.all(color: selectColor, width: 1.w),
          borderRadius: BorderRadius.circular(8.r),
          color: Colors.transparent,
        ),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ColorFiltered(
                    colorFilter: ColorFilter.mode(
                      selectColor,
                      BlendMode.srcIn,
                    ),

                    child: Image.asset(
                      "assets/images/profile_grey.png",
                      width: 20.w,
                      height: 20.h,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Text(user, style: TextManager.medium(fontSize: 13)),
                ],
              ),
            ),

            Positioned(
              top: 4.h,
              right: 4.w,
              child: Container(
                width: 18.w,
                height: 18.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: selectColor, width: 1.w),
                ),
                child: Padding(
                  padding: EdgeInsets.all(1.w),
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: radioColor,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}