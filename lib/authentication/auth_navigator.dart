import 'package:flutter/material.dart';

class AuthNavigator {
  static void goToLogin(BuildContext context) {
    Navigator.pushReplacementNamed(context, '/login');
  }

  static void goToSignUp(BuildContext context) {
    Navigator.pushReplacementNamed(context, '/signup');
  }

  static void goToForgotPassword(BuildContext context) {
    Navigator.pushReplacementNamed(context, '/forgot_password');
  }
}
