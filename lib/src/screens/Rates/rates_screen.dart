import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../cubit/rates/rates_cubit.dart';
import '../../cubit/rates/rates_state.dart';
import '../../services/rates/rates_repository.dart';
import '../../widgets/header.dart';
import '../../widgets/drawer.dart';
import './rates_cards.dart';
import './rates_edit_form.dart';

class RatesScreen extends StatelessWidget {
  final String title;
  RatesScreen({Key key, this.title}) : super(key: key);

  final ratesRepository = RatesRepository();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RatesCubit>(
      create: (BuildContext context) =>
          RatesCubit(ratesRepository)..fetchRates(),
      child: Scaffold(
        appBar: AppHeader(title: title),
        drawer: AppDrawer(),
        body: BlocBuilder<RatesCubit, RatesState>(
          builder: (context, state) {
            if (state is RatesEmptyState) {
              return Center(
                child: Text('There is no rates'),
              );
            }

            if (state is RatesErrorState) {
              return Center(
                child: Text('Rates fetching error'),
              );
            }

            if (state is RatesLoadingState) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            if (state is RatesLoadedState) {
              return RatesCards(mainContext: context, mainState: state);
            }

            return Container();
          },
        ),
        floatingActionButton: BlocBuilder<RatesCubit, RatesState>(
          builder: (context, state) {
            if (state is RatesEmptyState) return Container();

            if (state is RatesErrorState) return Container();

            if (state is RatesLoadingState) return Container();

            if (state is RatesLoadedState) {
              return FloatingActionButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return RatesEditForm(
                        mainContext: context,
                        mainState: state,
                        mainRepository: ratesRepository,
                      );
                    },
                  );
                },
                tooltip: 'Edit Rates',
                child: Icon(Icons.edit),
              );
            }

            return Container();
          },
        ),
      ),
    );
  }
}
