import 'package:flutter/material.dart';
import 'dart:async';

class Logotela extends StatefulWidget {
  @override
  _LogotelaState createState() => _LogotelaState();
}

class _LogotelaState extends State<Logotela> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 5), () {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        children: [
          const SizedBox(height: 190),
          Image.asset(
            'assets/Samu192.png',
            width: 300,
            height: 300,
          ),
          const SizedBox(height: 100),
          const CircularProgressIndicator(
            color: Color.fromARGB(255, 141, 137, 137),
          ),
        ],
      )),
      backgroundColor: const Color.fromARGB(255, 246, 245, 248),
    );
  }
}
