import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import '../../models/rates.dart';

class RatesProvider {
  final Map<String, String> headers = {'Content-Type': 'application/json'};

  Future<Rates> getRates() async {
    final response = await http.get(
      '${env['API_URL']}/rates',
      headers: headers,
    );

    if (response.statusCode == 200) {
      final dynamic ratesJson = json.decode(response.body);

      return Rates.fromJson(ratesJson);
    } else {
      throw Exception('Error fetching rates');
    }
  }

  Future<Rates> editRates(newRates) async {
    final response = await http.patch(
      '${env['API_URL']}/rates',
      headers: headers,
      body: json.encode(newRates),
    );

    if (response.statusCode == 200) {
      final dynamic ratesJson = json.decode(response.body);

      return Rates.fromJson(ratesJson);
    } else {
      throw Exception('Error updating rates');
    }
  }
}
