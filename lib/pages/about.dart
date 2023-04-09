import 'package:flutter/material.dart';
import 'package:safecity/pages/home.dart';

class About extends StatefulWidget {
  const About({super.key});

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sobre'),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () { 
                Navigator.pushReplacement(
                  context, 
                  MaterialPageRoute(builder: (context) => const Home())
                );
              }
            );
          }
        )
      ),
      
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            const Text(
              'Em desenvolvimento...',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 10,),
            const Icon(Icons.work_history),
          ],
        ),
      )
    );
  }
}