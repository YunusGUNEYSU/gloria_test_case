import 'package:flutter/material.dart';
import 'package:gloria_test_case/core/constants/index.dart';
import 'package:gloria_test_case/core/extension/index.dart';

final class AppButton extends StatelessWidget {
  const AppButton(
      {super.key, required this.onTap, required this.buttonText, this.height, this.width});
  final VoidCallback onTap;
  final String buttonText;
  final double? height;
  final double? width;
  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onTap,
        child: Container(
          width: height ?? context.width * 0.9,
          height: width ?? context.height * 0.07,
          padding: const AppPadding.allHigh(),
          decoration:
              BoxDecoration(borderRadius: AppRadius.circular(), color: context.colorSheme.primary),
          child: FittedBox(
            child: Text(
              buttonText,
              textAlign: TextAlign.center,
              style: context.textTheme.headlineSmall,
            ),
          ),
        ));
  }
}
