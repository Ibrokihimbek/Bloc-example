abstract class UpperState {}

class InitialState extends UpperState {
  InitialState({
    required this.a,
  });

  final String a;
}

class TextUpperState extends UpperState {
  TextUpperState(this.textState);

  String textState = '';
}
