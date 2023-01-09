import 'package:bloc_example/bloc/upper_case_cubit/upper_case_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpperCaseCubit extends Cubit<UpperState> {
  UpperCaseCubit() : super(InitialState(a: ''));

  void upperCase(String text) {
    
    emit(TextUpperState(text.toUpperCase()));
  }
}