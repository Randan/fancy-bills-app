import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../cubit/rates/rates_cubit.dart';
import '../../cubit/rates/rates_state.dart';
import '../../utils/constants.dart';
import '../../widgets/tile.dart';

class RatesList extends StatelessWidget {
  RatesList({Key key}) : super(key: key);

  final GlobalKey _refreshKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final ratesCubit = context.watch<RatesCubit>();

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
            child: RefreshIndicator(
              key: _refreshKey,
              onRefresh: () {
                return ratesCubit.fetchRates();
              },
              child: ListView(
                primary: true,
                padding: EdgeInsets.all(kGap),
                physics: AlwaysScrollableScrollPhysics(),
                children: [
                  AppTile(
                    title: 'Electricity > 100kW (kW/hour)',
                    value: state.loadedRates.electricityAbove,
                  ),
                  AppTile(
                    title: 'Electricity < 100kW (kW/hour)',
                    value: state.loadedRates.electricityBelow,
                  ),
                  AppTile(
                    title: 'Cold Water (m3)',
                    value: state.loadedRates.coldWater,
                  ),
                  AppTile(
                    title: 'Hot Water (m3)',
                    value: state.loadedRates.hotWater,
                  ),
                  AppTile(
                    title: 'Sewerage (m3)',
                    value: state.loadedRates.sewerage,
                  ),
                  AppTile(
                    title: 'Rent (month)',
                    value: state.loadedRates.rent,
                  ),
                ],
              ),
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
