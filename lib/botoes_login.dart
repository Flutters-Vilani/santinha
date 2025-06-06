import 'package:flutter/material.dart';
import 'package:santinha/login2.dart';

class BotoesLogin extends StatefulWidget {
  const BotoesLogin({super.key});

  @override
  State<BotoesLogin> createState() => _BotoesLoginState();
}

class _BotoesLoginState extends State<BotoesLogin> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (_) => Login2()));
      },
      child: Card(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.26,
          height: 100,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.message,
                color: Colors.red,
              ),
              Text("Ajuda")
            ],
          ),
        ),
      ),
    );
  }
}
