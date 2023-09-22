import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_playground/bloc/example_2_bloc/example_2_state.dart';
import 'package:bloc_playground/bloc/example_2_bloc/example_2_event.dart';

// Basic BLoC 👇🏻
class Example2BasicBloc extends Bloc<String, MaterialColor> {
  Example2BasicBloc() : super(Colors.grey) {
    on<String>((_, emit) async {
      if (_ == "Berhenti") {
        emit(Colors.red);
      } else if (_ == "Hati-Hati") {
        emit(Colors.yellow);
      } else if (_ == "Jalan") {
        emit(Colors.green);
      } else if (_.isEmpty) {
        emit(Colors.grey);
      }
    });
  }
}

// Complete BLoC 👇🏻
class Example2CompleteBloc
    extends Bloc<Example2CompleteEvent, Example2CompleteState> {
  Example2CompleteBloc() : super(Example2CompleteInitial()) {
    on<FetchExample2CompleteEvent>((_, emit) async {
      try {
        if (_.color == "Berhenti") {
          emit(const Example2CompleteSuccess(Colors.red));
        } else if (_.color == "Hati-Hati") {
          emit(const Example2CompleteSuccess(Colors.yellow));
        } else if (_.color == "Jalan") {
          emit(const Example2CompleteSuccess(Colors.green));
        } else if (_.color!.isEmpty) {
          emit(const Example2CompleteSuccess(Colors.grey));
        }
      } catch (e) {
        emit(
          Example2CompleteError(e.toString()),
        );
      }
    });
  }
}
