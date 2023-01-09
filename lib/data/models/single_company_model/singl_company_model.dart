class CarInfoModel {
  int id;
  String carModel;
  num averagePrice;
  String logo;
  int establishedYear;
  String description;
  List carPics;

  CarInfoModel({
    required this.averagePrice,
    required this.carModel,
    required this.carPics,
    required this.description,
    required this.establishedYear,
    required this.id,
    required this.logo,
  });

  factory CarInfoModel.fromJson(Map<String, dynamic> jsonData) {
    return CarInfoModel(
      averagePrice: jsonData['average_price'] as num? ?? 0,
      carModel: jsonData['car_model'] as String? ?? '',
      carPics: jsonData['car_pics'],
      description: jsonData['description'] as String? ?? '',
      establishedYear: jsonData['established_year'] as int? ?? 0,
      id: jsonData['id'] as int? ?? 0,
      logo: jsonData['logo'] as String? ?? '',
    );
  }
}