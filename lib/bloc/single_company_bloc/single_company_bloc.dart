import 'package:bloc_example/bloc/company_cubit/compny_state.dart';
import 'package:bloc_example/bloc/single_company_bloc/single_company_event.dart';
import 'package:bloc_example/data/app_repository/company_repo.dart';
import 'package:bloc_example/data/models/my_response/response_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SingleCompaniesBloc extends Bloc<CompanyEvent, CompanyState> {
  final CompanyRepo companyRepo;
  SingleCompaniesBloc({required this.companyRepo}) : super(InitialCompanysState()) {
    on<FetchSingleCompany>(_fetchSingleCompany);
  }

 _fetchSingleCompany(FetchSingleCompany event, Emitter<CompanyState> emit) async {
    emit(LoadCompanyInProgress());
    MyResponse myResponse = await companyRepo.getSingleCompany(event.id);
    if (myResponse.error.isEmpty) {
      emit(LoadCompanyInSuccess(singleCompany:  myResponse.data));
    } else {
      emit(LoadCompanyInFoilure(errorText: myResponse.error));
    }
  }
}
