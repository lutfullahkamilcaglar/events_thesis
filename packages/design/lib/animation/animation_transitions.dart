import 'package:flutter/cupertino.dart';

class IAnimatedCrossFade extends StatelessWidget {
  final Widget firstChild;
  final Widget secondChild;
  final bool condition;
  final Duration duration;
  final AlignmentGeometry alignment;

  const IAnimatedCrossFade({
    Key? key,
    required this.firstChild,
    required this.secondChild,
    required this.condition,
    this.duration = const Duration(milliseconds: 300),
    this.alignment = Alignment.topCenter,
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
            Positioned(
              key: topChildKey,
              child: topChild,
            ),
          ],
        );
      },
    );
  }
}

class IFadeTransition extends StatelessWidget {
  final Widget child;
  const IFadeTransition({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      child: child,
      transitionBuilder: (child, animation) => FadeTransition(opacity: animation, child: child,),
    );
  }
}

class ISizeTransition extends StatelessWidget {
  final Widget child;
  const ISizeTransition({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      child: child,
      transitionBuilder: (child, animation) => SizeTransition(
        sizeFactor: animation,
        child: child,
      ),
    );
  }
}

