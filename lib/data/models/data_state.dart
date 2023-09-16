import 'package:equatable/equatable.dart';

abstract class DataState<T> extends Equatable {
  const DataState();

  @override
  List<Object?> get props => [];
}

class DataSuccess<T> extends DataState<T> {
  const DataSuccess(this.data);

  final T data;

  @override
  List<Object?> get props => [data];
}

class DataFailed<T> extends DataState<T> {
  const DataFailed(this.error);

  final Exception error;

  @override
  List<Object?> get props => [error];
}
