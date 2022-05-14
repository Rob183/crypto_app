import 'package:http/http.dart' as http;
import 'dart:convert';

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

class CoinData {
  Map<String, String> cryptoPrices = {};

  Future<dynamic> getCrytoPrices(String currency) async {
    for (var item in cryptoList) {
      var url = Uri.parse(
          'https://rest.coinapi.io/v1/exchangerate/$item/$currency?apikey=5160DCE8-275E-493F-81D3-B75D714880AF');

      http.Response response = await http.get(url);

      response.statusCode == 200
          ? print('Api Request done')
          : print('Api request failed:' + response.statusCode.toString());

      var jsonData = jsonDecode(response.body);
      double price = jsonData['rate'];
      var data = <String, String>{item: price.toStringAsFixed(0)};
      cryptoPrices.addEntries(data.entries);
    }

    return cryptoPrices;
  }
}
