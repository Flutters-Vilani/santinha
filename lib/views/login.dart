import 'package:santinha/controllers/auth/login_controller.dart';
import 'package:santinha/views/cadastro_conta.dart';
import 'package:santinha/views/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool vrSwitchCpf = false;
  bool vrSwitchSenha = false;

  TextEditingController cpfController = TextEditingController();
  TextEditingController senhaController = TextEditingController();

  LoginController loginController = LoginController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.arrow_back_ios)),
        backgroundColor: Color.fromARGB(255, 236, 9, 0),
        iconTheme: IconThemeData(color: Colors.white),
        title: Image.asset(
          "assets/santander_nome_login2.png",
          height: 60,
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              Icons.place_outlined,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(
            left: 12.0, right: 12.0, top: 12.0, bottom: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Acessar sua conta",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            SizedBox(
              height: 15,
            ),
            TextField(
              controller: cpfController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                label: Text("CPF"),
              ),
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
                //switch lembrar meu CPF
                Switch(
                  value: vrSwitchCpf,
                  activeColor: Colors.white,
                  activeTrackColor: Color.fromARGB(255, 236, 9, 0),
                  onChanged: (value) {
                    setState(() {
                      vrSwitchCpf = value;
                    });
                  },
                )
              ],
            ),
            TextField(
              controller: senhaController,
              decoration: InputDecoration(
                label: Text("Senha"),
              ),
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     Text(
            //       "Lembrar minha senha",
            //       style: TextStyle(
            //         color: Colors.grey,
            //       ),
            //     ),

            //     // switch lembrar minha senha
            //     Switch(
            //         activeColor: Colors.white,
            //         activeTrackColor: Color.fromARGB(255, 236, 9, 0),
            //         value: vrSwitchSenha,
            //         onChanged: (value) {
            //           setState(() {
            //             vrSwitchSenha = value;
            //           });
            //         })
            //   ],
            // ),
            SizedBox(
              height: 30,
            ),
            Text(
              "Esqueci minha senha",
              style: TextStyle(
                color: Color.fromARGB(255, 236, 9, 0),
                decoration: TextDecoration.underline,
                decorationColor: Color.fromARGB(255, 236, 9, 0),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => CadastroConta(),
                  ),
                );
              },
              child: Text(
                "Criar uma conta agora",
                style: TextStyle(
                  color: Color.fromARGB(255, 236, 9, 0),
                  decoration: TextDecoration.underline,
                  decorationColor: Color.fromARGB(255, 236, 9, 0),
                ),
              ),
            ),
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () async {
                    final prefs = await SharedPreferences.getInstance();

                    if (vrSwitchCpf) {
                      await prefs.setBool("cpf", true);
                    }
                    dynamic resposta = await loginController.login(
                        cpfController.text, senhaController.text);

                    if (resposta['statusCode'] != 200) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: Colors.red,
                          content: Text("Nao logou"),
                        ),
                      );
                    } else {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (ctx) => Dashboard()));
                    }
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: 40,
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Color.fromARGB(255, 236, 9, 0),
                    ),
                    child: Text(
                      "Entrar",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                )
              ],
            ))
          ],
        ),
      ),
    );
  }
}
