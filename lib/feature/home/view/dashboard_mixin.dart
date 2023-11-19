import 'package:flutter/material.dart';

import 'package:gloria_test_case/feature/home/provider/home_provider.dart';

import 'package:gloria_test_case/feature/home/view/dashboard.dart';
import 'package:provider/provider.dart';

mixin DashBoardMixin on State<DashBoardView> {
  late final TextEditingController menuTextController;
  @override
  void initState() {
    super.initState();
    menuTextController = TextEditingController();
    context.read<HomeProvider>().fetchPlace();
  }

  @override
  void dispose() {
    menuTextController.dispose();
    super.dispose();
  }
}
