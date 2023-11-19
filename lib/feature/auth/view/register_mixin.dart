import 'package:flutter/material.dart';
import 'package:gloria_test_case/core/routes/route.dart';
import 'package:gloria_test_case/feature/auth/model/register.dart';
import 'package:gloria_test_case/feature/auth/view/register.dart';
import 'package:provider/provider.dart';

import '../provider/provider.dart';

mixin RegisterMixin on State<RegisterView> {
  late final TextEditingController emailController;

  late final TextEditingController passwordController;

  late final TextEditingController hotelNameController;
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    hotelNameController = TextEditingController();
  }

  Future<void> register(BuildContext context) async {
    final authProvider = context.read<AuthProvider>();
    await authProvider.register(emailController.text, passwordController.text);
    await authProvider.createUsers(RegisterModel(
        email: emailController.text,
        password: passwordController.text,
        hotelname: hotelNameController.text));
    if (!mounted) return;
    await Navigator.pushReplacementNamed(
      context,
      RoutePath.home.path,
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    hotelNameController.dispose();
    super.dispose();
  }
}
