import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../services/auth_service.dart';
import '../core/utils/validators.dart';
import '../core/constants/app_text_styles.dart';

import 'home_view.dart';
import 'register_view.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});

  final _formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthService>(context);

    return Scaffold(
      backgroundColor: const Color(0xFFF6F6F6),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 20,
                    offset: const Offset(0, 10),
                  )
                ],
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    const Icon(
                      Icons.account_balance,
                      size: 50,
                      color: Color(0xFF6A1B9A),
                    ),

                    const SizedBox(height: 16),

                    const Text(
                      "Atlas Contábil",
                      style: AppTextStyles.title,
                    ),

                    const SizedBox(height: 6),

                    Text(
                      "Acesse sua conta",
                      style: AppTextStyles.subtitle,
                    ),

                    const SizedBox(height: 30),

                    TextFormField(
                      controller: emailController,
                      validator: Validators.email,
                      decoration: InputDecoration(
                        labelText: "Email",
                        prefixIcon: const Icon(Icons.email),
                        filled: true,
                        fillColor: Colors.grey.shade100,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),

                    const SizedBox(height: 12),

                    TextFormField(
                      controller: passwordController,
                      obscureText: true,
                      validator: Validators.password,
                      decoration: InputDecoration(
                        labelText: "Senha",
                        prefixIcon: const Icon(Icons.lock),
                        filled: true,
                        fillColor: Colors.grey.shade100,
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
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            await auth.login(
                              emailController.text.trim(),
                              passwordController.text.trim(),
                            );

                            if (auth.currentUser != null) {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => HomeView(),
                                ),
                              );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("Login inválido"),
                                ),
                              );
                            }
                          }
                        },
                      style: ElevatedButton.styleFrom(
  backgroundColor: const Color(0xFF6A1B9A),
  foregroundColor: Colors.white,

  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(12),
  ),
),

child: const Text(
  "Entrar",
  style: TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
  ),
),
                      ),
                    ),

                    const SizedBox(height: 10),

                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => RegisterView(),
                          ),
                        );
                      },
                      child: const Text("Criar conta"),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
