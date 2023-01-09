import 'dart:math';

import 'package:bloc_example/bloc/area_calc_cubit/area_calc_stae.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AreaCalcCubit extends Cubit<AreaCalcState> {
  AreaCalcCubit() : super(InitialStateByAreaCalc());

  void rectangelArea(num a, num b) {
    emit(RectangleAreState(a * b));
  }

  void trianglelArea(num a, num b) {
    emit(TriangleAreaState(a * b * (0.5)));
  }

  void circleArea(
    num a,
  ) {
    emit(CircleAreaState((a * a) * pi));
  }
}
