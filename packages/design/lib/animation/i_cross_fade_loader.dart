import 'package:flutter/material.dart';

class ICrossFadeLoader extends StatelessWidget {
  final Widget firstChild;
  final Widget secondChild;
  final bool condition;
  final Duration duration;
  final AlignmentGeometry alignment;

  const ICrossFadeLoader({
    Key? key,
    required this.firstChild,
    required this.secondChild,
    required this.condition,
    this.duration = const Duration(milliseconds: 200),
    this.alignment = Alignment.center,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
      firstChild: firstChild,
      secondChild: secondChild,
      crossFadeState: condition ? CrossFadeState.showFirst : CrossFadeState.showSecond,
      duration: duration,
      alignment: alignment,
      layoutBuilder: (topChild, topChildKey, bottomChild, bottomChildKey) {
        return Stack(
          clipBehavior: Clip.none,
          children: <Widget>[
            Positioned(
              top: 0,
              key: bottomChildKey,
              child: bottomChild,
            ),
            Positioned.fill(
              key: topChildKey,
              child: topChild,
            ),
          ],
        );
      },
    );
  }
}