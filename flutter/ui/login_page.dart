import 'package:flutter/material.dart';
class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // IMAGEM DE FUNDO
          SizedBox.expand(
            child: Image.asset(
              'assets/images/Background.png',
              fit: BoxFit.cover,
            ),
          ),

          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  // LOGO E TEXTO
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
                        SizedBox(height: 40),
                      ],
                    ),
                  ),

                  // CAMPO DE USUÁRIO
                  Material(
                    elevation: 8,
                    shadowColor: Colors.black45,
                    borderRadius: BorderRadius.circular(82),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Usuário',
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(82),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 16,
                          horizontal: 20,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  // CAMPO DE SENHA
                  Material(
                    elevation: 8,
                    shadowColor: Colors.black45,
                    borderRadius: BorderRadius.circular(82),
                    child: TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: 'Senha',
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(82),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 16,
                          horizontal: 20,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  // BOTÃO ENTRAR (OutlinedButton com sombra)
                  Material(
                    color: Colors.transparent,
                    elevation: 5,
                    shadowColor: Colors.black54,
                    borderRadius: BorderRadius.circular(82),
                    child: SizedBox(
                      width: 280,
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          foregroundColor: Colors.white,
                          side: const BorderSide(color: Colors.white),
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(82),
                          ),
                        ),
                        onPressed: () {},
                        child: const Text(
                          'Entrar',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 10),

                  // ESQUECI A SENHA (apenas texto sublinhado)
                  TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.white,
                      padding: EdgeInsets.zero,
                      minimumSize: const Size(0, 0),
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      textStyle: const TextStyle(
                        decoration: TextDecoration.underline,
                        fontSize: 16,
                      ),
                    ),
                    child: const Text('Esqueci a senha'),
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
