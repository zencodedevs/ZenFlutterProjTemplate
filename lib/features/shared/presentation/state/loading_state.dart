import 'package:freezed_annotation/freezed_annotation.dart';

part 'loading_state.freezed.dart';

/// A general use loading state which can be used in state management or error handling.
@freezed
class LoadingState<T> with _$LoadingState<T> {
  const LoadingState._();

  const factory LoadingState.initial() = _Initial;

  const factory LoadingState.loading() = _Loading;

  const factory LoadingState.success(T data) = _Success;

  const factory LoadingState.error(String? errorMessage) = _Error;

  bool get isError => maybeWhen(error: (_) => true, orElse: () => false);

  bool get isLoading => maybeWhen(loading: () => true, orElse: () => false);

  bool get isSuccess => maybeWhen(success: (_) => true, orElse: () => false);
}
