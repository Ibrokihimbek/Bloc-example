import 'package:bloc_example/data/api_service/api_client.dart';
import 'package:bloc_example/data/models/company_model/data_model.dart';
import 'package:bloc_example/data/models/my_response/response_model.dart';
import 'package:dio/dio.dart';

class ApiService extends ApiClient {
  Future<MyResponse> getAllUsers() async {
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
}
