import 'package:flutter/cupertino.dart';
import 'package:form_field_validator/form_field_validator.dart';

import '../resource/text_data.dart';

class MatchValidator extends TextFieldValidator {
  final TextEditingController controller;

  MatchValidator({required String errorText, required this.controller})
      : super(errorText);

  @override
  bool isValid(String? value) {
    return value == controller.text;
  }
}

class EmptyValidator extends TextFieldValidator {
  EmptyValidator() : super(TextData.empty);

  @override
  bool isValid(String? value) => true;
}

abstract class Validators {
  static final emailValidator = MultiValidator([
    RequiredValidator(errorText: TextData.passwordRequired),
    EmailValidator(errorText: TextData.invalidEmail),
  ]);

  static final passwordValidator = MultiValidator([
    RequiredValidator(errorText: TextData.passwordRequired),
    MinLengthValidator(8, errorText: TextData.passwordRequiredDigit),
  ]);

  static final requiredValidator =
      RequiredValidator(errorText: TextData.required);

  static MultiValidator requiredMaxValidator(int max) => MultiValidator([
    RequiredValidator(errorText: TextData.required),
    MaxLengthValidator(max, errorText: "max asdf"),
  ]);

  static final emptyValidator = EmptyValidator();

  static MultiValidator passwordConfirmationValidator(TextEditingController controller) =>
      MultiValidator([
        RequiredValidator(errorText: TextData.passwordRequired),
        MinLengthValidator(8, errorText: TextData.passwordRequiredDigit),
        MatchValidator(
          controller: controller,
          errorText: TextData.passwordsNoMatch,
        ),
      ]);
}
