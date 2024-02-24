import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:teams/presentation/ui/components/input_textfield.dart';
import 'package:teams/presentation/ui/components/password_textfield.dart';
import 'package:teams/presentation/ui/components/submit_button.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 150),

              // Logo or Sign in message
              const Text(
                'Sign In',
                style: TextStyle(fontSize: 32),
              ),

              const SizedBox(height: 25),

              Text(
                'Welcome back!',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[700],
                ),
              ),

              const SizedBox(height: 25),

              // username or phone textfield
              InputTextField(
                controller: _emailController,
                hintText: 'Email or Phone Number',
              ),

              const SizedBox(height: 20),

              // password input
              PasswordTextField(
                controller: _passwordController,
                hintText: 'Password',
              ),

              const SizedBox(height: 10),

              // Forgot password link
              Padding(
                padding: const EdgeInsets.only(right: 25.0),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: RichText(
                    text: TextSpan(
                      text: 'Forgot Password?',
                      style: TextStyle(color: Colors.orange),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          print('Forgot Password pressed');
                        },
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 50),

              // Button
              const SubmitButton(buttonText: 'Sign In'),

              const SizedBox(height: 20),

              // Sign-up link
              Padding(
                padding: const EdgeInsets.only(left: 25.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Don\'t have an account? ',
                          style: TextStyle(color: Colors.grey.shade700),
                        ),
                        TextSpan(
                          text: 'Sign Up',
                          style: TextStyle(color: Colors.orange),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              print('pressed Sign Up link');
                            },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
