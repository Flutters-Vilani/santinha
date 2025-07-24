import 'package:santinha/components/botao_pre_login.dart';
import 'package:flutter/material.dart';

class PreLogin extends StatefulWidget {
  const PreLogin({super.key});

  @override
  State<PreLogin> createState() => _PreLoginState();
}

class _PreLoginState extends State<PreLogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 245, 249, 252),
      appBar: AppBar(
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
      drawer: Drawer(),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: double.maxFinite,
                    height: MediaQuery.of(context).size.height * 0.55,
                    child: Image.asset(
                      "assets/pessoa_login.jpeg",
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      BotaoPreLogin(
                        Icons.message,
                        "Ajuda",
                        Colors.grey,
                        Colors.white,
                        Color.fromARGB(255, 236, 9, 0),
                      ),
                      BotaoPreLogin(
                        Icons.lock_open,
                        "ID Santander",
                        Colors.grey,
                        Colors.white,
                        Color.fromARGB(255, 236, 9, 0),
                      ),
                      BotaoPreLogin(
                        Icons.logout,
                        "Acessar sua\nconta",
                        Colors.white,
                        Color.fromARGB(255, 236, 9, 0),
                        Colors.white,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 85,
            width: double.maxFinite,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25), topRight: Radius.circular(25)),
              color: Colors.white,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.swipe_vertical_outlined,
                  size: 30,
                  color: Color.fromARGB(255, 236, 9, 0),
                ),
                SizedBox(
                  width: 15,
                ),
                Text(
                  "Pagar ou cobrar",
                  style: TextStyle(
                    fontSize: 16,
                    color: Color.fromARGB(255, 236, 9, 0),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
