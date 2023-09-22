import 'package:equatable/equatable.dart';

abstract class Example1CompleteEvent extends Equatable {}

class InitEvent extends Example1CompleteEvent {
  InitEvent();
  @override
  List<Object?> get props => [];
}

class FetchExample1CompleteEvent extends Example1CompleteEvent {
  final String? color;
  FetchExample1CompleteEvent({required this.color});
  @override
  List<Object?> get props => [];
}
