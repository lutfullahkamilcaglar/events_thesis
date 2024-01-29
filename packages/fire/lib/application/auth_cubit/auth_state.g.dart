// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AuthStateObservable on AuthStateObservableBase, Store {
  late final _$viewStateAtom =
      Atom(name: 'AuthStateObservableBase.viewState', context: context);

  @override
  AuthViewState get viewState {
    _$viewStateAtom.reportRead();
    return super.viewState;
  }

  @override
  set viewState(AuthViewState value) {
    _$viewStateAtom.reportWrite(value, super.viewState, () {
      super.viewState = value;
    });
  }

  late final _$AuthStateObservableBaseActionController =
      ActionController(name: 'AuthStateObservableBase', context: context);

  @override
  void onSuccess(UserCredential userCredential) {
    final _$actionInfo = _$AuthStateObservableBaseActionController.startAction(
        name: 'AuthStateObservableBase.onSuccess');
    try {
      return super.onSuccess(userCredential);
    } finally {
      _$AuthStateObservableBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void onError(String? message) {
    final _$actionInfo = _$AuthStateObservableBaseActionController.startAction(
        name: 'AuthStateObservableBase.onError');
    try {
      return super.onError(message);
    } finally {
      _$AuthStateObservableBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void onLoading() {
    final _$actionInfo = _$AuthStateObservableBaseActionController.startAction(
        name: 'AuthStateObservableBase.onLoading');
    try {
      return super.onLoading();
    } finally {
      _$AuthStateObservableBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
viewState: ${viewState}
    ''';
  }
}
