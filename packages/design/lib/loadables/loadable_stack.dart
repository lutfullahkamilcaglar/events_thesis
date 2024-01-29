import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoadableStack <C extends StateStreamable<S>, S extends Equatable, L extends S> extends StatelessWidget {
  final Widget child;
  final Widget loadingWidget;

  const LoadableStack({
    Key? key,
    required this.child,
    required this.loadingWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        BlocBuilder<C, S>(
          builder: (context, state) {
            return AnimatedSwitcher(
              duration: const Duration(milliseconds: 400),
              child: _getLoadingWidget(state is L),
            );
          },
        ),
      ],
    );
  }

  Widget _getLoadingWidget(bool isLoading) {
    if (isLoading) {
      return loadingWidget;
    } else {
      return SizedBox(key: UniqueKey());
    }
  }
}
