import 'package:bloc_example/bloc/company_bloc/companies_event.dart';
import 'package:bloc_example/bloc/company_bloc/company_bloc.dart';
import 'package:bloc_example/bloc/company_cubit/compny_state.dart';
import 'package:bloc_example/data/app_repository/company_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ComapniesBlocPage extends StatelessWidget {
  const ComapniesBlocPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          CompaniesBloc(companyRepo: context.read<CompanyRepo>())
            ..add(FetchAllCompanies()),
      child: BlocBuilder<CompaniesBloc, CompanyState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Company Block'),
            ),
            body: state is LoadCompanysInProgress
                ? const Center(child: CircularProgressIndicator())
                : state is LoadCompanysInSuccess
                    ? GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 2.5 / 2.8,
                          mainAxisSpacing: 12,
                          crossAxisSpacing: 12,
                        ),
                        itemCount: 8,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            padding: const EdgeInsets.only(top: 4),
                            margin: const EdgeInsets.only(
                                top: 6, left: 4, right: 4, bottom: 2),
                            width: 120,
                            height: 180,
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.blue.withOpacity(0.4),
                                    blurRadius: 4,
                                    offset: const Offset(8, 8),
                                  ),
                                ],
                                border:
                                    Border.all(width: 1, color: Colors.grey),
                                borderRadius: BorderRadius.circular(12),
                                color: Colors.white),
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 4,
                                ),
                                Container(
                                  width: double.infinity,
                                  height: 143,
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.only(
                                      bottomLeft: Radius.circular(12),
                                      bottomRight: Radius.circular(12),
                                    ),
                                    image: DecorationImage(
                                        image: NetworkImage(
                                          state.companys.data[index].logo
                                              .toString(),
                                        ),
                                        fit: BoxFit.fill,
                                        scale: 6),
                                  ),
                                ),
                                const SizedBox(height: 12),
                                Text(
                                  state.companys.data[index].carModel
                                      .toString(),
                                  style: const TextStyle(fontSize: 18),
                                ),
                              ],
                            ),
                          );
                        },
                      )
                    : Container(),
          );
        },
      ),
    );
  }
}
