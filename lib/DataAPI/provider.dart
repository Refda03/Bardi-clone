import 'dart:convert';
import 'dart:core';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

final String url='http://10.0.2.2:8000/api/pegawai';

Future<List<dynamic>> getData() async {
  var response = await http.get(Uri.parse(url));
  debugPrint(
      "Data API:  ${json.decode(response.body)}"
  );
  return json.decode(response.body)['data'];
}
