import 'package:equina_task/widget/custom_text_form_field.dart';
import 'package:equina_task/styles/colors.dart';
import 'package:equina_task/styles/text_mang.dart';
import 'package:equina_task/widget/custom_elevated_buttom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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

  bool _isPasswordVisible = false;
  bool _isChecked = false;

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
      color: lightGreyFilter,
      // padding: SizeConfig.base,
      child: Column(
        children: [
          _buildUserFields(),
          _agreed(),
          CustomElevatedButtom(
            text: 'Sign In',
            OnPressed: () {},
            colorButton: mainBlue,
            colorText: white,
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

        // _buildLabel("Phone Number"),
        // AppPhoneFormField(
        //   controller: _phoneController,
        //   hintText: "Phone Number",
        // ),
        _buildLabel("Phone Number"),
        AppTextFormField(controller: _nameController, hintText: "Name"),
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
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Transform.scale(
          scale: 1.0,
          child: Checkbox(
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
        ),
        Expanded(
          child: RichText(
            textAlign: TextAlign.start,
            text: TextSpan(
              style: TextStyle(fontSize: 14.sp, color: lightGreyFilter),
              children: [
                TextSpan(text: "I have read and agreed to the "),
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
    return Text(text, style: TextManager.regular());
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
            () => setState(() => _isPasswordVisible = !_isPasswordVisible),
      ),
      keyboardType: TextInputType.visiblePassword,
    );
  }
}
