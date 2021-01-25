import 'package:flutter/material.dart';
import '../../cubit/rates/rates_state.dart';
import '../../utils/constants.dart';
import '../../widgets/card.dart';

class RatesCards extends StatelessWidget {
  final mainContext;
  final mainState;
  const RatesCards({Key key, this.mainContext, this.mainState})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (mainState is RatesEmptyState) {
      return Center(
        child: Text('There is no rates'),
      );
    }

    if (mainState is RatesErrorState) {
      return Center(
        child: Text('Rates fetching error'),
      );
    }

    if (mainState is RatesLoadingState) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }

    if (mainState is RatesLoadedState) {
      return Container(
        padding: EdgeInsets.all(kGap),
        child: Wrap(
          alignment: WrapAlignment.spaceAround,
          spacing: kGap,
          children: [
            AppCard(
              title: 'Electricity Above 100',
              value: mainState.loadedRates.electricityAbove,
            ),
            AppCard(
              title: 'Electricity Below 100',
              value: mainState.loadedRates.electricityBelow,
            ),
            AppCard(
              title: 'Cold Water',
              value: mainState.loadedRates.coldWater,
            ),
            AppCard(
              title: 'Hot Water',
              value: mainState.loadedRates.hotWater,
            ),
            AppCard(
              title: 'Sewerage',
              value: mainState.loadedRates.sewerage,
            ),
            AppCard(
              title: 'Rent',
              value: mainState.loadedRates.rent,
            ),
          ],
        ),
      );
    }

    return Center(
      child: Text('There is no rates'),
    );
  }
}
