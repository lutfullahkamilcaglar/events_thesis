// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'global_auth_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$GlobalAuthStateObservable on GlobalAuthStateObservableBase, Store {
  late final _$stateAtom =
      Atom(name: 'GlobalAuthStateObservableBase.state', context: context);

  @override
  GlobalAuthViewState get state {
    _$stateAtom.reportRead();
    return super.state;
  }

  @override
  set state(GlobalAuthViewState value) {
    _$stateAtom.reportWrite(value, super.state, () {
      super.state = value;
    });
  }

  late final _$GlobalAuthStateObservableBaseActionController =
      ActionController(name: 'GlobalAuthStateObservableBase', context: context);

  @override
  void onUserReceived(User? user) {
    final _$actionInfo = _$GlobalAuthStateObservableBaseActionController
        .startAction(name: 'GlobalAuthStateObservableBase.onUserReceived');
    try {
      return super.onUserReceived(user);
    } finally {
      _$GlobalAuthStateObservableBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
state: ${state}
    ''';
  }
}
