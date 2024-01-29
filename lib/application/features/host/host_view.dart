import 'package:auto_route/auto_route.dart';
import 'package:d_events/application/bloc/authorization/authorization_cubit.dart';
import 'package:d_events/application/bloc/authorization/authorization_state.dart';
import 'package:d_events/application/features/main/bloc/main_cubit.dart';
import 'package:d_events/application/routes/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../error/error_view.dart';
import 'components/host_drawer.dart';

class HostView extends StatelessWidget {
  const HostView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthorizationCubit, AuthorizationState>(
      listener: (context, state) {
        BlocProvider.of<MainCubit>(context).onAuthorizationStateReceived(state);
      },
      builder: (context, state) {
        return Scaffold(
          drawer: Padding(
            padding: const EdgeInsets.all(6.0),
            child: HostDrawer(
              setActiveIndex: (index) => _setTabIndex(context, index),
              state: state,
            ),
          ),
          appBar: AppBar(),
          body: _body(state),
        );
      },
    );
  }

  Widget _body(AuthorizationState state) {
    if (state is LoadingState) {
      return const Center(child: CircularProgressIndicator());
    } else if (state is NotActiveState) {
      return const Center(
        child: ErrorView('Contact with an admin to activate your account'),
      );
    } else if (state is ActiveState) {
      return const _ActiveHostView();
    } else {
      return const Center(
        child: ErrorView('Unexpected error happened'),
      );
    }
  }

  void _setTabIndex(BuildContext context, int index) {
    final router = context.innerRouterOf<TabsRouter>(HostPageRoute.name);
    router?.setActiveIndex(index);
    context.router.pop();
  }
}

class _ActiveHostView extends StatelessWidget {
  const _ActiveHostView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: const [
        MainPageRoute(),
        ProfilePageRoute(),
      ],
      builder: (context, child, animation) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
    );
  }
}
