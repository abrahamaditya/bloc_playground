import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_playground/widget/primary_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bloc_playground/bloc/example_1_bloc/example_1_bloc.dart';
import 'package:bloc_playground/bloc/example_1_bloc/example_1_event.dart';
import 'package:bloc_playground/bloc/example_1_bloc/example_1_state.dart';

class Example1 extends StatelessWidget {
  const Example1({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (BuildContext context, Widget? child) => MultiBlocProvider(
        providers: [
          // BlocProvider(create: (_) => Example1BasicBloc()..add("Abu-Abu")),
          BlocProvider(
            create: (_) => Example1CompleteBloc()
              ..add(FetchExample1CompleteEvent(color: "Abu-Abu")),
          ),
        ],
        child: Scaffold(
          body: //BlocBuilder<Example1BasicBloc, String>(
              BlocBuilder<Example1CompleteBloc, Example1CompleteState>(
            builder: (context, state) {
              if (state is Example1CompleteSuccess) {
                return Row(
                  children: [
                    Container(
                      width: 250,
                      color: Colors.black,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          PrimaryButton(
                            text: "Merah",
                            textColor: Colors.white,
                            backgroundColor: Colors.red,
                            borderColor: Colors.white,
                            onPressed: () {
                              // BlocProvider.of<Example1BasicBloc>(context)
                              //     .add("Merah");
                              BlocProvider.of<Example1CompleteBloc>(context)
                                  .add(FetchExample1CompleteEvent(
                                      color: "Merah"));
                            },
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          PrimaryButton(
                            text: "Kuning",
                            textColor: Colors.white,
                            backgroundColor: Colors.yellow.shade700,
                            borderColor: Colors.white,
                            onPressed: () {
                              // BlocProvider.of<Example1BasicBloc>(context)
                              //     .add("Kuning");
                              BlocProvider.of<Example1CompleteBloc>(context)
                                  .add(FetchExample1CompleteEvent(
                                      color: "Kuning"));
                            },
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          PrimaryButton(
                            text: "Hijau",
                            textColor: Colors.white,
                            backgroundColor: Colors.green,
                            borderColor: Colors.white,
                            onPressed: () {
                              // BlocProvider.of<Example1BasicBloc>(context)
                              //     .add("Hijau");
                              BlocProvider.of<Example1CompleteBloc>(context)
                                  .add(FetchExample1CompleteEvent(
                                      color: "Hijau"));
                            },
                          ),
                        ],
                      ),
                    ),
                    if (state.color == "Merah") ...[
                      Expanded(
                        child: Container(
                          color: Colors.red,
                        ),
                      ),
                    ] else if (state.color == "Kuning") ...[
                      Expanded(
                        child: Container(
                          color: Colors.amber,
                        ),
                      ),
                    ] else if (state.color == "Hijau") ...[
                      Expanded(
                        child: Container(
                          color: Colors.green,
                        ),
                      ),
                    ] else if (state.color == "Abu-Abu") ...[
                      Expanded(
                        child: Container(
                          color: Colors.grey,
                        ),
                      ),
                    ]
                  ],
                );
              } else {
                return const SizedBox();
              }
            },
          ),
        ),
      ),
    );
  }
}
