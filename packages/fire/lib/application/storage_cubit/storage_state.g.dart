// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'storage_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$StorageViewStateObservable on StorageViewStateObservableBase, Store {
  late final _$stateAtom =
      Atom(name: 'StorageViewStateObservableBase.state', context: context);

  @override
  StorageViewState get state {
    _$stateAtom.reportRead();
    return super.state;
  }

  @override
  set state(StorageViewState value) {
    _$stateAtom.reportWrite(value, super.state, () {
      super.state = value;
    });
  }

  late final _$effectAtom =
      Atom(name: 'StorageViewStateObservableBase.effect', context: context);

  @override
  StorageEffect get effect {
    _$effectAtom.reportRead();
    return super.effect;
  }

  @override
  set effect(StorageEffect value) {
    _$effectAtom.reportWrite(value, super.effect, () {
      super.effect = value;
    });
  }

  late final _$StorageViewStateObservableBaseActionController =
      ActionController(
          name: 'StorageViewStateObservableBase', context: context);

  @override
  void onRunning() {
    final _$actionInfo = _$StorageViewStateObservableBaseActionController
        .startAction(name: 'StorageViewStateObservableBase.onRunning');
    try {
      return super.onRunning();
    } finally {
      _$StorageViewStateObservableBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void onSuccess() {
    final _$actionInfo = _$StorageViewStateObservableBaseActionController
        .startAction(name: 'StorageViewStateObservableBase.onSuccess');
    try {
      return super.onSuccess();
    } finally {
      _$StorageViewStateObservableBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void onCancelled() {
    final _$actionInfo = _$StorageViewStateObservableBaseActionController
        .startAction(name: 'StorageViewStateObservableBase.onCancelled');
    try {
      return super.onCancelled();
    } finally {
      _$StorageViewStateObservableBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void onError() {
    final _$actionInfo = _$StorageViewStateObservableBaseActionController
        .startAction(name: 'StorageViewStateObservableBase.onError');
    try {
      return super.onError();
    } finally {
      _$StorageViewStateObservableBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void onPaused() {
    final _$actionInfo = _$StorageViewStateObservableBaseActionController
        .startAction(name: 'StorageViewStateObservableBase.onPaused');
    try {
      return super.onPaused();
    } finally {
      _$StorageViewStateObservableBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resetEffect() {
    final _$actionInfo = _$StorageViewStateObservableBaseActionController
        .startAction(name: 'StorageViewStateObservableBase.resetEffect');
    try {
      return super.resetEffect();
    } finally {
      _$StorageViewStateObservableBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
state: ${state},
effect: ${effect}
    ''';
  }
}
