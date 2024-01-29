
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

import 'validators.dart';

class ITextField extends StatelessWidget {
  final TextEditingController? textController;
  final double? width;
  final double? height;
  final FieldValidator? validator;
  final Function(String)? onChanged;
  final EdgeInsetsGeometry? padding;
  final String? labelText;
  final String? hintText;
  final bool isInitialInteraction;
  final String? initialValue;
  final int? maxLines;
  final bool? enabled;
  final bool obscureText;

  const ITextField({
    Key? key,
    this.textController,
    this.width,
    this.height,
    this.validator,
    this.padding,
    this.labelText,
    this.hintText,
    this.isInitialInteraction = true,
    this.onChanged,
    this.initialValue,
    this.maxLines,
    this.enabled,
    this.obscureText = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textFieldDecoration = InputDecoration(
      contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
      hintText: hintText,
      //hintStyle: ThemeTextStyle.label.copyWith(color: ThemeColor.SecondaryText),
      //enabledBorder: borderWithColor(ThemeColor.BorderColor),
      //focusedBorder: borderWithColor(ThemeColor.PrimaryPurple),
      //errorBorder: borderWithColor(ThemeColor.ErrorRed),
      //focusedErrorBorder: borderWithColor(ThemeColor.ErrorRed),
      floatingLabelBehavior: FloatingLabelBehavior.always,
    );

    final conditionalLabelText = labelText != null
        ? Padding(
            padding: const EdgeInsets.only(bottom: 4.0, left: 4.0),
            child: Text(
              labelText!,
              style: Theme.of(context).typography.black.labelMedium,
            ),
          )
        : const SizedBox();

    final autoValidateMode = isInitialInteraction ? null : AutovalidateMode.onUserInteraction;


    return Padding(
      padding: padding ?? const EdgeInsets.all(0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          conditionalLabelText,
          TextFormField(
            initialValue: initialValue,
            controller: textController,
            decoration: textFieldDecoration,
            validator: validator ?? EmptyValidator(),
            autovalidateMode: autoValidateMode,
            onChanged: onChanged,
            maxLines: maxLines ?? 1,
            onTapOutside: (_) => FocusScope.of(context).unfocus(),
            enabled: enabled,
            obscureText: obscureText,
          ),
        ],
      ),
    );
  }
}