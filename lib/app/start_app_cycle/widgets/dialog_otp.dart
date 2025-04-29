import 'dart:async';

import 'package:equina_task/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../../styles/text_mang.dart';

class DialogOTP extends StatefulWidget {
  const DialogOTP({Key? key}) : super(key: key);

  @override
  State<DialogOTP> createState() => _DialogOTPState();
}

class _DialogOTPState extends State<DialogOTP> {
  late int _secondsRemaining = 5;
  late Timer _timer;

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_secondsRemaining > 0) {
        setState(() {
          _secondsRemaining--;
        });
      } else {
        _secondsRemaining = 0;
        TextButton(
          onPressed: () {},
          child: Text(
            "Resent Code",
            style: TextManager.regular().copyWith(color: mainBlue),
          ),
        );
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: black.withAlpha(50),
      child: AlertDialog(
        backgroundColor: white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.r),
        ),
        title: Text(
          textAlign: TextAlign.center,
          'Please Enter the Code sent to your \nMobile Number',
          style: TextManager.regular().copyWith(color: black),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 5.w),
              child: PinCodeTextField(
                cursorColor: mainDarkBlue,
                appContext: context,
                length: 6,
                obscureText: false,
                animationType: AnimationType.fade,
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(10.r),
                  borderWidth: 1.w,
                  activeBorderWidth: 1.w,
                  selectedBorderWidth: 1.w,
                  inactiveBorderWidth: 1.w,
                  fieldHeight: 45.h,
                  fieldWidth: 35.w,
                  activeFillColor: mainBlue.withAlpha(10),
                  activeColor: mainBlue,
                  selectedColor: mainBlue.withAlpha(120),
                  inactiveFillColor: white,
                  selectedFillColor: white,
                  inactiveColor: mainBlue,
                ),
                animationDuration: Duration(milliseconds: 150),

                enableActiveFill: true,
                keyboardType: TextInputType.number,
                onCompleted: (v) {
                  print("Completed");
                },
                onChanged: (value) {
                  print(value);
                },
              ),
            ),
            Text(_secondsRemaining.toString()),
            if (_secondsRemaining == 0)
              TextButton(
                onPressed: () {
                  _startTimer();
                  //  resend OTP logic
                },
                child: Text(
                  "Resend Code",
                  style: TextManager.regular().copyWith(color: mainBlue),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
