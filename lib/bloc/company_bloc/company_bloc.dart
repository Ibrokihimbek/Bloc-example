import 'package:bloc_example/bloc/company_bloc/companies_event.dart';
import 'package:bloc_example/bloc/company_cubit/compny_state.dart';
import 'package:bloc_example/data/app_repository/company_repo.dart';
import 'package:bloc_example/data/models/my_response/response_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CompaniesBloc extends Bloc<CompanyEvent, CompanyState> {
  final CompanyRepo companyRepo;
  CompaniesBloc({required this.companyRepo}) : super(InitialCompanysState()) {
    on<FetchAllCompanies>(_fetchCompanies);
  }

  _fetchCompanies(FetchAllCompanies event, Emitter<CompanyState> emit) async {
    emit(LoadCompanysInProgress());
    MyResponse myResponse = await companyRepo.getCompany();
    if (myResponse.error.isEmpty) {
      emit(LoadCompanysInSuccess(companys: myResponse.data));
    } else {
      emit(LoadCompanyssInFailure(errorText: myResponse.error));
    }
  }
}
