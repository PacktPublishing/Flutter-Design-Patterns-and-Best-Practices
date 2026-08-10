import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class WatchStreamCubit<T> extends Cubit<T> {
  WatchStreamCubit(super.initialState);

  StreamSubscription? _subscription;

  void watchStream(Stream<T> stream) {
    _subscription?.cancel();
    _subscription = stream.listen(
      (state) => emit(state),
      onError: (error) {
        // Handle error appropriately depending on your state shape
      },
    );
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}

class RepositoryException implements Exception {
  final String message;
  final Object? originalError;

  RepositoryException(this.message, [this.originalError]);

  @override
  String toString() => "RepositoryException: $message";

  static Future<T> wrapWrite<T>(Future<T> Function() computation) async {
    try {
      return await computation();
    } catch (e) {
      throw RepositoryException("Failed to write to repository", e);
    }
  }
}
