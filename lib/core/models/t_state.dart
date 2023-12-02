// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:weather_app/core/exceptions/failures.dart';
import 'package:weather_app/core/models/status.dart';

class TState<T> extends Equatable {
  final Status status;
  final Failure? error;
  final T? data;

  const TState({
    this.status = Status.loading,
    this.error,
    this.data,
  });

  TState<T> copyWith({
    Status? status,
    Failure? error,
    T? data,
  }) {
    return TState<T>(
      status: status ?? this.status,
      error: error ?? this.error,
      data: data ?? this.data,
    );
  }

  @override
  List<Object?> get props => [status, error, data];
}
