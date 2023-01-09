import 'package:bloc_example/bloc/company_bloc/companies_event.dart';
import 'package:bloc_example/bloc/company_bloc/company_bloc.dart';
import 'package:bloc_example/data/api_service/api_service.dart';
import 'package:bloc_example/data/app_repository/company_repo.dart';
import 'package:bloc_example/screens/company_bloc/company_bloc_page.dart';
import 'package:bloc_example/screens/company_cubit/company_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => CompanyRepo(
            apiService: ApiService(),
          ),
        ),
      ],
      child: MyApp(),
    );
  }
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
      home: ComapniesBlocPage(),
    );
  }
}
