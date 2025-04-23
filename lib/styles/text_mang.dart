import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextManager {
  static TextStyle regular({double? fontSize }) {
    return TextStyle(
      fontFamily: 'FuturaPT',
      fontWeight: FontWeight.w300,
      fontSize: (fontSize??15).sp,
    );
  }
    

  static TextStyle medium({double? fontSize }) {
    return TextStyle(
      fontFamily: 'FuturaPT',
      fontWeight: FontWeight.w500,
      fontSize:(fontSize??20).sp,
    );
  }

  static TextStyle bold({double? fontSize} ) {
    return TextStyle(
      fontFamily: 'FuturaPT',
      fontWeight: FontWeight.bold,
      fontSize: (fontSize??25).sp,
    );
  }
}