import 'package:flutter/material.dart';
import 'package:santinha/dashboard.dart';

import 'cadastrar_conta.dart';
import 'controller/request.dart';

class Login2 extends StatefulWidget {
  const Login2({super.key});

  @override
  State<Login2> createState() => _Login2State();
}

class _Login2State extends State<Login2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 245, 249, 252),
      appBar: AppBar(
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Color.fromARGB(255, 236, 9, 0),
        title: Image.asset(
          'assets/santander_nome_login2.png',
          height: 60,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: Icon(Icons.place_outlined),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 12.0, right: 12.0, top: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Acessar sua conta",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              TextField(
                decoration: InputDecoration(label: Text("CPF")),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Lembrar meu CPF",
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  Switch(
                    value: true,
                    onChanged: (value) {},
                    activeColor: Color.fromARGB(255, 236, 9, 0),
                  )
                ],
              ),
              TextField(
                decoration: InputDecoration(label: Text("Senha")),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Lembrar minha senha",
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  Switch(
                    value: true,
                    onChanged: (value) {},
                    activeColor: Color.fromARGB(255, 236, 9, 0),
                  )
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "Esqueci minha senha",
                style: TextStyle(
                  color: Colors.red,
                  decoration: TextDecoration.underline,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (ctx) => CadastrarConta()));
                },
                child: Text(
                  "Cadastre sua conta",
                  style: TextStyle(
                    color: Colors.red,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () async {
                        RequestApi requestApi = RequestApi();
                        dynamic userContent = await requestApi.request(
                            methodHttp: "GET", route: "usuarios/1");
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (_) => Dashboard(
                                  userContent: userContent,
                                )));
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
      ),
    );
  }
}
