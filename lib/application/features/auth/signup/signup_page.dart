import 'package:d_events/application/features/auth/util/extensions.dart';
import 'package:design/animation/animation_transitions.dart';
import 'package:design/textfield/i_text_field.dart';
import 'package:design/textfield/validators.dart';
import 'package:fire/application/auth_cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../resource/theme_color.dart';
import '../login/components/google_button.dart';

class SignUpPage extends StatelessWidget {
  final bool isSmallSize;

  const SignUpPage({
    Key? key,
    required this.isSmallSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IFadeTransition(
      child: isSmallSize
          ? const _SignUpPage()
          : Container(
        color: ThemeColor.DarkPetrol,
        height: double.infinity,
        width: double.infinity,
        child: Stack(
          alignment: Alignment.center,
          children: const [
            SizedBox(
              width: 500,
              child: Card(
                child: _SignUpPage(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SignUpPage extends StatefulWidget {
  const _SignUpPage({Key? key}) : super(key: key);

  @override
  State<_SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<_SignUpPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordCorrectorController = TextEditingController();
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
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          autovalidateMode: validateMode,
          child: Column(
            children: [
              const SizedBox(height: 80),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Sign up to Dialog Events!',
                  style: Theme.of(context).textTheme.headlineLarge!.copyWith(color: Colors.black87),
                ),
              ), // TODO ext
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
              const SizedBox(height: 24),
              ITextField(
                labelText: "Correct Password",
                height: 52,
                textController: passwordCorrectorController,
                validator: Validators.passwordConfirmationValidator(passwordController),
                obscureText: true,
              ),
              const SizedBox(height: 56),
              TextButton(
                onPressed: () => formKey.tryAction(
                  ifValid: () => cubit.signUp(emailController.text, passwordController.text),
                  ifNotValid: openInteractionWarnings,
                ),
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.black87,
                ),
                child: Container(
                  alignment: Alignment.center,
                  width: double.infinity,
                  height: 42,
                  child: const Text("Sign Up"),
                ),
              ),
              const SizedBox(height: 16),
              GoogleButton(onPressed: cubit.signInGoogle),
            ],
          ),
        ),
      ),
    );
  }
}
