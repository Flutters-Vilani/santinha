import '../request.dart';

class LoginController {
  Request request = Request();

  login(String cpf, String senha) async {
    dynamic response = await request.methodRequest(
      "auth/login",
      "POST",
      body: {
        "cpf": cpf,
        "senha": senha,
      },
    );
    print(response.toString());
  }
}
