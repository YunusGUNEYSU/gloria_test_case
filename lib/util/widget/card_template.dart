import 'package:flutter/material.dart';
import 'package:gloria_test_case/core/extension/index.dart';

import '../../core/constants/index.dart';

 class CardTemplate extends StatelessWidget {
  const CardTemplate({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return  Container(
      width: context.width * 0.7,
      height: context.height * 0.2,
      padding: const AppPadding.allNormal(),
      decoration: BoxDecoration(
          boxShadow: [BoxShadow(color: context.colorSheme.inversePrimary, blurRadius: 5.0)],
          borderRadius: AppRadius.circular(),
          color: context.colorSheme.primary),
      child: child,
    );
  }
}