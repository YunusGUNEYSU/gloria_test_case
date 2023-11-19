import 'package:flutter/material.dart';
import 'package:gloria_test_case/core/constants/index.dart';
import 'package:gloria_test_case/core/extension/date.dart';
import 'package:gloria_test_case/core/extension/index.dart';

class DateCard extends StatelessWidget {
  const DateCard({super.key, required this.dateTime});
  final DateTime? dateTime;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width * 0.08,
      height: context.height * 0.05,
      padding: const AppPadding.allNormal(),
      decoration:
          BoxDecoration(borderRadius: AppRadius.circular(), color: context.colorSheme.secondary),
      child: Text(
        dateTime?.convertYMD ?? '',
        textAlign: TextAlign.center,
        style: context.textTheme.bodySmall,
      ),
    );
  }
}
