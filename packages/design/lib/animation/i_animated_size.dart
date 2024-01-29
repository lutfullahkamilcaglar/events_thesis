import 'package:flutter/material.dart';

class IAnimatedSize extends StatelessWidget {
  final Duration duration;
  final Widget child;

  const IAnimatedSize({
    Key? key,
    required this.child,
    this.duration = const Duration(milliseconds: 300),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSize(
      duration: duration,
      curve: Curves.easeInOut,
      child: child,
    );
  }
}
