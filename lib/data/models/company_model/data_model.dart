import 'company_info_model.dart';

class DataModel {
  List<CompanyModel> data;
  DataModel({required this.data});

  factory DataModel.fromJson(Map<String, dynamic> jsonData) {
    return DataModel(
      data: (jsonData['data'] as List<dynamic>?)
              ?.map((e) => CompanyModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );
  }
}
