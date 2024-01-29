import 'package:animations/animations.dart';
import 'package:flutter/cupertino.dart';

class SharedAxisTransitionBuilder extends StatelessWidget {
  final SharedAxisTransitionType transitionType;
  final bool condition;
  final Widget child1;
  final Widget child2;
  final Duration duration;

  const SharedAxisTransitionBuilder({
    Key? key,
    this.transitionType = SharedAxisTransitionType.vertical,
    required this.condition,
    required this.child1,
    required this.child2,
    this.duration = const Duration(milliseconds: 300),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageTransitionSwitcher(
      duration: duration,
      reverse: !condition,
      transitionBuilder: (
        Widget child,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
      ) => SharedAxisTransition(
        animation: animation,
        secondaryAnimation: secondaryAnimation,
        transitionType: transitionType,
        child: child,
      ),
      child: condition ? child1 : child2,
    );
  }
}
