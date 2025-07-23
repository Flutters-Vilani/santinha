import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RequestApi {
  String BASE_API = "http://192.168.0.150:8000/api";

  request(
      {required String methodHttp, required String route, dynamic body}) async {
    dynamic responseBody;

    switch (methodHttp) {
      case "GET":
        try {
          await http.get(Uri.parse("$BASE_API/$route"), headers: {
            "Accept": "application/json",
            "Content-Type": "application/json"
          }).then((http.Response response) {
            responseBody = jsonDecode(response.body);
          });
        } catch (e) {}

        break;
      case "POST":
        await http
            .post(
          Uri.parse("$BASE_API/$route"),
          headers: {
            "Accept": "application/json",
            "Content-Type": "application/json"
          },
          body: body,
        )
            .then((http.Response response) {
          print(response.body);
          print(response.statusCode);
        });
      default:
    }
    return responseBody;
  }
}
