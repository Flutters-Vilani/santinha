import 'package:flutter/material.dart';
import 'package:santinha/botoes_login.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  bool cardAberto = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 245, 249, 252),
      body: Column(
        children: [
          Container(
            color: Colors.green,
            height: cardAberto
                ? MediaQuery.of(context).size.height * 0.46
                : MediaQuery.of(context).size.height * 0.36,
            child: Stack(
              children: [
                Image.asset("assets/fundo_dashboard.png"),
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        "assets/teste3.png",
                        width: 150,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 16.0, left: 16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Icon(Icons.search, color: Colors.white),
                            Icon(Icons.message, color: Colors.white),
                            Icon(Icons.notifications, color: Colors.white)
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 145,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 12.0, left: 12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Olá, Guilherme",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          "Ag 4317 Cc 01097031-8",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height * 0.265,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 12.0),
                    child: Card(
                      color: Colors.red,
                      child: Container(
                        padding: EdgeInsets.all(12),
                        width: MediaQuery.of(context).size.width * 0.93,
                        height: cardAberto ? 150 : 60,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.money,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text("Saldo disponível"),
                              ],
                            ),
                            IconButton(
                                onPressed: () {
                                  setState(() {
                                    cardAberto = !cardAberto;
                                  });
                                },
                                icon: Icon(Icons.arrow_downward))
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 350,
            height: 110,
            child: ListView.builder(
                itemCount: 6,
                scrollDirection: Axis.horizontal,
                itemBuilder: (ctx, index) {
                  return BotoesLogin();
                }),
          )
        ],
      ),
    );
  }
}
