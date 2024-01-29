import 'package:flutter/material.dart';

import '../../animation/i_animated_size.dart';
import 'tile_cover.dart';

class LogoutButton extends StatelessWidget {
  final Function() onClick;
  final bool isExtended;
  final double width;
  final double extendedWidth;

  const LogoutButton({
    Key? key,
    required this.width,
    required this.extendedWidth,
    required this.isExtended,
    required this.onClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final button = ITileCover(
        width: isExtended ? extendedWidth : width,
        onClick: onClick,
        child: isExtended ? const _Extended() : const _Closed(),
    );
    return IAnimatedSize(
      child: button,
    );
  }
}

class _Extended extends StatelessWidget {
  const _Extended({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: const [
        Icon(Icons.logout_rounded),
        SizedBox(width: 32.0),
        Text("Log out"),
      ],
    );
  }
}

class _Closed extends StatelessWidget {
  const _Closed({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Icon(Icons.logout_rounded);
  }
}
