import '../../models/rates.dart';
import './rates_api_provider.dart';

class RatesRepository {
  RatesProvider _ratesProvider = RatesProvider();

  Future<List<Rates>> getRates() => _ratesProvider.getRates();
}
