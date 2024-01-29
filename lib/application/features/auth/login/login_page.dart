import 'package:d_events/application/features/auth/util/extensions.dart';
import 'package:d_events/application/resource/theme_color.dart';
import 'package:design/animation/animation_transitions.dart';
import 'package:design/textfield/i_text_field.dart';
import 'package:design/textfield/validators.dart';
import 'package:fire/application/auth_cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'components/google_button.dart';
import 'components/signup_text.dart';

class LoginPage extends StatelessWidget {
  final Function() goSignUpPage;
  final bool isSmallSize;
  const LoginPage({Key? key, required this.goSignUpPage, required this.isSmallSize}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IFadeTransition(
      child: isSmallSize
          ? _LoginForm(goSignUpPage: goSignUpPage)
          : Container(
              color: ThemeColor.DarkPetrol,
              height: double.infinity,
              width: double.infinity,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    width: 500,
                    child: Card(
                      child: _LoginForm(goSignUpPage: goSignUpPage),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}

class _LoginForm extends StatefulWidget {
  final Function() goSignUpPage;
  const _LoginForm({Key? key, required this.goSignUpPage}) : super(key: key);

  @override
  State<_LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<_LoginForm> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  bool isInitialInteraction = true;

  void openInteractionWarnings() {
    setState(() {
      isInitialInteraction = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final validateMode = isInitialInteraction ? AutovalidateMode.disabled : AutovalidateMode.onUserInteraction;
    final cubit = BlocProvider.of<AuthCubit>(context);
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 80),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Sign in to Dialog Events!',
                style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                  color: Colors.black87,
                ),
              ),
            ), // TODO ext
            Form(
              key: formKey,
              autovalidateMode: validateMode,
              child: Column(
                children: [
                  const SizedBox(height: 48),
                  ITextField(
                    labelText: "Email",
                    height: 52,
                    textController: emailController,
                    validator: Validators.emailValidator,
                  ),
                  const SizedBox(height: 24),
                  ITextField(
                    labelText: "Password",
                    height: 52,
                    textController: passwordController,
                    validator: Validators.passwordValidator,
                    obscureText: true,
                  ),
                  const SizedBox(height: 56),
                ],
              ),
            ),
            TextButton(
              onPressed: () => formKey.tryAction(
                ifValid: () => cubit.signIn(emailController.text, passwordController.text),
                ifNotValid: openInteractionWarnings,
              ),
              style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.black87),
              child: Container(
                alignment: Alignment.center,
                width: double.infinity,
                height: 42,
                child: const Text("Sign In"),
              ),
            ),
            const SizedBox(height: 16),
            GoogleButton(onPressed: cubit.signInGoogle),
            const SizedBox(height: 32),
            SignUpText(
              text1: "Don’t have an account?", // TODO ext
              text2: "Sign up!",
              onClick: widget.goSignUpPage,
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
