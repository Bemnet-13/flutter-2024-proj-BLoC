import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import './failures.dart';
import '../../domain/core/errors.dart';


@immutable
abstract class ValueObject<T> {
  Either<ValueFailure<T>, T> get value;

  const ValueObject();

  bool isValid() => value.isRight();

  // Factory constructor for creating an instance of ValueObject
    /// Throws [UnexpectedValueError] containing the [ValueFailure]
  T getOrCrash() {
    // id = identity - same as writing (right) => right
    return value.fold((f) => throw UnexpectedValueError(f), id);
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    return o is ValueObject<T> && o.value == value;
  }

  @override
  int get hashCode => value.hashCode;

  
  @override
  String toString() => 'Value($value)';
}