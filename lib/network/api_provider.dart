import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiProvider {
  static getData(String resource) async {
  final String _baseUrl = "http://10.0.2.2:5000";

    http.Response response = await http.get( _baseUrl + resource);
    print (_baseUrl + resource);

    return json.decode(response.body);
  }

  //  Future<dynamic> get(String resource) async {
  //   var responseJson;

  //     final response = await http.get( _baseUrl+ resource);

  //     return json.decode(response.body);
  //   }
  }
