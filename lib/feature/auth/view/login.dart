import 'package:flutter/material.dart';
import 'package:gloria_test_case/core/extension/index.dart';
import 'package:gloria_test_case/core/helper/validation.dart';
import 'package:gloria_test_case/feature/auth/view/login_mixin.dart';
import 'package:gloria_test_case/util/widget/button.dart';
import 'package:gloria_test_case/util/widget/text_form_field.dart';
import '../../../core/constants/index.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key, this.onTap});
  final VoidCallback? onTap;
  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> with LoginMixin {
  bool _isSecure = true;
  void changePasswordVisibility() {
    setState(() {
      _isSecure = !_isSecure;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Padding(
          padding: const AppPadding.allHigh(),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.account_balance_outlined,
                    size: context.height * 0.1,
                    color: context.colorSheme.inversePrimary,
                  ),
                  SizedBox(
                    height: context.height * 0.02,
                  ),
                  AppTextFormField(
                      validator: (val) => ValidationService.emailValidation(val ?? ''),
                      controller: emailController,
                      hintText: 'Email...',
                      prefixIcon: const Icon(
                        Icons.email_outlined,
                      )),
                  SizedBox(
                    height: context.height * 0.02,
                  ),
                  AppTextFormField(
                    validator: (val) => ValidationService.passwordValidation(val ?? ''),
                    suffixIcon: InkWell(
                      onTap: () => changePasswordVisibility(),
                      child: _isSecure
                          ? const Icon(Icons.visibility)
                          : const Icon(Icons.visibility_off),
                    ),
                    prefixIcon: const Icon(
                      Icons.lock,
                    ),
                    controller: passwordController,
                    hintText: 'Password...',
                    isSecure: _isSecure,
                  ),
                  SizedBox(
                    height: context.height * 0.05,
                  ),
                  AppButton(
                    buttonText: 'Login',
                    onTap: () async {
                      if (formKey.currentState!.validate() && mounted) {
                        await login(context);
                      }
                    },
                  ),
                  SizedBox(
                    height: context.height * 0.01,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account?\t",
                        style: context.textTheme.bodyMedium
                            ?.copyWith(color: context.colorSheme.inversePrimary),
                      ),
                      TextButton(
                        onPressed:
                            widget.onTap, //Navigator.pushNamed(context, RoutePath.register.path),
                        child: Text(
                          'Register Here',
                          style:
                              context.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
