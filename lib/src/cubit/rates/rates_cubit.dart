import 'package:flutter_bloc/flutter_bloc.dart';
import '../../models/rates.dart';
import '../../services/rates/rates_repository.dart';
import './rates_state.dart';

class RatesCubit extends Cubit<RatesState> {
  final RatesRepository ratesRepository;

  RatesCubit(this.ratesRepository) : super(RatesEmptyState());

  Future<void> fetchRates() async {
    try {
      emit(RatesLoadingState());

      final Rates _loadedRatesList = await ratesRepository.getRates();
      emit(RatesLoadedState(loadedRates: _loadedRatesList));
    } catch (_) {
      emit(RatesErrorState());
    }
  }
}
