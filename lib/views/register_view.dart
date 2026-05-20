import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../services/auth_service.dart';
import '../core/utils/validators.dart';
import '../core/utils/input_masks.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final _formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final cpfController = TextEditingController();

  final allowedDomains = [
    "gmail.com",
    "outlook.com",
    "icloud.com",
  ];

  bool emailValidDomain = false;

  bool hasUppercase = false;
  bool hasNumber = false;
  bool hasMinLength = false;

  void _checkEmailDomain(String value) {
    final email = value.trim().toLowerCase();

    setState(() {
      emailValidDomain = allowedDomains.any(
        (d) => email.endsWith("@$d"),
      );
    });
  }

  void _checkPasswordRules(String value) {
    setState(() {
      hasUppercase = value.contains(RegExp(r'[A-Z]'));
      hasNumber = value.contains(RegExp(r'[0-9]'));
      hasMinLength = value.length >= 6;
    });
  }

  bool get isPasswordValid =>
      hasUppercase && hasNumber && hasMinLength;

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthService>(context);

    return Scaffold(
      backgroundColor: const Color(0xFFF6F6F6),
      body: SafeArea(
        child: Column(
          children: [
            
            Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(20, 22, 20, 22),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xFF7B2FD3),
                    Color(0xFF6A1B9A),
                  ],
                ),
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  const Text(
                    "Cadastre uma nova conta",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),

                  Positioned(
                    left: 0,
                    child: IconButton(
                      icon: const Icon(
                        Icons.arrow_back_ios_new,
                        color: Colors.white,
                        size: 18,
                      ),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: emailController,
                        onChanged: _checkEmailDomain,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Email obrigatório";
                          }
                          if (!emailValidDomain) {
                            return "Use Gmail, Outlook ou iCloud";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          labelText: "Email",
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),

                      const SizedBox(height: 10),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: allowedDomains.map((domain) {
                          final ok = emailController.text
                              .trim()
                              .toLowerCase()
                              .endsWith("@$domain");

                          return Padding(
                            padding:
                                const EdgeInsets.symmetric(vertical: 2),
                            child: Row(
                              children: [
                                Icon(
                                  ok
                                      ? Icons.check_circle
                                      : Icons.circle_outlined,
                                  size: 14,
                                  color: ok
                                      ? Colors.green
                                      : Colors.grey,
                                ),
                                const SizedBox(width: 6),
                                Text(
                                  domain,
                                  style: TextStyle(
                                    fontSize: 12,
                                    color:
                                        ok ? Colors.green : Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          );
                        }).toList(),
                      ),

                      const SizedBox(height: 12),

                      TextFormField(
                        controller: passwordController,
                        obscureText: true,
                        onChanged: _checkPasswordRules,
                        validator: Validators.password,
                        decoration: InputDecoration(
                          labelText: "Senha",
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),

                      const SizedBox(height: 10),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Requisitos da senha",
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                            ),
                          ),
                          const SizedBox(height: 6),
                          _ruleItem("1 letra maiúscula", hasUppercase),
                          _ruleItem("1 número", hasNumber),
                          _ruleItem("mínimo 6 caracteres", hasMinLength),
                        ],
                      ),

                      const SizedBox(height: 12),

                      TextFormField(
                        controller: confirmPasswordController,
                        obscureText: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Confirme sua senha";
                          }
                          if (value != passwordController.text) {
                            return "As senhas não coincidem";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          labelText: "Digite a mesma senha",
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),

                      const SizedBox(height: 12),

                      TextFormField(
                        controller: cpfController,
                        inputFormatters: [CpfInputFormatter()],
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "CPF obrigatório";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          labelText: "CPF",
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),

                      const SizedBox(height: 20),

                      SizedBox(
                        width: double.infinity,
                        height: 48,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF6A1B9A),
                            foregroundColor: Colors.white, // Define a cor do texto/ícone como branco
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          onPressed: () async {
                            if (!_formKey.currentState!.validate()) return;

                            if (!isPasswordValid || !emailValidDomain) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content:
                                      Text("Verifique os dados informados"),
                                ),
                              );
                              return;
                            }

                            await auth.register(
                              emailController.text.trim(),
                              passwordController.text.trim(),
                              cpfController.text.trim(),
                            );

                            Navigator.pop(context);
                          },
                        child: const Text(
  "Registrar",
  style: TextStyle(
    color: Colors.white,
    fontSize: 16,
    fontWeight: FontWeight.bold,
  ),
),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _ruleItem(String text, bool ok) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        children: [
          Icon(
            ok ? Icons.check_circle : Icons.circle_outlined,
            size: 14,
            color: ok ? Colors.green : Colors.grey,
          ),
          const SizedBox(width: 6),
          Text(
            text,
            style: TextStyle(
              fontSize: 12,
              color: ok ? Colors.green : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}