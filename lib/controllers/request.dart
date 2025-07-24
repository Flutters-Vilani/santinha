import 'dart:convert';

import 'package:http/http.dart' as http;

class Request {
  String BASE_URL = "http://santa.avanth.kinghost.net/api";
  String token =
      "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJpYXQiOjE3NTMzMzQ2NzAsImV4cCI6MTc1MzMzODI3MCwicm9sZXMiOlsiVVNVQVJJTyIsInRlc3RlIl0sInVzZXJuYW1lIjoiMDc4NDg5MDMxNjIifQ.mK1aMtgTermyinthgxIySlbEOhBzlOpCuJzrDeQFtIO21QKcncG4pqsRn1QDcsSIF1j6YsBdhJEcjej3gu1Bpac2AE1R9tETFoDELjoj4wl4oTEWnQRI0lY9wEV6chCMLVLzDT9mn_Y8srsPfZo0JQ5q1Fsc2YCocyb-1XsVNCdFoD3aZY7j0JUBHdEKoSLIBIbEib5yhkB6tcI-PWmCbp7mzhtHFFMYNUsipMdIGWJUBfJbIIIYdEn4MaFsaRbuArvHjv_Kq42wlpseyy6YXmPfTPIkkD3ExYQXM4cpdjNKOLMR-g7v34bmjQSoHdBsJOr2JWnJ_nl6Eki5a6hixQ";

  methodRequest(String route, String method, {dynamic body}) async {
    dynamic resposta;
    if (method == "GET") {
      await http.get(Uri.parse("$BASE_URL/$route"), headers: {
        "Accept": "application/json",
        "Content-Type": "application/json",
        "Authorization": "Bearer $token"
      }).then((http.Response response) {
        print(response.statusCode);
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
        resposta = jsonDecode(response.body);
        print(response.body);
        // return resposta;
      });
    }

    return resposta;
  }
}
