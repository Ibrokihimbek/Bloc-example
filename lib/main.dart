import 'package:bloc_example/bloc/company/company_cubit.dart';
import 'package:bloc_example/data/api_service/api_service.dart';
import 'package:bloc_example/data/app_repository/company_repo.dart';
import 'package:bloc_example/screens/company/company_page.dart';
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
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bloc example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CompanyPage(),
    );
  }
}
