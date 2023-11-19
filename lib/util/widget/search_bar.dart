import 'package:flutter/material.dart';
import 'package:gloria_test_case/core/constants/index.dart';
import 'package:gloria_test_case/core/extension/index.dart';

final class AppSearchBar extends StatelessWidget {
  const AppSearchBar({super.key, required this.hintText, this.suffixIcon=const Icon(Icons.search), this.onChanged});
  final String hintText;
  final Widget suffixIcon;
  final ValueChanged<String>? onChanged;
  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged:onChanged ,
      decoration: InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: AppRadius.circular(),
        ),
        suffixIcon: suffixIcon,
        suffixIconColor: context.colorSheme.inversePrimary,
      ),
    );
  }
}
