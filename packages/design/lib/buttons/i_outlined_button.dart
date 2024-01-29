import 'package:flutter/material.dart';

class IOutlinedButton extends StatelessWidget {
  final void Function()? onPressed;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final Widget? child;
  final double height;
  final String? childText;
  final EdgeInsetsGeometry padding;

  const IOutlinedButton({
    Key? key,
    this.onPressed,
    this.backgroundColor,
    this.foregroundColor,
    this.child,
    this.childText,
    this.height = 42,
    this.padding = const EdgeInsets.symmetric(horizontal: 16),
  })  : assert(child != null || childText != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: OutlinedButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          foregroundColor: foregroundColor,
          backgroundColor: backgroundColor,
        ),
        child: Container(
          alignment: Alignment.center,
          width: double.infinity,
          height: height,
          child: child ??
              Text(
                childText!,
                textAlign: TextAlign.center,
              ),
        ),
      ),
    );
  }
}
