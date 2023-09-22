import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_playground/widget/primary_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bloc_playground/bloc/example_2_bloc/example_2_bloc.dart';
import 'package:bloc_playground/bloc/example_2_bloc/example_2_state.dart';
import 'package:bloc_playground/bloc/example_2_bloc/example_2_event.dart';

class Example2 extends StatelessWidget {
  const Example2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (BuildContext context, Widget? child) => MultiBlocProvider(
        providers: [
          //BlocProvider(create: (_) => Example2BasicBloc()),
          BlocProvider(
            create: (_) => Example2CompleteBloc(),
          ),
        ],
        child: Scaffold(
          body: // BlocBuilder<Example2BasicBloc, MaterialColor>(
              BlocBuilder<Example2CompleteBloc, Example2CompleteState>(
            builder: (context, state) {
              if (state is Example2CompleteSuccess) {
                Color? activeColor;

                if (state.color == Colors.red) {
                  activeColor = Colors.red;
                } else if (state.color == Colors.yellow) {
                  activeColor = Colors.yellow;
                } else if (state.color == Colors.green) {
                  activeColor = Colors.green;
                }

                return Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.black,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 100,
                          height: 300,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.white, width: 2.0),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                width: 65,
                                height: 65,
                                decoration: BoxDecoration(
                                  color: activeColor == Colors.red
                                      ? activeColor
                                      : Colors.grey,
                                  shape: BoxShape.circle,
                                ),
                              ),
                              Container(
                                width: 65,
                                height: 65,
                                decoration: BoxDecoration(
                                  color: activeColor == Colors.yellow
                                      ? activeColor
                                      : Colors.grey,
                                  shape: BoxShape.circle,
                                ),
                              ),
                              Container(
                                width: 65,
                                height: 65,
                                decoration: BoxDecoration(
                                  color: activeColor == Colors.green
                                      ? activeColor
                                      : Colors.grey,
                                  shape: BoxShape.circle,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 50),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            PrimaryButton(
                              text: "Berhenti",
                              textColor: Colors.white,
                              backgroundColor: Colors.red,
                              borderColor: Colors.white,
                              onPressed: () {
                                // BlocProvider.of<Example2BasicBloc>(context)
                                //     .add("Berhenti");
                                BlocProvider.of<Example2CompleteBloc>(context)
                                    .add(FetchExample2CompleteEvent(
                                        color: "Berhenti"));
                              },
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            PrimaryButton(
                              text: "Hati-Hati",
                              textColor: Colors.white,
                              backgroundColor: Colors.yellow.shade700,
                              borderColor: Colors.white,
                              onPressed: () {
                                // BlocProvider.of<Example2BasicBloc>(context)
                                //     .add("Hati-Hati");
                                BlocProvider.of<Example2CompleteBloc>(context)
                                    .add(FetchExample2CompleteEvent(
                                        color: "Hati-Hati"));
                              },
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            PrimaryButton(
                              text: "Jalan",
                              textColor: Colors.white,
                              backgroundColor: Colors.green,
                              borderColor: Colors.white,
                              onPressed: () {
                                // BlocProvider.of<Example2BasicBloc>(context)
                                //     .add("Jalan");
                                BlocProvider.of<Example2CompleteBloc>(context)
                                    .add(FetchExample2CompleteEvent(
                                        color: "Jalan"));
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
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
