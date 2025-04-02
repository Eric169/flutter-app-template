import 'package:flutter/material.dart';
import 'package:flutter_template/authentication/auth_page_factory.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  final MaterialColor loginColor = Colors.blue;
  final MaterialColor signUpColor = Colors.green;
  final MaterialColor forgotPasswordColor = Colors.orange;
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Auth Example',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/login',
      routes: {
        '/login': (context) => AuthPageFactory.loginPage(
          loginColor,
          context
        ),
        '/signup': (context) => AuthPageFactory.SignUpPage(
          signUpColor,
          context
        ),
        '/forgot_password': (context) => AuthPageFactory.ResetPasswordPage(
          forgotPasswordColor,
          context
        ),
      },
    );
  }
}
