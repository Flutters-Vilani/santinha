import 'package:santinha/shared_preferences/keys_shared_preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../request.dart';

Request request = Request();

class LoginController {
  login(String cpf, String senha) async {
    final prefs = await SharedPreferences.getInstance();
    dynamic response = await request.methodRequest(
      "auth/login",
      "POST",
      body: {
        "cpf": cpf,
        "senha": senha,
      },
    );

    if (response['statusCode'] == 200) {
      await prefs.setString('token', response['body']["token"]);
    } else {}

    return response;
  }
}
