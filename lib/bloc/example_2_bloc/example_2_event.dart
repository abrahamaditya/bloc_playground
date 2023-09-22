import 'package:equatable/equatable.dart';

abstract class Example2CompleteEvent extends Equatable {}

class InitEvent extends Example2CompleteEvent {
  InitEvent();
  @override
  List<Object?> get props => [];
}

class FetchExample2CompleteEvent extends Example2CompleteEvent {
  final String? color;
  FetchExample2CompleteEvent({required this.color});
  @override
  List<Object?> get props => [];
}
