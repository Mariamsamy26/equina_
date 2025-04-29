import 'package:equina_task/widget/custom_text_form_field.dart';
import 'package:equina_task/styles/colors.dart';
import 'package:equina_task/styles/text_mang.dart';
import 'package:equina_task/widget/custom_elevated_buttom.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/dialog_otp.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({Key? key}) : super(key: key);

  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  bool _isChecked = false;
  bool _isPasswordVisible = false;

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundGrey,
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        children: [
          _buildUserFields(),
          _agreed(),
          SizedBox(height: 5.h),
          CustomElevatedButtom(
            text: 'Register',
            OnPressed: validateForm() ? () {} : null,
            colorButton: validateForm() ? mainBlue : greyBorder,
            colorText: validateForm() ? white : tutorialBg,
          ),
        ],
      ),
    );
  }

  Widget _buildUserFields() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 5.h),
        _buildLabel("Name"),
        AppTextFormField(controller: _nameController, hintText: "Name"),
        SizedBox(height: 5.h),

        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            _buildLabel("Phone Number"),
            Spacer(),
            _isPhoneVerified()
                ? Text(
                  "phone verified ",
                  style: TextManager.regular().copyWith(color: black),
                )
                : Text(
                  "phone not verified ",
                  style: TextManager.regular().copyWith(color: redErorr),
                ),
            SizedBox(width: 5.w),
            _isPhoneVerified()
                ? Image.asset(
                  "assets/images/checked.png",
                  height: 20.h,
                  width: 20.w,
                )
                : Image.asset(
                  "assets/images/red_cross.png",
                  height: 20.h,
                  width: 20.w,
                ),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 5,
              child: AppTextFormField(
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'[0-9*#]')),
                  LengthLimitingTextInputFormatter(11),
                ],
                controller: _phoneController,
                hintText: "Phone Number",
                prefixIcon: SizedBox(
                  width: 10.w,
                  child: Center(
                    child: Text('🇪🇬', style: TextStyle(fontSize: 20)),
                  ),
                ),
                onChanged: (phone) {
                  setState(() {});
                },
              ),
            ),
            if (_phoneController.text.length == 11)
              Expanded(
                flex: 3,
                child: CustomElevatedButtom(
                  text: "Verify Number",
                  colorSize: 11,
                  OnPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => DialogOTP()

                      ),
                    );
                  },
                ),
              ),
          ],
        ),
        SizedBox(height: 10.h),

        _buildLabel("Password"),
        _buildPasswordField(_passwordController, "Password"),

        SizedBox(height: 10.h),
        _buildLabel("Confirm Password"),
        _buildPasswordField(_confirmPasswordController, "Confirm Password"),
      ],
    );
  }

  Widget _agreed() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Checkbox(
          value: _isChecked,
          onChanged: (value) {
            setState(() {
              _isChecked = value!;
            });
          },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.r),
          ),
          activeColor: mainBlue,
        ),
        Expanded(
          child: RichText(
            textAlign: TextAlign.start,
            text: TextSpan(
              style: TextStyle(fontSize: 14.sp, color: lightGreyLabel),
              children: [
                TextSpan(text: "I have read and agreed to the \n"),
                TextSpan(
                  text: "Terms",
                  style: TextManager.regular().copyWith(
                    color: mainBlue,
                    decoration: TextDecoration.underline,
                  ),
                ),
                TextSpan(text: " and "),
                TextSpan(
                  text: "Privacy Policy",
                  style: TextManager.regular().copyWith(
                    color: mainBlue,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildLabel(String text) {
    return Padding(
      padding: EdgeInsets.only(top: 10.h),
      child: Text(text, style: TextManager.regular()),
    );
  }

  Widget _buildPasswordField(
    TextEditingController controller,
    String hintText,
  ) {
    return AppTextFormField(
      controller: controller,
      hintText: hintText,
      isPasswordField: true,
      suffixIcon: IconButton(
        icon: Icon(
          _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
        ),
        onPressed:
            () => setState(() {
              _isPasswordVisible = !_isPasswordVisible;
            }),
      ),
      keyboardType: TextInputType.visiblePassword,
    );
  }

  bool validateForm() {
    return _nameController.text.isNotEmpty &&
        _phoneController.text.isNotEmpty &&
        _passwordController.text.isNotEmpty &&
        _confirmPasswordController.text.isNotEmpty &&
        _isPhoneVerified() &&
        _isChecked == true;
  }

  ///لسه هزود شرط otp
  bool _isPhoneVerified() {
    return _phoneController.text.length == 11 ? true : false;
  }
}
