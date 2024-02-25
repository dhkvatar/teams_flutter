import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:go_router/go_router.dart';
import 'package:teams/app/di/di.dart';
import 'package:teams/presentation/blocs/login/login_bloc.dart';
import 'package:teams/presentation/blocs/login/login_event.dart';
import 'package:teams/presentation/blocs/login/login_state.dart';
import 'package:teams/presentation/flows/login_flow.dart';
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
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 150),

                  // Logo or Sign in message
                  Text(
                    'Sign In',
                    style: Theme.of(context).textTheme.displaySmall!,
                  ),

                  const SizedBox(height: 25),

                  Text(
                    'Welcome back!',
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(color: Colors.grey.shade700),
                  ),

                  const SizedBox(height: 25),

                  // username or phone textfield
                  _EmailPhoneInput(emailController: _emailController),

                  const SizedBox(height: 20),

                  // password input
                  _PasswordInput(passwordController: _passwordController),

                  const SizedBox(height: 10),

                  // Forgot password link
                  Padding(
                    padding: const EdgeInsets.only(right: 25.0),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: RichText(
                        text: TextSpan(
                          text: 'Forgot Password?',
                          style:
                              Theme.of(context).textTheme.titleSmall!.copyWith(
                                    color: Colors.orange,
                                  ), //const TextStyle(color: Colors.orange),
                          recognizer: TapGestureRecognizer()..onTap = () {},
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 50),

                  // Button
                  _SubmitButton(),

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
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(color: Colors.grey.shade700),
                            ),
                            TextSpan(
                              text: 'Sign Up',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(color: Colors.orange),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  context
                                      .go(getIt<LoginFlow>().signUpRoutePath);
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
        ),
      ),
    );
  }
}

class _SubmitButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (ctx, state) => state.formzStatus.isInProgress
          ? const CircularProgressIndicator()
          : SubmitButton(
              buttonText: 'Sign In',
              onPressed: state.isValid
                  ? () {
                      context.read<LoginBloc>().add(const LoginSubmitted());
                    }
                  : null,
            ),
    );
  }
}

class _PasswordInput extends StatelessWidget {
  const _PasswordInput({
    required TextEditingController passwordController,
  }) : _passwordController = passwordController;

  final TextEditingController _passwordController;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (ctx, state) => PasswordTextField(
        controller: _passwordController,
        hintText: 'Password',
        onChanged: (input) {
          context.read<LoginBloc>().add(LoginPasswordChanged(input));
        },
      ),
    );
  }
}

class _EmailPhoneInput extends StatelessWidget {
  const _EmailPhoneInput({
    required TextEditingController emailController,
  }) : _emailController = emailController;

  final TextEditingController _emailController;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) =>
          previous.emailPhone != current.emailPhone,
      builder: (ctx, state) => InputTextField(
        controller: _emailController,
        hintText: 'Email or Phone Number',
        onChanged: (input) {
          context.read<LoginBloc>().add(LoginEmailChanged(input));
        },
      ),
    );
  }
}
