import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DataGetter {

  static getData() async {
    http.Response response = await http.get("http://10.0.2.2:5000/currencies");

    return json.decode(response.body);
  }
}
