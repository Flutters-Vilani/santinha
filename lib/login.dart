import 'package:flutter/material.dart';
import 'package:santinha/botoes_login.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
      drawer: Drawer(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.58,
            width: double.maxFinite,
            child: Image.asset(
              "assets/pessoa_login.jpeg",
              // height: 500,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 15, left: 25, right: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                BotoesLogin(),
                BotoesLogin(),
                BotoesLogin(), // rgb(204, 7, 1) -> cor ultimo botao
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(25),
                    topLeft: Radius.circular(25))),
            padding: EdgeInsets.only(top: 25, bottom: 35),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.handyman,
                  color: Color.fromARGB(255, 236, 9, 0),
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  "Pagar ou cobrar",
                  style: TextStyle(
                    color: Color.fromARGB(255, 236, 9, 0),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
