import 'package:http/http.dart' as http;
import 'dart:convert';

void main() async {
  final rates = await makeAPICall();
}

double convert(Map<String, double> rates, double curr, String from, String to) {
  return (curr  / rates[from]) * rates[to]; 
}

class ResObject {
  final bool success;
  final int timestamp;
  final String base;
  final String date;
  final Map<String, dynamic> rates;

  ResObject({this.success, this.timestamp, this.base, this.date, this.rates});

  factory ResObject.fromJson(Map<String, dynamic> json) {
    return ResObject(
        success: json['success'],
        timestamp: json['timestamp'],
        base: json['base'],
        date: json['date'],
        rates: json['rates']);
  }
}


// this function properly returns the rates
Future<Map<String, double>> makeAPICall() async {
  final response = await http.get(
      'http://data.fixer.io/api/latest?access_key=d16339741f53e88244d93dec83cacbee');

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    var r = ResObject.fromJson(jsonDecode(response.body));
    Map<String, double> result = Map<String, double>();
    r.rates.forEach((String k, dynamic v) {
      result[k] = v.toDouble();
    });

    return result;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load rates');
  }
}
