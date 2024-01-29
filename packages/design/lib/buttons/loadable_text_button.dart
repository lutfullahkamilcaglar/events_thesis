import 'package:design/buttons/i_text_button.dart';
import 'package:flutter/material.dart';

import 'loading_button.dart';


class LoadableTextButton extends StatelessWidget {
  final String text1;
  final Color? color1;
  final Color? foregroundColor1;
  final Function() onTap1;

  final String text2;
  final Color? color2;
  final Color? foregroundColor2;
  final Function() onTap2;

  final String? loadingText;
  final Color? loadingColor;
  final bool condition;
  final bool isLoading;

  static final Key _key1 = UniqueKey();
  static final Key _key2 = UniqueKey();

  const LoadableTextButton({
    Key? key,
    required this.text1,
    required this.color1,
    required this.text2,
    required this.color2,
    this.loadingText,
    this.loadingColor,
    required this.condition,
    required this.isLoading, required this.onTap1, required this.onTap2,
    this.foregroundColor1, this.foregroundColor2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      child: _getButton(),
    );
  }

  Widget _getButton() {
    if (isLoading) {
      return LoadingButton(key: UniqueKey(), message: loadingText);
    } else if (condition) {
      return ITextButton(
        key: _key1,
        backgroundColor: color1,
        foregroundColor: foregroundColor1,
        childText: text1,
        onPressed: onTap1,
      );
    } else {
      return ITextButton(
        key: _key2,
        backgroundColor: color2,
        foregroundColor: foregroundColor2,
        childText: text2,
        onPressed: onTap2,
      );
    }
  }
}


