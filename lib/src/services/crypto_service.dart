import 'package:http/http.dart' as http;
import 'dart:convert';

class CryptoService {
  final String _baseUrl = 'https://api.coingecko.com/api/v3';

  Future<List<dynamic>> fetchCryptoData(int limit) async {
    try {
      final response = await http.get(
        Uri.parse(
          '$_baseUrl/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=$limit&page=1&sparkline=false',
        ),
      );

      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);
        return data;
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      throw Exception('Error fetching data: $e');
    }
  }
}
