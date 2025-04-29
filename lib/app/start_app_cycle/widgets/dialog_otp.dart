import 'package:equina_task/styles/colors.dart';
import 'package:flutter/material.dart';

import '../../../styles/text_mang.dart';
class DialogOTP extends StatelessWidget {
  const DialogOTP({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Please Enter the Code sent to your\n Mobile Number',
      style: TextManager.regular().copyWith(color: black),
      ),
      actions: <Widget>[

      ],
    );
  }
}
