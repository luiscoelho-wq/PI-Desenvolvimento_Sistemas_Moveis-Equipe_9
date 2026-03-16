import 'package:flutter/material.dart';
import 'package:projeto02/ui/login_page.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // IMAGEM DE FUNDO: ocupa toda a tela
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/Background.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),

          // CONTEÚDO: texto e botões
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  // Logo e textos centralizados
                  Center(
                    child: Column(
                      children: const [
                        SizedBox(height: 60),
                        Image(
                          image: AssetImage('assets/images/Icone.png'),
                          width: 300,
                          height: 300,
                        ),
                        SizedBox(height: 20),
                        Text(
                          "Atlas",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 76,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        SizedBox(height: 20),
                        Text(
                          "Guia contábil estratégico",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Botões centralizados
                  Center(
                    child: Column(
                      children: [
                        SizedBox(
                          width: 280,
                          height: 56,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              foregroundColor: Colors.black,
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const LoginPage()),
                              );
                            },
                            child: const Text("Fazer Login",
                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
                            ),
                            
                          ),
                        ),
                        const SizedBox(height: 8),
                        SizedBox(
                          width: 220,
                          child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              foregroundColor: Colors.white,
                              side: BorderSide(color: Colors.white),
                            ),
                            onPressed: () {},
                            child: const Text("Criar uma Nova Conta",
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
