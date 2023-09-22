import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';

abstract class Example2CompleteState extends Equatable {
  const Example2CompleteState();
  @override
  List<Object> get props => [];
  get temp => null;
}

class Example2CompleteInitial extends Example2CompleteState {}

class Example2CompleteLoading extends Example2CompleteState {}

class Example2CompleteSuccess extends Example2CompleteState {
  final MaterialColor color;
  const Example2CompleteSuccess(this.color);
  @override
  List<Object> get props => [color];
}

class Example2CompleteError extends Example2CompleteState {
  final String errorMessage;
  const Example2CompleteError(this.errorMessage);
  @override
  List<Object> get props => [errorMessage];
}
