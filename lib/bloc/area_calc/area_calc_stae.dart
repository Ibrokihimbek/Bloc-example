abstract class AreaCalcState {}

class InitialStateByAreaCalc extends AreaCalcState {
  InitialStateByAreaCalc();


}

class RectangleAreState extends AreaCalcState {
  RectangleAreState(this.rectangleResult);

  num rectangleResult = 0;
}

class TriangleAreaState extends AreaCalcState {
  TriangleAreaState(this.triangleResult);

  num triangleResult = 0;
}

class CircleAreaState extends AreaCalcState {
  CircleAreaState(this.circleResult);

  num circleResult = 0;
}

