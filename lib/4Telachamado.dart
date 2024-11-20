import 'package:appsamu/6telaacompanhamento.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SamuHomePage extends StatelessWidget {
  const SamuHomePage({super.key});

  // Método para exibir o pop-up de token
  void _showTokenDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Token Gerado'),
          content: const Text('Seu token de atendimento é: SAMU-192-001.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                      builder: (context) => const TelaAcompanhamento()),
                );
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void _callSAMU(BuildContext context) async {
    final Uri phoneNumber =
        Uri(scheme: 'tel', path: '75981598484'); // Número do SAMU

    if (await canLaunchUrl(phoneNumber)) {
      await launchUrl(phoneNumber);

      await Future.delayed(const Duration(seconds: 5));

      _showTokenDialog(context);
    } else {
      throw 'Não foi possível fazer a ligação para $phoneNumber';
    }
  }

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
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () => _callSAMU(context),
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
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                      builder: (context) => const TelaAcompanhamento()),
                );
              },
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
