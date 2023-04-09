import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:safecity/pages/home.dart';

class Introduction extends StatefulWidget {
  const Introduction({super.key});

  @override
  State<Introduction> createState() => _IntroductionState();
}

class _IntroductionState extends State<Introduction> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Introdução'),
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