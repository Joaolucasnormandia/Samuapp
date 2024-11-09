import 'package:flutter/material.dart';

class Telaacompanhamento extends StatelessWidget {
  const Telaacompanhamento({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(children: [
          Image.asset(
            'assets/Samu192.png',
            width: 60,
            height: 60,
          ),
          const SizedBox(width: 8),
          const Text(
            'SAMU 192',
            style: TextStyle(fontFamily: 'Roboto'),
          ),
        ]),
        backgroundColor: const Color.fromARGB(244, 233, 95, 2),
      ),
      body: Column(children: [
        SizedBox(
          height: 30,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'STATUS: Á CAMINHO',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            SizedBox(width: 10),
            Image.asset(
              'assets/bolaverde.png',
              width: 50,
              height: 50,
            ),
          ],
        ),
        Image.asset('assets/mapateste.png'),
        SizedBox(
          height: 30,
        ),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 253, 152, 0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            padding: EdgeInsets.symmetric(horizontal: 48, vertical: 24),
          ),
          child: const Text(
            'INSTRUÇÃO DE ESPERA',
            style: TextStyle(
              fontSize: 21,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(
          height: 30,
        ),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 250, 150, 0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            padding: EdgeInsets.symmetric(horizontal: 48, vertical: 24),
          ),
          child: const Text(
            'CANCELAR CHAMADO',
            style: TextStyle(
              fontSize: 21,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ]),
    );
  }
}
