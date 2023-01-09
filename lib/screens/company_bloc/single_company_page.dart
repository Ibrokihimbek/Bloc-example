import 'package:bloc_example/bloc/company_cubit/compny_state.dart';
import 'package:bloc_example/bloc/single_company_bloc/single_company_bloc.dart';
import 'package:bloc_example/bloc/single_company_bloc/single_company_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SingleCompanyBlocPage extends StatelessWidget {
  final int id;
  const SingleCompanyBlocPage({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SingleCompaniesBloc(companyRepo: context.read())
        ..add(FetchSingleCompany(id: id)),
      child: BlocBuilder<SingleCompaniesBloc, CompanyState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Single Company Block'),
            ),
            body: state is LoadCompanyInProgress
                ? const Center(child: CircularProgressIndicator())
                : state is LoadCompanyInSuccess
                    ? Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 4,
                          ),
                          Container(
                            width: 200,
                            height: 143,
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(12),
                                bottomRight: Radius.circular(12),
                              ),
                              image: DecorationImage(
                                  image: NetworkImage(
                                    state.singleCompany.carPics[0].toString(),
                                  ),
                                  fit: BoxFit.fill,
                                  scale: 6),
                            ),
                          ),
                          const SizedBox(height: 12),
                          Text(
                            state.singleCompany.carModel.toString(),
                            style: const TextStyle(fontSize: 18),
                          ),
                          const SizedBox(height: 12),
                          SizedBox(
                            width: double.infinity,
                            child: Text(
                              state.singleCompany.description.toString(),
                              style: const TextStyle(fontSize: 18),
                            ),
                          ),
                        ],
                      ),
                    )
                    : Container(),
          );
        },
      ),
    );
  }
}
