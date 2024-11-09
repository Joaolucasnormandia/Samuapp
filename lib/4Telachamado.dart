import 'package:appsamu/5telatoken.dart';
import 'package:flutter/material.dart';

class SamuApp extends StatelessWidget {
  const SamuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SAMU 24H',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: const SamuHomePage(),
    );
  }
}

class SamuHomePage extends StatelessWidget {
  const SamuHomePage({super.key});

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
            'Atendimento - SAMU 192',
            style: TextStyle(fontFamily: 'Roboto'),
          ),
        ]),
        backgroundColor: const Color.fromARGB(244, 255, 150, 0),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => telatoken()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 255, 150, 0),
                padding:
                    const EdgeInsets.symmetric(horizontal: 60, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
              child: const Text(
                'LIGUE IMEDIATAMENTE 192',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
            const SizedBox(height: 13),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 255, 150, 0),
                padding:
                    const EdgeInsets.symmetric(horizontal: 75, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
              child: const Text(
                'CONFERIR STATUS',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
            const SizedBox(height: 30),
            const Text(
              'Localização',
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
            Image.asset(
              'assets/loc.png',
              width: 90,
              height: 90,
            ),
            Image.asset(
              'assets/logo.png',
              height: 200,
            ),
          ],
        ),
      ),
    );
  }
}
