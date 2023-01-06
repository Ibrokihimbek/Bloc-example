import 'package:bloc_example/data/models/company_model/data_model.dart';

abstract class CompanyState {}

class InitialCompanysState extends CompanyState {}

class LoadCompanysInProgress extends CompanyState {}

class LoadCompanysInSuccess extends CompanyState {
  LoadCompanysInSuccess({required this.companys});

  final DataModel companys;
}

class LoadCompanyssInFailure extends CompanyState {
  LoadCompanyssInFailure({required this.errorText});

  final String errorText;
}
