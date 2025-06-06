import 'package:flutter/material.dart';

import 'login.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 5)).then(
      (value) {
        Navigator.of(context).push(MaterialPageRoute(builder: (_) => Login()));
      },
    );

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Center(
        child: SizedBox(
          height: 120,
          child: Image.asset(
            'assets/logo_santinha.png',
            // height: 250,
          ),
        ),
      ),
    );
  }
}
