import 'package:flutter/material.dart';
import 'package:safecity/pages/about.dart';
import 'package:safecity/pages/introduction.dart';
import 'package:safecity/pages/map.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const Home());
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(68, 65, 45, 44),
      appBar: AppBar(
        title: const Text('Inicio'),
        backgroundColor: const Color.fromARGB(0, 53, 113, 55),
        elevation: 0,
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 17, 118, 19),
              ),
              child: Center(
                child: Text(
                  'Safe City \n\n Monitoramento de desastres ambientais',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              )
            ),
            ListTile(
              title: const Text('Introdução'),
              onTap: () {
                Navigator.pushReplacement(
                  context, MaterialPageRoute(
                    builder: (context) => const Introduction(),
                  )
                );
              },
            ),
            ListTile(
              title: const Text('Sobre'),
              onTap: () {
                Navigator.pushReplacement(
                  context, MaterialPageRoute(
                    builder: (context) => const About(),
                  )
                );
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logo.png',
              height: 400,
              width: 400,
            ),
            const Text(
              'Bem-vindo(a) ao nosso aplicativo de monitoramento de desastres naturais!',
              style: TextStyle(
                  fontSize: 25,
                  color: Colors.white
                ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            const SizedBox(
                width: 350,
                child: Text(
                'Nosso objetivo é fornecer informações e recursos para ajudar as pessoas a se protegerem de desastres naturais, como inundações, deslizamentos e tempestades.',
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 20),

            SizedBox(
              width: MediaQuery.of(context).size.width * 0.4,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                            context, MaterialPageRoute(
                              builder: (context) => const Mapa(),
                            )
                          );
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(const Color.fromARGB(255, 53, 113, 55))
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    const Icon(Icons.maps_home_work),
                    const SizedBox(width: 20,),
                    const Text('Veja o mapa'),
                  ],
                )
              ),
            ),
            
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.7,
              child: ElevatedButton(
                onPressed: () {
                  launchUrl(Uri(
                    scheme: 'tel',
                    path: '162',
                  ));
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(const Color.fromARGB(255, 53, 113, 55))
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    const Icon(Icons.phone),
                    const SizedBox(width: 20),
                    const Text('Ligar para a Central de Atendimento'),
                  ],
                )
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.85,
              child: ElevatedButton(
                onPressed: () {
                  launchUrl(Uri(
                    scheme: 'https',
                    host: 'url1.io',
                    path: '/s/Vbrl9'
                  ));
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(const Color.fromARGB(255, 53, 113, 55))
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    const Icon(Icons.library_books),
                    const SizedBox(width: 20,),
                    const Text('Saber mais sobre a Lei de Crimes Ambientais'),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Sua segurança é nossa prioridade. Esteja preparado e previna desastres naturais, proteja-se!',
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}