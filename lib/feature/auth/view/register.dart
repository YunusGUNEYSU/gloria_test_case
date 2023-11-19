import 'package:flutter/material.dart';
import 'package:gloria_test_case/core/extension/index.dart';
import 'package:gloria_test_case/core/helper/validation.dart';

import 'package:gloria_test_case/feature/auth/view/register_mixin.dart';

import '../../../core/constants/index.dart';
import '../../../util/widget/button.dart';
import '../../../util/widget/text_form_field.dart';

final class RegisterView extends StatefulWidget {
  const RegisterView({super.key, this.onTap});
  final VoidCallback? onTap;
  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> with RegisterMixin {
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
                      prefixIcon: const Icon(
                        Icons.email_outlined,
                      ),
                      controller: emailController,
                      hintText: 'Email...'),
                  SizedBox(
                    height: context.height * 0.02,
                  ),
                  AppTextFormField(
                    suffixIcon: InkWell(
                      onTap: () => changePasswordVisibility(),
                      child: _isSecure
                          ? const Icon(Icons.visibility)
                          : const Icon(Icons.visibility_off),
                    ),
                    validator: (val) => ValidationService.passwordValidation(val ?? ''),
                    prefixIcon: const Icon(
                      Icons.lock,
                    ),
                    controller: passwordController,
                    hintText: 'Password...',
                    isSecure: _isSecure,
                  ),
                  SizedBox(
                    height: context.height * 0.02,
                  ),
                  AppTextFormField(
                    validator: (val) => ValidationService.nameValidation(val ?? ''),
                    prefixIcon: const Icon(
                      Icons.home_outlined,
                    ),
                    controller: hotelNameController,
                    hintText: 'Hotel Name...',
                  ),
                  SizedBox(
                    height: context.height * 0.05,
                  ),
                  AppButton(
                    buttonText: 'Register',
                    onTap: () async {
                      if (formKey.currentState!.validate()) {
                        await register(context);
                      }
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account?\t",
                        style: context.textTheme.bodyMedium
                            ?.copyWith(color: context.colorSheme.inversePrimary),
                      ),
                      TextButton(
                        onPressed: widget.onTap,
                        //Navigator.pushReplacementNamed(context, RoutePath.login.path),
                        child: Text(
                          'Login Here',
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
