import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_playground/bloc/example_1_bloc/example_1_state.dart';
import 'package:bloc_playground/bloc/example_1_bloc/example_1_event.dart';

// Basic BLoC 👇🏻
class Example1BasicBloc extends Bloc<String, String> {
  Example1BasicBloc() : super("") {
    on<String>((_, emit) async {
      emit(_);
    });
  }
}

// Complete BLoC 👇🏻
class Example1CompleteBloc
    extends Bloc<Example1CompleteEvent, Example1CompleteState> {
  Example1CompleteBloc() : super(Example1CompleteInitial()) {
    on<FetchExample1CompleteEvent>((_, emit) async {
      try {
        emit(Example1CompleteSuccess(_.color!));
      } catch (e) {
        emit(
          Example1CompleteError(e.toString()),
        );
      }
    });
  }
}
