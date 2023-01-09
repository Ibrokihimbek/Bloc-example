abstract class CompanyEvent {}

class FetchAllCompanies extends CompanyEvent {}

class FetchSingleCompany extends CompanyEvent {
  FetchSingleCompany({required this.id});

  final int id;
}