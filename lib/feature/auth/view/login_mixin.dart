import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/helper/error_toast.dart';
import '../../../core/routes/route.dart';
import '../provider/provider.dart';
import 'login.dart';

mixin LoginMixin on State<LoginView> {
  late final TextEditingController emailController;

  late final TextEditingController passwordController;
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  Future<void> login(BuildContext context) async {
    final authProvider = context.read<AuthProvider>();
    final isLogin = await authProvider.login(emailController.text, passwordController.text);

    if (!mounted) return;
    if (isLogin == true) {
      await Navigator.of(context).pushReplacementNamed(RoutePath.home.path);
    } else if (isLogin == false) {
      ToastMessage.toastMessage(context, authProvider.message?.message ?? '');
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }
}
