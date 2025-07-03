import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:santinha/controller/request.dart';
import 'dashboard.dart';

class CadastrarConta extends StatefulWidget {
  const CadastrarConta({super.key});

  @override
  State<CadastrarConta> createState() => _CadastrarContaState();
}

class _CadastrarContaState extends State<CadastrarConta> {
  RequestApi requestApi = RequestApi();

  TextEditingController nomeController = TextEditingController();
  TextEditingController cpfController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController telefoneController = TextEditingController();
  TextEditingController senhaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            TextField(
              controller: nomeController,
              decoration: InputDecoration(label: Text("Nome")),
            ),
            TextField(
              controller: cpfController,
              decoration: InputDecoration(label: Text("CPF")),
            ),
            TextField(
              controller: emailController,
              decoration: InputDecoration(label: Text("E-mail")),
            ),
            TextField(
              controller: telefoneController,
              decoration: InputDecoration(label: Text("Telefone")),
            ),
            TextField(
              controller: senhaController,
              decoration: InputDecoration(label: Text("Senha")),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () async {
                      requestApi.request(
                        methodHttp: "POST",
                        route: "usuarios",
                        body: jsonEncode(
                          {
                            "cpf": cpfController.text,
                            "nome": nomeController.text,
                            "email": emailController.text,
                            "senha": senhaController.text,
                            "telefone": telefoneController.text
                          },
                        ),
                      );
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 40,
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(5)),
                      child: Text(
                        "Entrar",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
