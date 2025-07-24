import 'package:santinha/controllers/request.dart';

class PixController {
  Request request = Request();

  transferePix() async {
    dynamic resposta = await request.methodRequest("transacoes", "POST", body: {
      "idusuarioOrigem": "1",
      "idusuarioDestino": "2",
      "valor": "10000"
    });

    return resposta;
  }
}
