import 'package:appsamu/4TelaChamado.dart';
import 'package:flutter/material.dart';

class Telacadastro extends StatefulWidget {
  @override
  _TelacadastroState createState() => _TelacadastroState();
}

class CustomTextField extends StatelessWidget {
  const CustomTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 380,
      padding: EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.orange,
        borderRadius: BorderRadius.circular(30),
      ),
      child: const TextField(
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          hintText: 'Digite aqui...',
          border: InputBorder.none,
        ),
        style: TextStyle(
          fontSize: 20,
          color: Colors.black,
        ),
      ),
    );
  }
}

class _TelacadastroState extends State<Telacadastro> {
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
              'Login',
              style: TextStyle(fontFamily: 'Roboto'),
            ),
          ]),
          backgroundColor: const Color.fromARGB(244, 233, 95, 2),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 120,
            ),
            const Text(
              'Nome:',
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const CustomTextField(),
            const SizedBox(height: 20),
            const Text(
              'CPF:',
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Center(child: CustomTextField()),
            const SizedBox(height: 20),
            const SizedBox(height: 10),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                        builder: (context) => const SamuHomePage()),
                  );
                },
                child: const Text('Logar'))
          ],
        ));
  }
}
