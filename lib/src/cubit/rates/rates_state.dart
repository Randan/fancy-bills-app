import 'package:flutter/foundation.dart';
import '../../models/rates.dart';

abstract class RatesState {}

class RatesEmptyState extends RatesState {}

class RatesLoadingState extends RatesState {}

class RatesLoadedState extends RatesState {
  Rates loadedRates;

  RatesLoadedState({@required this.loadedRates})
      : assert(loadedRates != null),
        super();
}

class RatesErrorState extends RatesState {}
