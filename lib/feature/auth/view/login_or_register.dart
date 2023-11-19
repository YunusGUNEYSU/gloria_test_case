import 'package:flutter/material.dart';
import 'package:gloria_test_case/feature/auth/view/login.dart';
import 'package:gloria_test_case/feature/auth/view/register.dart';
class LoginOrRegister extends StatefulWidget {
  const LoginOrRegister({super.key});

  @override
  State<LoginOrRegister> createState() => _LoginOrRegisterState();
}

class _LoginOrRegisterState extends State<LoginOrRegister> {
  bool isLogin = false;

  void toggleView() {
    setState(() {
      isLogin = !isLogin;
    });
  }

  @override
  Widget build(BuildContext context) {
    return 
      isLogin
            ? RegisterView(
                onTap: () => toggleView(),
              )
            : LoginView(
                onTap: () => toggleView(),
              );
    
  
  }
}
