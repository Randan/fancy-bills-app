import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../cubit/rates/rates_cubit.dart';
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
        body: RatesCards(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            print('button Rates pressed');
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return RatesEditForm();
              },
            );
          },
          tooltip: 'Edit Rates',
          child: Icon(Icons.edit),
        ),
      ),
    );
  }
}
