import 'package:appsamu/6telaacompanhamento.dart';
import 'package:flutter/material.dart';

class telatoken extends StatefulWidget {
  @override
  telatokenState createState() => telatokenState();
}

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  const CustomTextField({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 380,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 243, 157, 157),
        borderRadius: BorderRadius.circular(30),
      ),
      child: TextField(
        controller: controller,
        textAlign: TextAlign.center,
        decoration: const InputDecoration(
          hintText: 'Digite aqui...',
          border: InputBorder.none,
        ),
        style: const TextStyle(
          fontSize: 20,
          color: Colors.black,
        ),
      ),
    );
  }
}

class telatokenState extends State<telatoken> {
  final _tokenController = TextEditingController();
  String _errorText = '';

  bool _isValidToken(String token) {
    return token.length == 5 && int.tryParse(token) != null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            'assets/Samu192.png',
            width: 40,
            height: 40,
          ),
        ),
        title: const Text(
          'Conferir ocorrência',
          style: TextStyle(fontSize: 30, fontFamily: 'Roboto'),
        ),
        backgroundColor: const Color.fromARGB(255, 173, 173, 173),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'INSIRA O TOKEN / PROTOCOLO',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 18,
            ),
            CustomTextField(controller: _tokenController),
            const SizedBox(height: 35),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  String token = _tokenController.text;
                  if (_isValidToken(token)) {
                    _errorText = '';
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(
                      'Token $token válido!',
                    )));
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                          builder: (context) => const TelaAcompanhamento()),
                    );
                    //adicione aba gay
                  } else {
                    _errorText = 'Token inválido. Deve ter 5 dígitos.';
                  }
                });
              },
              style: ElevatedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                textStyle: const TextStyle(fontSize: 34),
                minimumSize: const Size(25, 25),
              ),
              child: const Text('Validar Token'),
            ),
            if (_errorText.isNotEmpty)
              Text(
                _errorText,
                style: const TextStyle(color: Colors.red, fontSize: 16),
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
