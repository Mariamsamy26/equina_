import 'package:equina_task/app/start_app_cycle/views/register_form.dart';
import 'package:equina_task/app/start_app_cycle/views/signin_form.dart';
import 'package:equina_task/app/start_app_cycle/widgets/custom_tab_view.dart';
import 'package:equina_task/helpers/application_dimentions.dart';
import 'package:equina_task/styles/colors.dart';
import 'package:equina_task/styles/text_mang.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthScreen extends StatelessWidget {
  static const String routeName = 'Auth Screen';
  final int initialTabIndex;

  const AuthScreen({Key? key, this.initialTabIndex = 0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: white,
        child: ListView(
          children: [
            _ConstPart(),
            CustomTabView(
              tabs: ["Sign In", "Register"],
              views: [SignInForm(), RegisterForm()],
              initialTabIndex: initialTabIndex,
            ),
          ],
        ),
      ),
    );
  }

  Widget _ConstPart() {
    return Center(
      child: Column(
        children: [
          SizedBox(height: 35.h),
          Image.asset(
            "assets/images/logo_text.png",
            height: 50.h,
            width: AppDimentions().availableWidth * 0.6,
            fit: BoxFit.fill,
          ),
          SizedBox(height: 10.h),
          Text("Welcon to equina ", style: TextManager.medium(fontSize: 22)),
          Text(
            "equinaCLUB, book your ",
            style: TextManager.regular(
              fontSize: 20,
            ).copyWith(color: lightGreyLabel),
          ),
          Text(
            "classes - advance your game. ",
            style: TextManager.regular(
              fontSize: 20,
            ).copyWith(color: lightGreyLabel),
          ),
          SizedBox(height: 10.h),
        ],
      ),
    );
  }
}
