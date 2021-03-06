import 'package:sample_dart_cli/models/models.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:meta/meta.dart';

const API_KEY = '26df170651229274536c41f6c6b08b96';
const BASE_URL = 'https://api.openweathermap.org/data/2.5/weather?';
const API_KEY_QUERY = '&appid=$API_KEY';

Future<ForeCast> getWeather(
    {@required String zip, String country = 'fr'}) async {
  var url = '${BASE_URL}zip=$zip,$country&units=metric${API_KEY_QUERY}';
  var response = await http.get(url);
  var jsonResponse = json.decode(response.body);
  return ForeCast.fromJson(jsonResponse);
}
