import 'dart:async';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'usecase.freezed.dart';

/// Base class for all usecases.
abstract class UseCase<Type, Params> {
  FutureOr<Type> call(Params params);
}

@freezed
class NoParams with _$NoParams {
  const factory NoParams() = _NoParams;
}
