import 'package:equina_task/widget/custom_text_form_field.dart';
import 'package:equina_task/app/start_app_cycle/widgets/custom_selec_user_button.dart';
import 'package:equina_task/styles/colors.dart';
import 'package:equina_task/styles/text_mang.dart';
import 'package:equina_task/widget/custom_elevated_buttom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({Key? key}) : super(key: key);

  @override
  _SignInFormState createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isPasswordVisible = true;
  String userType = "Equestrian User";

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundGrey,
      padding: EdgeInsets.symmetric(horizontal: 20.w),

      child: Column(
        children: [
          _usersType(),
          SizedBox(height: 5.h),
          _usersData(),
          SizedBox(height: 5.h),

          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text.rich(
                    TextSpan(
                      text: "or login ",
                      style: TextManager.regular().copyWith(
                        color: lightGreyLabel,
                      ),
                      children: [
                        TextSpan(
                          text: "As a Guest",
                          style: TextManager.regular().copyWith(
                            color: mainBlue,
                            decoration: TextDecoration.underline,
                            decorationColor: mainBlue,
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 4.h),

                  TextButton(
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      minimumSize: Size.zero,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    onPressed: () {},
                    child: Text(
                      "Forgot Password?",
                      style: TextManager.medium().copyWith(
                        color: mainBlue,
                        fontSize: 14.sp,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),

          SizedBox(height: 60.h),
          CustomElevatedButtom(
            height: 45,
            text: 'Sign In',
            OnPressed: () {},
            colorButton: mainBlue,
            colorText: white,
          ),
        ],
      ),
    );
  }

  Widget _usersType() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        UsersTypeButton(
          onPressed: () {
            setState(() {
              userType = "Equestrian User";
            });
          },
          select: userType == "Equestrian User",
          user: "Equestrian User",
        ),
        UsersTypeButton(
          onPressed: () {
            setState(() {
              userType = "Trainer User";
            });
          },
          select: userType == "Trainer User",
          user: "Trainer User",
        ),
      ],
    );
  }

  Widget _buildLabel(String text) {
    return Text(text, style: TextManager.regular(fontSize: 16));
  }

  Widget _usersData() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (userType == "Equestrian User") ...[
          _buildLabel("Phone Number"),
          AppTextFormField(
            controller: _phoneController,
            hintText: "Phone Number",
            prefixIcon: SizedBox(
              width: 10.w,
              child: Center(
                child: Text('🇪🇬', style: TextStyle(fontSize: 20)),
              ),
            ),
          ),
        ] else ...[
          _buildLabel("Email"),
          AppTextFormField(controller: _emailController, hintText: "Email"),
        ],

        SizedBox(height: 18.h),
        _buildLabel("Password"),
        AppTextFormField(
          controller: _passwordController,
          hintText: "Password",
          isPasswordField: _isPasswordVisible,
          keyboardType: TextInputType.visiblePassword,
        ),
      ],
    );
  }
}
