import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 245, 249, 252),
      body: Stack(
        children: [
          Image.asset("assets/fundo_dashboard.png"),
          Padding(
            padding: const EdgeInsets.only(right: 16.0, left: 16.0),
            child: SafeArea(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                  Icon(Icons.message, color: Colors.white),
                  Icon(Icons.notifications, color: Colors.white),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 80,
            child: Padding(
              padding: const EdgeInsets.only(right: 16.0, left: 16.0),
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
            bottom: -50,
            child: Card(
              color: Colors.red,
              child: Container(
                height: 120,
                child: Row(
                  children: [Icon(Icons.money)],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
