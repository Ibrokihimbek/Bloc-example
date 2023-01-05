import 'package:bloc_example/bloc/area_calc/are_calc_cubit.dart';
import 'package:bloc_example/bloc/area_calc/area_calc_stae.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AreaCalcPage extends StatelessWidget {
  const AreaCalcPage({super.key});

  @override
  Widget build(BuildContext context) {
    AreaCalcCubit areaCalcCubit = AreaCalcCubit();
    return BlocProvider(
      create: (context) => areaCalcCubit,
      child: BlocBuilder<AreaCalcCubit, AreaCalcState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Areacalc screen'),
            ),
            body: Padding(
              padding: const EdgeInsets.all(40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  state is RectangleAreState
                      ? Text(
                          state.rectangleResult.toString(),
                          style: const TextStyle(fontSize: 38),
                        )
                      : state is TriangleAreaState
                          ? Text(
                              state.triangleResult.toString(),
                              style: const TextStyle(fontSize: 38),
                            )
                          : state is CircleAreaState
                              ? Text(
                                  state.circleResult.toString(),
                                  style: const TextStyle(fontSize: 38),
                                )
                              : const SizedBox(),
                              const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          BlocProvider.of<AreaCalcCubit>(context)
                              .rectangelArea(4, 2);
                        },
                        child: const Text(
                          "To'rtburchak",
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          BlocProvider.of<AreaCalcCubit>(context)
                              .trianglelArea(4, 2);
                        },
                        child: const Text(
                          'Uchburchak',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          BlocProvider.of<AreaCalcCubit>(context).circleArea(4);
                        },
                        child: const Text(
                          'Aylana',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
