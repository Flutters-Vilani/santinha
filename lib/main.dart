import 'package:flutter/material.dart';
import 'package:santinha/comprovante.dart';

import 'splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Comprovante(),
    );
  }
}
