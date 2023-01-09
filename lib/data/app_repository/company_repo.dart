import 'package:bloc_example/data/api_service/api_service.dart';
import 'package:bloc_example/data/models/my_response/response_model.dart';

class CompanyRepo {
  CompanyRepo({required this.apiService});

  final ApiService apiService;

  Future<MyResponse> getCompany() => apiService.getAllCompany();

  Future<MyResponse> getSingleCompany(int id) =>
      apiService.getSingleCompanyById(id);
      
}
