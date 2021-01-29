import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../cubit/rates/rates_cubit.dart';
import '../../widgets/header.dart';
import '../../widgets/drawer.dart';
import './rates_list.dart';
import './rates_edit_form.dart';

class RatesScreen extends StatelessWidget {
  final String title;
  RatesScreen({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ratesCubit = context.watch<RatesCubit>();

    return Scaffold(
      appBar: AppHeader(title: title),
      drawer: AppDrawer(),
      body: RatesList(),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (_) {
                  return RatesEditForm();
                },
              );
            },
            heroTag: "btn1",
            tooltip: 'Edit Rates',
            child: Icon(Icons.edit),
          ),
          SizedBox(width: 10.0),
          FloatingActionButton(
            onPressed: () {
              ratesCubit.editRates({
                'electricityAbove': 0.0,
                'electricityBelow': 0.0,
                'coldWater': 0.0,
                'hotWater': 0.0,
                'sewerage': 0.0,
                'rent': 0.0,
              });
            },
            heroTag: "btn2",
            tooltip: 'Clear Rates',
            child: Icon(Icons.clear),
          ),
        ],
      ),
    );
  }
}
