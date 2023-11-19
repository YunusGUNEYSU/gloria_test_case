import 'package:flutter/material.dart';
import 'package:gloria_test_case/core/constants/index.dart';
import 'package:gloria_test_case/core/extension/index.dart';
import 'package:gloria_test_case/feature/home/model/place.dart';

class AppDropDownMenu extends StatelessWidget {
  const AppDropDownMenu(
      {super.key,
      required this.menuController,
      required this.labelText,
      required this.dropdownMenuEntries,
      required this.onSelected});
  final TextEditingController menuController;
  final String labelText;
  final List<DropdownMenuEntry<PlaceModel>> dropdownMenuEntries;
  final ValueChanged<PlaceModel?> onSelected;
  @override
  Widget build(BuildContext context) {
    return DropdownMenu<PlaceModel>(
      width: context.width * 0.25,
      controller: menuController,
      hintText: labelText,
      dropdownMenuEntries: dropdownMenuEntries,
      onSelected: onSelected,
      inputDecorationTheme:
          const InputDecorationTheme(filled: true, contentPadding: AppPadding.allLow()),
    );
  }
}
