import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../application/constants/utils/covid_api.dart';
import 'covid_http_exception.dart';

class CovidHttpManager {
  CovidHttpManager();

  Future<dynamic> get(String endpoint) async {
    dynamic jsonResponse = {};

    try {
      final Map<String, String> headers = await _getHeaders();
      final Uri uri = Uri.parse(CovidApi.url + endpoint);
      final resp = await http.get(uri, headers: headers);
      final bool success = _validateSuccess(resp.statusCode);

      if(!success) {
        throw CovidException(
          message: resp.body.toString().replaceAll('"', ''),
          status: resp.statusCode
        );
      }
      jsonResponse = json.decode(resp.body);
      return jsonResponse;
    } catch( e ) {
      throw CovidException(message: e.toString());
    }
  }

  Future<Map<String, String>> _getHeaders() async {
    final Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8',
    };
    return headers;
  }

  bool _validateSuccess(int status) {
    bool success = true;
    if (status != 200 && status != 201 && status != 202) {
      success = false;
    }
    return success;
  }

}