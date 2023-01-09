abstract class CompanyEvent {}

class FetchSingleCompany extends CompanyEvent {
  FetchSingleCompany({required this.id});

  final int id;
}