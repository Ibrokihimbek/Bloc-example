import 'package:bloc_example/bloc/upper_case_cubit/upper_case_cubit.dart';
import 'package:bloc_example/bloc/upper_case_cubit/upper_case_state.dart';
import 'package:bloc_example/screens/area_calc/area_calc_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpperCasePage extends StatelessWidget {
  const UpperCasePage({super.key});

  @override
  Widget build(BuildContext context) {
    UpperCaseCubit upperCaseCubit = UpperCaseCubit();
    String text = '';

    return BlocProvider(
      create: (context) => upperCaseCubit,
      child: BlocBuilder<UpperCaseCubit, UpperState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              actions: [
                IconButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => AreaCalcPage()));
                    },
                    icon: const Icon(Icons.arrow_forward))
              ],
              title: const Text('UpperCase screen'),
            ),
            body: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  state is TextUpperState
                      ? Text(
                          state.textState,
                          style: const TextStyle(
                            fontSize: 18,
                          ),
                        )
                      : const SizedBox(),
                  const SizedBox(height: 18),
                  TextField(
                    onChanged: (value) {
                      BlocProvider.of<UpperCaseCubit>(context).upperCase(
                        value.toString(),
                      );
                    },
                    decoration: const InputDecoration(
                      labelText: 'Text Kiriting',
                      labelStyle: TextStyle(fontSize: 16),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(4)),
                        borderSide: BorderSide(
                          width: 1,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 1, color: Colors.black),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 1, color: Colors.black),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 1, color: Colors.black),
                      ),
                    ),
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
