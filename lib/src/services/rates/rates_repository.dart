import '../../models/rates.dart';
import './rates_api_provider.dart';

class RatesRepository {
  RatesProvider _ratesProvider = RatesProvider();

  Future<Rates> getRates() => _ratesProvider.getRates();
  Future<Rates> editRates(newRates) => _ratesProvider.editRates(newRates);
}
