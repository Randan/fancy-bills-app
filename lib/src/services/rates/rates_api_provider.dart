import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import '../../models/rates.dart';

class RatesProvider {
  Future<List<Rates>> getRates() async {
    final response = await http.get('${env['API_URL']}/rates');

    if (response.statusCode == 200) {
      final List<dynamic> ratesJson = json.decode(response.body);

      // return Rates.fromJson(ratesJson);
      return ratesJson.map((json) => Rates.fromJson(json)).toList();
    } else {
      throw Exception('Error fetching rates');
    }
  }
}
