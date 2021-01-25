import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../cubit/rates/rates_cubit.dart';
import '../../cubit/rates/rates_state.dart';
import '../../utils/constants.dart';
import '../../widgets/card.dart';

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
