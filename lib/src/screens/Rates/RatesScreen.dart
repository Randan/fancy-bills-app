import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../cubit/rates/rates_cubit.dart';
import '../../cubit/rates/rates_state.dart';
import '../../services/rates/rates_repository.dart';
import '../../utils/constants.dart';
import '../../widgets/header.dart';
import '../../widgets/drawer.dart';
import '../../widgets/card.dart';

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
                return Center(
                  child: AlertDialog(
                    title: const Text('Edit Rates'),
                    content: new Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            hintText: 'Electricity Above 100',
                          ),
                          validator: (value) {
                            if (value.length > 0) return null;
                            return 'Enter rate';
                          },
                          onChanged: (value) => print(value),
                        ),
                      ],
                    ),
                    actions: <Widget>[
                      FlatButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        textColor: Theme.of(context).primaryColor,
                        child: const Text('Close'),
                      ),
                      FlatButton(
                        onPressed: () {
                          print('Edit Button Pressed');
                        },
                        textColor: Theme.of(context).primaryColor,
                        child: const Text('Save'),
                      ),
                    ],
                  ),
                );
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

class RatesCards extends StatelessWidget {
  const RatesCards({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RatesCubit, RatesState>(
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
          return Container(
            padding: EdgeInsets.all(kGap),
            child: Wrap(
              alignment: WrapAlignment.spaceAround,
              spacing: kGap,
              children: [
                AppCard(
                  title: 'Electricity Above 100',
                  value: state.loadedRates.electricityAbove,
                ),
                AppCard(
                  title: 'Electricity Below 100',
                  value: state.loadedRates.electricityBelow,
                ),
                AppCard(
                  title: 'Cold Water',
                  value: state.loadedRates.coldWater,
                ),
                AppCard(
                  title: 'Hot Water',
                  value: state.loadedRates.hotWater,
                ),
                AppCard(
                  title: 'Sewerage',
                  value: state.loadedRates.sewerage,
                ),
                AppCard(
                  title: 'Rent',
                  value: state.loadedRates.rent,
                ),
              ],
            ),
          );
        }

        return Center(
          child: Text('There is no rates'),
        );
      },
    );
  }
}
