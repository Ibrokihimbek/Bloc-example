import 'package:bloc_example/data/models/company_model/data_model.dart';
import 'package:bloc_example/data/models/single_company_model/singl_company_model.dart';

abstract class CompanyState {}

class InitialCompanysState extends CompanyState {}

/// ----------------- Companys info State -------------------------------

class LoadCompanysInProgress extends CompanyState {}

class LoadCompanysInSuccess extends CompanyState {
  LoadCompanysInSuccess({required this.companys});

  final DataModel companys;
}

class LoadCompanyssInFailure extends CompanyState {
  LoadCompanyssInFailure({required this.errorText});

  final String errorText;
}

/// ------------------ Single company info State -------------------------

class LoadCompanyInProgress extends CompanyState {}

class LoadCompanyInSuccess extends CompanyState {
  LoadCompanyInSuccess({required this.singleCompany});

  final CarInfoModel singleCompany;
}

class LoadCompanyInFoilure extends CompanyState {
  LoadCompanyInFoilure({required this.errorText});

  final String errorText;
}
