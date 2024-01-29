
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SignUpText extends StatelessWidget {
  final Function() onClick;
  final String text1;
  final String text2;

  const SignUpText({
    Key? key,
    required this.onClick,
    required this.text1,
    required this.text2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: RichText(
        text: TextSpan(
          style: Theme.of(context)
              .textTheme
              .labelMedium!
              .copyWith(color: Colors.black87),
          children: [
            TextSpan(text: text1),
            const TextSpan(text: " "),
            TextSpan(
              text: text2,
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.w600,
                  ),
              recognizer: TapGestureRecognizer()..onTap = onClick,
            ),
          ],
        ),
      ),
    );
  }
}
