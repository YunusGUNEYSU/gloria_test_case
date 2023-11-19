import 'package:flutter/foundation.dart';
import 'package:gloria_test_case/core/error/error_message.dart';
import 'package:gloria_test_case/core/service/constant.dart';
import 'package:gloria_test_case/feature/auth/model/register.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final class AuthProvider extends ChangeNotifier {
  ErrorMessage? message;
  Future<bool> login(String email, String password) async {
    try {
      await supabase.auth.signInWithPassword(email: email, password: password);
      if (supabase.auth.currentSession != null) {
        return true;
      }
    } on AuthException catch (e) {
      print(e.message);
    }
    message = ErrorMessage(message: 'Check your email and password!');
    notifyListeners();
    return false;
  }

  Future<void> register(String email, String password) async {
    try {
      await supabase.auth.signUp(password: password, email: email);
    } on AuthException catch (e) {
      print(e.message);
    }
  }

  Future<void> logOut() async {
    await supabase.auth.signOut();
  }

  Future<void> createUsers(RegisterModel model) async {
    try {
      final PostgrestResponse response = await supabase.from('users').insert(model.toJson());

      print(response.data);
    } catch (e) {
      print(e.toString());
    }
  }
}
