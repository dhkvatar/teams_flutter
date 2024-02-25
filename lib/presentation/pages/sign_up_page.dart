import 'package:flutter/material.dart';
import 'package:teams/presentation/ui/components/input_textfield.dart';
import 'package:teams/presentation/ui/components/password_textfield.dart';
import 'package:teams/presentation/ui/components/submit_button.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                const SizedBox(height: 100),

                // Sign up message
                Text(
                  'Sign Up',
                  style: Theme.of(context).textTheme.displaySmall,
                ),

                const SizedBox(height: 50),

                // Name input
                const InputTextField(
                  hintText: 'Full Name',
                ),

                const SizedBox(height: 10),

                // Phone input
                const InputTextField(hintText: 'Phone Number'),

                const SizedBox(height: 10),

                // Email input
                const InputTextField(hintText: 'Email Address'),

                const SizedBox(height: 10),

                // Password input
                const PasswordTextField(hintText: 'Password'),

                const SizedBox(height: 10),

                // Confirm password input
                const PasswordTextField(hintText: 'Confirm Password'),

                const SizedBox(height: 50),

                // Submit button
                const SubmitButton(buttonText: 'Sign Up'),

                const SizedBox(height: 50),

                // Sign in link
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                              text: 'Already have an account? ',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(color: Colors.grey.shade700)),
                          TextSpan(
                            text: 'Sign In',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(
                                  color: Colors.orange,
                                ),
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
      ),
    );
  }
}
