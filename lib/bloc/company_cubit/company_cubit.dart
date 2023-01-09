import 'package:bloc_example/bloc/company_cubit/compny_state.dart';
import 'package:bloc_example/data/app_repository/company_repo.dart';
import 'package:bloc_example/data/models/my_response/response_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CompanyCubit extends Cubit<CompanyState> {
  CompanyCubit(this.companyRepos) : super(InitialCompanysState()) {
      fetchAllCompanys();
  }

  final CompanyRepo companyRepos;

  fetchAllCompanys() async {
    //loading
    emit(LoadCompanysInProgress());
    MyResponse myResponse = await companyRepos.getCompany();
    if (myResponse.error.isEmpty) {
      //success
      emit(LoadCompanysInSuccess(companys: myResponse.data));
    } else {
      //error
      emit(LoadCompanyssInFailure(errorText: myResponse.error));
    }
  }
}
