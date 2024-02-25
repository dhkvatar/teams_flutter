import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:go_router/go_router.dart';
import 'package:teams/app/di/di.dart';
import 'package:teams/presentation/blocs/sign_up/sign_up_bloc.dart';
import 'package:teams/presentation/blocs/sign_up/sign_up_event.dart';
import 'package:teams/presentation/blocs/sign_up/sign_up_state.dart';
import 'package:teams/presentation/flows/login_flow.dart';
import 'package:teams/presentation/ui/components/input_textfield.dart';
import 'package:teams/presentation/ui/components/password_textfield.dart';
import 'package:teams/presentation/ui/components/submit_button.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SafeArea(
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
                  _NameInput(),

                  const SizedBox(height: 10),

                  // Phone input
                  _PhoneInput(),

                  const SizedBox(height: 10),

                  // Email input
                  _EmailInput(),

                  const SizedBox(height: 10),

                  // Password input
                  _PasswordInput(),

                  const SizedBox(height: 10),

                  // Confirm password input
                  _ConfirmPasswordInput(),

                  const SizedBox(height: 50),

                  // Submit button
                  _SubmitButton(),

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
                                  .copyWith(color: Colors.orange),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  context.go(getIt<LoginFlow>().loginRoutePath);
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
    return BlocBuilder<SignUpBloc, SignUpState>(
      builder: (ctx, state) => state.formzSubmissionStatus.isInProgress
          ? const CircularProgressIndicator()
          : SubmitButton(
              buttonText: 'Sign Up',
              onPressed: state.isValid
                  ? () {
                      context.read<SignUpBloc>().add(const SignUpSubmitted());
                    }
                  : null,
            ),
    );
  }
}

class _ConfirmPasswordInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpBloc, SignUpState>(
      buildWhen: (previous, current) =>
          previous.confirmPassword != current.confirmPassword,
      builder: (ctx, state) => PasswordTextField(
        hintText: 'Confirm Password',
        onChanged: (confirmPassword) {
          context
              .read<SignUpBloc>()
              .add(SignUpConfirmPasswordChanged(confirmPassword));
        },
      ),
    );
  }
}

class _PasswordInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpBloc, SignUpState>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (ctx, state) => PasswordTextField(
        hintText: 'Password',
        onChanged: (password) {
          context.read<SignUpBloc>().add(SignUpPasswordChanged(password));
        },
      ),
    );
  }
}

class _EmailInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpBloc, SignUpState>(
      builder: (ctx, state) => InputTextField(
        hintText: 'Email Address',
        inputType: TextInputType.emailAddress,
        onChanged: (email) {
          context.read<SignUpBloc>().add(SignUpEmailChanged(email));
        },
      ),
    );
  }
}

class _PhoneInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpBloc, SignUpState>(
      buildWhen: (previous, current) => previous.phone != current.phone,
      builder: (ctx, state) => InputTextField(
        inputType: TextInputType.phone,
        hintText: 'Phone Number',
        onChanged: (phone) {
          context.read<SignUpBloc>().add(SignUpPhoneChanged(phone));
        },
        errorText: state.phone.displayError != null ? 'invalid phone' : null,
      ),
    );
  }
}

class _NameInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpBloc, SignUpState>(
      buildWhen: (previous, current) => previous.name != current.name,
      builder: (ctx, state) => InputTextField(
        hintText: 'Full Name',
        onChanged: (name) {
          context.read<SignUpBloc>().add(SignUpNameChanged(name));
        },
        errorText: state.name.displayError != null ? 'invalid name' : null,
      ),
    );
  }
}
