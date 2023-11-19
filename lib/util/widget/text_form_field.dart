import 'package:flutter/material.dart';
import 'package:gloria_test_case/core/constants/border_radius.dart';
import 'package:gloria_test_case/core/extension/index.dart';
import 'package:gloria_test_case/core/helper/typedef.dart';

final class AppTextFormField extends StatelessWidget {
  const AppTextFormField(
      {super.key,
      required this.controller,
      this.isSecure = false,
      required this.hintText,
      this.validator, this.prefixIcon,  this.textInputType=TextInputType.emailAddress, this.suffixIcon});
  final TextEditingController controller;
  final String hintText;
  final bool isSecure;
  final Validator validator;
  final Widget? prefixIcon;
  final TextInputType textInputType;
  final Widget? suffixIcon;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTapOutside: (_) => FocusManager.instance.primaryFocus?.unfocus(),
      controller: controller,
      obscureText: isSecure,
      validator: validator,
      keyboardType:textInputType ,
      decoration: InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: AppRadius.circular(),
        ),
        prefixIcon: prefixIcon,
        prefixIconColor: context.colorSheme.inversePrimary,
        suffixIcon:suffixIcon,
        suffixIconColor: context.colorSheme.inversePrimary
        
      ),
    );
  }
}
