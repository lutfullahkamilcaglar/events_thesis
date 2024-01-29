import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../resource/assets.dart';
import '../../../../resource/theme_color.dart';


class GoogleButton extends StatelessWidget {
  final double? height;
  final double? width;
  final EdgeInsets? padding;
  final Function() onPressed;

  const GoogleButton({
    Key? key,
    this.height,
    this.width,
    this.padding,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ButtonStyle buttonStyle = OutlinedButton.styleFrom(
      //foregroundColor: ThemeColor.Onyx,
      side: const BorderSide(color: ThemeColor.BorderColor),
    );

    return Padding(
      padding: padding ?? const EdgeInsets.all(0.0),
      child: SizedBox(
        height: height ?? 48.0,
        width: width ?? double.infinity,
        child: OutlinedButton(
          onPressed: onPressed,
          style: buttonStyle,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(Assets.googleIcon),
              const SizedBox(width: 16),
              Text(
                "Continue with Google", //TextData.googleButtonText,
                /*style: ThemeTextStyle.button1
                    .copyWith(color: ThemeColor.SecondaryText),*/
              ),
            ],
          ),
        ),
      ),
    );
  }
}
