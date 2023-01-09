import 'package:bloc_example/bloc/app/app.dart';
import 'package:bloc_example/bloc/company_cubit/company_cubit.dart';
import 'package:bloc_example/data/api_service/api_service.dart';
import 'package:bloc_example/data/app_repository/company_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CompanyCubit(
            CompanyRepo(
              apiService: ApiService(),
            ),
          ),
        ),
      ],
      child: App(),
    ),
  );
}


