import 'package:equatable/equatable.dart';

abstract class Example1CompleteState extends Equatable {
  const Example1CompleteState();
  @override
  List<Object> get props => [];
  get temp => null;
}

class Example1CompleteInitial extends Example1CompleteState {}

class Example1CompleteLoading extends Example1CompleteState {}

class Example1CompleteSuccess extends Example1CompleteState {
  final String color;
  const Example1CompleteSuccess(this.color);
  @override
  List<Object> get props => [color];
}

class Example1CompleteError extends Example1CompleteState {
  final String errorMessage;
  const Example1CompleteError(this.errorMessage);
  @override
  List<Object> get props => [errorMessage];
}
