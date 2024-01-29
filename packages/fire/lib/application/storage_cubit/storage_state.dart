import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobx/mobx.dart';

part 'storage_state.freezed.dart';
part 'storage_state.g.dart';

@freezed
class StorageViewState with _$StorageViewState {
  const StorageViewState._();

  const factory StorageViewState.idle() = _Idle;
  const factory StorageViewState.running() = _Running;
  const factory StorageViewState.paused() = _Paused;
  const factory StorageViewState.success() = _Success;
}

@freezed
class StorageEffect with _$StorageEffect {
  const StorageEffect._();

  const factory StorageEffect.idle() = _IdleEffect;
  const factory StorageEffect.error() = _ErrorEffect;
  const factory StorageEffect.cancelled() = _CancelledEffect;
  const factory StorageEffect.success() = _SuccessEffect;
}

class StorageViewStateObservable = StorageViewStateObservableBase with _$StorageViewStateObservable;

abstract class StorageViewStateObservableBase with Store {
  @observable
  StorageViewState state = const StorageViewState.idle();

  @observable
  StorageEffect effect = const StorageEffect.idle();

  @action
  void onRunning() {
    state = const StorageViewState.running();
  }

  @action
  void onSuccess() {
    state = const StorageViewState.success();
    effect = const StorageEffect.success();
  }

  @action
  void onCancelled() {
    state = const StorageViewState.idle();
    effect = const StorageEffect.cancelled();
  }

  @action
  void onError() {
    state = const StorageViewState.idle();
    effect = const StorageEffect.error();
  }

  @action
  void onPaused() {
    state = const StorageViewState.paused();
  }

  @action
  void resetEffect() {
    effect = const StorageEffect.idle();
  }
}
