import 'package:flutter_tokonih/core/error/failure.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

extension AsyncValueFailureX<T> on AsyncValue<T> {
  /// Mengambil error jika error-nya bertipe Failure, selain itu return null
  Failure? get failure =>
      maybeWhen(error: (e, _) => e is Failure ? e : null, orElse: () => null);

  /// Mengambil message jika error-nya bertipe Failure
  String? get failureMessage => failure?.message;
}
