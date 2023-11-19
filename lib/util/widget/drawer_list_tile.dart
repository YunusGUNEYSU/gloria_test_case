import 'package:flutter/material.dart';
import 'package:gloria_test_case/core/constants/index.dart';
import 'package:gloria_test_case/core/extension/index.dart';

final class DrawerListTile extends StatelessWidget {
  const DrawerListTile({super.key, required this.icon, required this.title, required this.onTap});
  final IconData icon;
  final String title;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const AppPadding.allHigh(),
      child: ListTile(
        title: Text(
          title,
          style: context.textTheme.bodyLarge,
        ),
        leading: Icon(
          icon,
          color: context.colorSheme.inversePrimary,
        ),
        onTap: onTap,
      ),
    );
  }
}
