import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  Future getData(url) async {
    http.Response response = await http.get(
      Uri.parse(
        url,
      ),
    );
    var data = response.body;

    if (response.statusCode == 200) {
      var decodedData = jsonDecode(data);
      return decodedData;
    } else {
      debugPrint('error');
    }
  }

  Future getCityName(url2) async {
    http.Response response = await http.get(
      Uri.parse(
        url2,
      ),
    );
    var data = response.body;

    if (response.statusCode == 200) {
      var decodedData2 = jsonDecode(data);
      return decodedData2;
    } else {
      debugPrint('error');
    }
  }

  Future getWeatherByCityName(url3) async {
    http.Response response = await http.get(
      Uri.parse(
        url3,
      ),
    );
    var data = response.body;

    if (response.statusCode == 200) {
      var decodedData3 = jsonDecode(data);
      return decodedData3;
    } else {
      debugPrint('error');
    }
  }
}
