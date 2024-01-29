import 'package:flutter/material.dart';

class ITileCover extends StatelessWidget {
  final double width;
  final Function() onClick;
  final Widget child;

  const ITileCover({
    Key? key,
    required this.width,
    required this.onClick,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: TextButton(
        onPressed: onClick,
        child: child,
      ),
    );
  }
}
