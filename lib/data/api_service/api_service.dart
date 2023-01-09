import 'package:bloc_example/data/api_service/api_client.dart';
import 'package:bloc_example/data/models/company_model/data_model.dart';
import 'package:bloc_example/data/models/my_response/response_model.dart';
import 'package:bloc_example/data/models/single_company_model/singl_company_model.dart';
import 'package:dio/dio.dart';

class ApiService extends ApiClient {

  Future<MyResponse> getAllCompany() async {
    MyResponse myResponse = MyResponse(error: "");
    try {
      Response response = await dio.get(dio.options.baseUrl);
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        myResponse.data = DataModel.fromJson(response.data);
      }
    } catch (err) {
      myResponse.error = err.toString();
    }

    return myResponse;
  }

  Future<MyResponse> getSingleCompanyById(int id) async {
    MyResponse myResponse = MyResponse(error: "");
    try {
      Response response = await dio.get("${dio.options.baseUrl}/$id");
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        myResponse.data = CarInfoModel.fromJson(response.data);
      }
    } catch (err) {
      myResponse.error = err.toString();
    }

    return myResponse;
  }
}
