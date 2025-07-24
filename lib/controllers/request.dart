import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:santinha/controllers/auth/login_controller.dart';
import 'package:santinha/shared_preferences/keys_shared_preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Request {
  LoginController loginController = LoginController();
  String BASE_URL = "http://santa.avanth.kinghost.net/api";

  methodRequest(String route, String method, {dynamic body}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = await prefs.getString("token");

    dynamic resposta;
    if (method == "GET") {
      await http.get(Uri.parse("$BASE_URL/$route"), headers: {
        "Accept": "application/json",
        "Content-Type": "application/json",
        "Authorization": "Bearer $token"
      }).then((http.Response response) {
        print(response.statusCode);
        dynamic bodyResponse = jsonDecode(response.body);
        resposta = {"statusCode": response.statusCode, "body": bodyResponse};
        // return response;
      });
    } else {
      await http
          .post(
        Uri.parse("$BASE_URL/$route"),
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/json",
          "Authorization": "Bearer $token"
        },
        body: jsonEncode(body),
      )
          .then((http.Response response) {
        dynamic bodyResponse = jsonDecode(response.body);
        resposta = {"statusCode": response.statusCode, "body": bodyResponse};
        // print(response.body);
        // return resposta;
      });
    }

    return resposta;
  }
}
