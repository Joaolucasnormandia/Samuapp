import 'package:flutter/material.dart';

class telatoken extends StatefulWidget {
  @override
  telatokenState createState() => telatokenState();
}

class CustomTextField extends StatelessWidget {
  const CustomTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.orange, 
        borderRadius: BorderRadius.circular(30), 
      ),
      child: const TextField(
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
class telatokenState extends State<telatoken> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0), 
          child: Image.asset(
            'assets/Samu192.png', 
            width: 40,  
            height: 40,  
          ),
        ),
        title: const Text('Conferir ocorrência',style: TextStyle(fontSize: 40),),
        backgroundColor: const Color.fromARGB(255, 173, 173, 173),
      ),
      body: const Center(
      child: Column(children:[ CustomTextField()])
      ),
    );
  }
}
