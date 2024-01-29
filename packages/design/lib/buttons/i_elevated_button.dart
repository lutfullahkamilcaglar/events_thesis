import 'package:flutter/material.dart';

class IElevatedButton extends StatelessWidget {
  final void Function()? onPressed;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final Widget? child;
  final double height;
  final double width;
  final String? childText;
  final EdgeInsetsGeometry padding;

  const IElevatedButton({
    Key? key,
    this.onPressed,
    this.backgroundColor,
    this.foregroundColor,
    this.child,
    this.childText,
    this.height = 42,
    this.width = double.infinity,
    this.padding = const EdgeInsets.symmetric(horizontal: 16),
  })  : assert(child != null || childText != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: ElevatedButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          foregroundColor: foregroundColor,
          backgroundColor: backgroundColor,
        ),
        child: Container(
          alignment: Alignment.center,
          width: width,
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
