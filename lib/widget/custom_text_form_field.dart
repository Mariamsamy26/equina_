import 'package:equina_task/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextFormField extends StatefulWidget {
  final TextStyle? inputTextStyle;
  final TextStyle? hintStyle;
  final String? hintText;
  final String? label;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final bool readOnly;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final bool isPasswordField;

  const AppTextFormField({
    super.key,
    this.inputTextStyle,
    this.hintStyle,
    this.hintText,
    this.suffixIcon,
    this.controller,
    this.validator,
    this.prefixIcon,
    this.label,
    this.readOnly = false,
    this.keyboardType,
    this.inputFormatters,
    this.isPasswordField = false,
  });

  @override
  _AppTextFormFieldState createState() => _AppTextFormFieldState();
}

class _AppTextFormFieldState extends State<AppTextFormField> {
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 5.h),
      height: 45.h,
      child: TextFormField(
        readOnly: widget.readOnly,
        obscureText: widget.isPasswordField ? !_isPasswordVisible : false,
        obscuringCharacter: '*',
        decoration: InputDecoration(
          filled: true,
          fillColor: white,
          labelText: widget.label,
          hintText: widget.hintText,
          hintStyle: widget.hintStyle,
          suffixIcon:
              widget.isPasswordField
                  ? IconButton(
                    icon: Icon(
                      _isPasswordVisible
                          ? Icons.visibility_outlined
                          : Icons.visibility,
                      color: black,
                      size: 15,
                    ),
                    onPressed: () {
                      setState(() {
                        _isPasswordVisible = !_isPasswordVisible;
                      });
                    },
                  )
                  : widget.suffixIcon,
          prefixIcon: widget.prefixIcon,
          enabledBorder: OutlineInputBorder(

            borderSide: BorderSide(color: mainBlue, width: 2.w),
            borderRadius: BorderRadius.circular(8.r),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: mainBlue, width: 2.w),
            borderRadius: BorderRadius.circular(8.r),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: mainBlue, width: 2.w),
            borderRadius: BorderRadius.circular(8.r),
          ),
        ),
        controller: widget.controller,
        validator: widget.validator,
        keyboardType: widget.keyboardType,
        inputFormatters: widget.inputFormatters,
      ),
    );
  }
}
