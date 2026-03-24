import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class SignupPage extends StatelessWidget {
  SignupPage({super.key});

  final cpfMask = MaskTextInputFormatter(
    mask: '###.###.###-##',
    filter: {"#": RegExp(r'[0-9]')},
  );

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
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    const SizedBox(height: 40),

                    // LOGO
                    const Image(
                      image: AssetImage('assets/images/Icone.png'),
                      width: 200,
                      height: 200,
                    ),

                    const SizedBox(height: 10),

                    const Text(
                      "Criar Conta",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.w800,
                      ),
                    ),

                    const SizedBox(height: 40),

                    // NOME
                    _inputField("Nome"),

                    const SizedBox(height: 20),

                    // EMAIL
                    _inputField("Email"),

                    const SizedBox(height: 20),

                    // CPF
                    Material(
                      elevation: 8,
                      shadowColor: Colors.black45,
                      borderRadius: BorderRadius.circular(14),
                      child: TextField(
                        keyboardType: TextInputType.number,
                        inputFormatters: [cpfMask],
                        decoration: InputDecoration(
                          hintText: 'CPF',
                          hintStyle: const TextStyle(color: Colors.black),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14),
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

                    // SENHA
                    _inputField("Senha", isPassword: true),

                    const SizedBox(height: 20),

                    // CONFIRMAR SENHA
                    _inputField("Confirmar Senha", isPassword: true),

                    const SizedBox(height: 30),

                    // BOTÃO CRIAR CONTA
                    Material(
                      color: Colors.transparent,
                      elevation: 5,
                      shadowColor: Colors.black54,
                      borderRadius: BorderRadius.circular(14),
                      child: SizedBox(
                        width: 260,
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            foregroundColor: Colors.white,
                            side: const BorderSide(color: Colors.white),
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14),
                            ),
                          ),
                          onPressed: () {},
                          child: const Text(
                            'Criar Conta',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 10),

                    // VOLTAR PARA LOGIN
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.white,
                        textStyle: const TextStyle(
                          decoration: TextDecoration.underline,
                          fontSize: 16,
                        ),
                      ),
                      child: const Text('Já tenho conta'),
                    ),

                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _inputField(String hint, {bool isPassword = false}) {
    return Material(
      elevation: 8,
      shadowColor: Colors.black45,
      borderRadius: BorderRadius.circular(14),
      child: TextField(
        obscureText: isPassword,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(color: Colors.black),
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: BorderSide.none,
          ),
          contentPadding: const EdgeInsets.symmetric(
            vertical: 16,
            horizontal: 20,
          ),
        ),
      ),
    );
  }
}
