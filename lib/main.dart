import 'package:bloc_example/app/app.dart';
import 'package:bloc_example/app/app_bloc_observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  Bloc.observer = AppBlocObserver();
  runApp(App());
}
