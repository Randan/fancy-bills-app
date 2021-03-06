import 'package:bills_app/src/utils/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../utils/toast.dart';
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

  Future<void> editRates(newRates) async {
    try {
      emit(RatesLoadingState());

      final Rates _loadedRatesList = await ratesRepository.editRates(newRates);
      emit(RatesLoadedState(loadedRates: _loadedRatesList));

      showToast('Rates updated successfuly', ToastType.SUCCESS);
    } catch (_) {
      emit(RatesErrorState());
    }
  }
}
