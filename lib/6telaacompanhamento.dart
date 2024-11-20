import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';

class PostosController extends ChangeNotifier {
  double lat = 0.0;
  double long = 0.0;
  String erro = '';

  PostosController() {
    getPosicao();
  }

  getPosicao() async {
    try {
      Position posicao = await _posicaoAtual();
      lat = posicao.latitude;
      long = posicao.longitude;
    } catch (e) {
      erro = e.toString();
    }
    notifyListeners();
  }

  Future<Position> _posicaoAtual() async {
    LocationPermission permissao;

    bool ativado = await Geolocator.isLocationServiceEnabled();
    if (!ativado) {
      return Future.error('Habilite a localização');
    }
    permissao = await Geolocator.checkPermission();
    if (permissao == LocationPermission.denied) {
      return Future.error('Aceite a permissão de localização');
    }
    if (permissao == LocationPermission.deniedForever) {
      return Future.error('Vá para configurações e autorize a localização');
    }
    return await Geolocator.getCurrentPosition();
  }
}

class TelaAcompanhamento extends StatelessWidget {
  const TelaAcompanhamento({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PostosController(),
      child: Scaffold(
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
        body: Column(
          children: [
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'STATUS: Á CAMINHO',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 10),
                Image.asset(
                  'assets/bolaverde.png',
                  width: 50,
                  height: 50,
                ),
              ],
            ),
            const SizedBox(height: 30),
            Consumer<PostosController>(
              builder: (context, controller, child) {
                if (controller.erro.isNotEmpty) {
                  return Center(
                    child: Text(
                      'Erro: ${controller.erro}',
                      style: const TextStyle(color: Colors.red, fontSize: 18),
                    ),
                  );
                }
                return Center(
                  child: Text(
                    'Latitude: ${controller.lat}\nLongitude: ${controller.long}',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 253, 152, 0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 48, vertical: 24),
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
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 250, 150, 0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 48, vertical: 24),
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
          ],
        ),
      ),
    );
  }
}
