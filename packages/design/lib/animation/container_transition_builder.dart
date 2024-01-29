import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

class ContainerTransitionBuilder extends StatelessWidget {
  final Widget Function(Function() openContainer) child1;
  final Widget child2;

  const ContainerTransitionBuilder({
    Key? key,
    required this.child1,
    required this.child2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _OpenContainerWrapper(
      transitionType: ContainerTransitionType.fade,
      closedBuilder: (BuildContext _, VoidCallback openContainer) {
        return child1(openContainer);
      },
      onClosed: (_) {},
      child: child2,
    );
  }
}

class _OpenContainerWrapper extends StatelessWidget {
  const _OpenContainerWrapper({
    required this.closedBuilder,
    required this.transitionType,
    required this.onClosed,
    required this.child,
  });

  final CloseContainerBuilder closedBuilder;
  final ContainerTransitionType transitionType;
  final ClosedCallback<bool?> onClosed;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return OpenContainer<bool>(
      transitionType: transitionType,
      openBuilder: (BuildContext context, VoidCallback _) {
        return child;
      },
      onClosed: onClosed,
      tappable: false,
      closedBuilder: closedBuilder,
    );
  }
}
