import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:uas_181011450429/weather_model.dart';

//api.openweathermap.org/data/2.5/weather?q={city name}&appid={API key}
//appid = 32880eae1adc76da30d096b4cd03c330

class DataService {
  Future<Weather> fetchData(String cityName) async {
    try {
      final queryParameter = {
        'q': cityName,
        'appid': '32880eae1adc76da30d096b4cd03c330',
        'units': 'metric'
      };
      final uri = Uri.https(
          'api.openweathermap.org', '/data/2.5/weather', queryParameter);
      final response = await http.get(uri);
      return Weather.fromJson(jsonDecode(response.body));
    } catch (e) {
      rethrow;
    }
  }
}
