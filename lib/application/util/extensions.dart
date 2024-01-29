import 'package:flutter/material.dart';

extension FormExtensions on GlobalKey<FormState> {
  void tryAction({
    required Function() ifValid,
    required Function() ifNotValid,
  }) async {
    final valid = currentState?.validate();
    if (valid != null && valid) {
      ifValid();
    } else {
      ifNotValid();
    }
  }
}