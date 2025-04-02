import 'package:flutter/material.dart';
import 'package:flutter_template/authentication/auth_navigator.dart';
import 'package:flutter_template/common/custom_alert_dialog.dart';

class AuthPageFactory {

  static Widget loginPage(final Color primaryColor, final BuildContext context) {
    return GeneralisedAuthPage(
      title: 'Login',
      primaryColor: primaryColor,
      canInsertPassword: true,
      mainButtonText: "Log In",
      containsForgotButton: true,
      smallEndLineText: 'Don\'t have an account?',
      smallEndLinePrompt: 'Sign Up',
      onMainButtonClick: () {
        print("Logging in...");
      },
      onForgotPassword: () {
        AuthNavigator.goToForgotPassword(context);
      },
      onSmallEndLinePrompt: () {
        AuthNavigator.goToSignUp(context);
      },
    );
  }

  static Widget SignUpPage(final Color primaryColor, final BuildContext context) {
    return GeneralisedAuthPage(
      title: 'Sign up',
      primaryColor: primaryColor,
      canInsertPassword: true,
      mainButtonText: "Sign up",
      containsForgotButton: false,
      smallEndLineText: 'Already have an account?',
      smallEndLinePrompt: 'Log In',
      onMainButtonClick: () {
        CustomAlertDialog.okDialog(
          context: context,
          message: 'Sign up succesful!',
          primaryColor: primaryColor,
          title: 'Info',
          onOkPressed: () => AuthNavigator.goToLogin(context)
        );
      },
      onForgotPassword: () { },
      onSmallEndLinePrompt: () {
        AuthNavigator.goToLogin(context);
      },
    );
  }

  static Widget ResetPasswordPage(final Color primaryColor, final BuildContext context) {
    return GeneralisedAuthPage(
      title: 'Reset password',
      primaryColor: primaryColor,
      canInsertPassword: false,
      mainButtonText: "Send reset link",
      containsForgotButton: false,
      smallEndLineText: 'Remembered your password?',
      smallEndLinePrompt: 'Log In',
      onMainButtonClick: () {
        CustomAlertDialog.okDialog(
          context: context,
          title: 'Info',
          message: 'Message sent to your email.',
          onOkPressed: () => AuthNavigator.goToLogin(context),
          primaryColor: primaryColor,
        );
      },
      onForgotPassword: () { },
      onSmallEndLinePrompt: () {
        AuthNavigator.goToLogin(context);
      },
    );
  }
}

class GeneralisedAuthPage extends StatefulWidget {
  final String title;
  final String emailLabel;
  final String passwordLabel;
  final bool canInsertPassword;
  final String mainButtonText;
  final String forgotPasswordText;
  final bool containsForgotButton;
  final String smallEndLineText;
  final String smallEndLinePrompt;
  final VoidCallback onMainButtonClick;
  final VoidCallback onForgotPassword;
  final VoidCallback onSmallEndLinePrompt;
  final Color primaryColor;

  const GeneralisedAuthPage({
    Key? key,
    required this.title,
    this.emailLabel = 'Email',
    this.passwordLabel = 'Password',
    required this.canInsertPassword,
    required this.mainButtonText,
    this.forgotPasswordText = 'Forgot Password?',
    required this.containsForgotButton,
    required this.smallEndLineText,
    required this.smallEndLinePrompt,
    required this.onMainButtonClick,
    required this.onForgotPassword,
    required this.onSmallEndLinePrompt,
    required this.primaryColor,
  }) : super(key: key);

  @override
  _GeneralisedAuthPageState createState() => _GeneralisedAuthPageState();
}

class _GeneralisedAuthPageState extends State<GeneralisedAuthPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: widget.primaryColor,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const SizedBox(height: 40),
                Image.asset(
                  'assets/logo.png',
                  width: 120,
                  height: 120,
                ),
                const SizedBox(height: 40),
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    labelText: widget.emailLabel,
                    labelStyle: TextStyle(color: Colors.grey[700]),
                    prefixIcon: Icon(Icons.person_outline, color: widget.primaryColor),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Colors.grey[300]!, width: 1.5),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: widget.primaryColor, width: 1.5),
                    ),
                    filled: true,
                    fillColor: Colors.grey[50],
                    contentPadding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                ),
                const SizedBox(height: 12),
                if (widget.canInsertPassword)
                  TextField(
                    controller: passwordController,
                    obscureText: !isPasswordVisible,
                    decoration: InputDecoration(
                      labelText: widget.passwordLabel,
                      labelStyle: TextStyle(color: Colors.grey[700]),
                      prefixIcon: Icon(Icons.lock_outline, color: widget.primaryColor),
                      suffixIcon: IconButton(
                        icon: Icon(
                          isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                          color: Colors.grey[600],
                        ),
                        onPressed: () {
                          setState(() {
                            isPasswordVisible = !isPasswordVisible;
                          });
                        },
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.grey[300]!, width: 1.5),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: widget.primaryColor, width: 1.5),
                      ),
                      filled: true,
                      fillColor: Colors.grey[50],
                      contentPadding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                  ),
                const SizedBox(height: 16),
                if (widget.containsForgotButton)
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: widget.onForgotPassword,
                      child: Text(
                        widget.forgotPasswordText,
                        style: TextStyle(
                          color: widget.primaryColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: widget.onMainButtonClick,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: widget.primaryColor,
                      foregroundColor: Colors.white,
                    ),
                    child: Text(widget.mainButtonText),
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(widget.smallEndLineText),
                    TextButton(
                      onPressed: widget.onSmallEndLinePrompt,
                      child: Text(
                        widget.smallEndLinePrompt,
                        style: TextStyle(
                          color: widget.primaryColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
