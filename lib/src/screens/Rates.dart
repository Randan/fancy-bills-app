import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/rates/rates_cubit.dart';
import '../cubit/rates/rates_state.dart';
import '../services/rates/rates_repository.dart';
import '../utils/constants.dart';
import '../widgets/header.dart';
import '../widgets/drawer.dart';
import '../widgets/card.dart';

class RatesScreen extends StatefulWidget {
  final String title;
  RatesScreen({Key key, this.title}) : super(key: key);

  final ratesRepository = RatesRepository();

  @override
  _RatesScreenState createState() => _RatesScreenState();
}

class _RatesScreenState extends State<RatesScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<RatesCubit>(
      create: (BuildContext context) => RatesCubit(widget.ratesRepository),
      child: Scaffold(
        appBar: AppHeader(title: widget.title),
        drawer: AppDrawer(),
        body: RatesCards(),
      ),
    );
  }
}

class RatesCards extends StatelessWidget {
  const RatesCards({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final RatesCubit ratesCubit = context.watch<RatesCubit>();

    return BlocBuilder<RatesCubit, RatesState>(
      builder: (context, state) {
        if (state is RatesEmptyState) {
          return Center(
            // child: Text('There is no rates'),
            child: RaisedButton(
              child: Text('press'),
              onPressed: () {
                ratesCubit.fetchRates();
              },
            ),
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
              alignment: WrapAlignment.start,
              spacing: kGap,
              children: [
                ...state.loadedRates
                    .map(
                      (rate) => AppCard(
                        title: rate.title,
                        value: rate.value,
                      ),
                    )
                    .toList(),
                // Container(
                //   child: AppCard(
                //     title: 'Rent',
                //     value: state.loadedRates.rent,
                //   ),
                // ),
                // Container(
                //   child: AppCard(
                //     title: 'Cold Water',
                //     value: state.loadedRates.coldWater,
                //   ),
                // ),
                // Container(
                //   child: AppCard(
                //     title: 'Hot Water',
                //     value: state.loadedRates.hotWater,
                //   ),
                // ),
                // Container(
                //   child: AppCard(
                //     title: 'Sewerage',
                //     value: state.loadedRates.sewerage,
                //   ),
                // ),
                // Container(
                //   child: AppCard(
                //     title: 'Electricity below 100',
                //     value: state.loadedRates.electricityBelow,
                //   ),
                // ),
                // Container(
                //   child: AppCard(
                //     title: 'Electricity above 100',
                //     value: state.loadedRates.electricityAbove,
                //   ),
                // ),
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
