import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../viewmodels/client_viewmodel.dart';
import '../core/utils/client_formatters.dart';
import 'client_form_view.dart';

import '../services/auth_service.dart';
import 'login_view.dart';

class ClientListView extends StatelessWidget {
  const ClientListView({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<ClientViewModel>(context);

    return Scaffold(
      backgroundColor: const Color(0xFFF6F6F6),

      body: SafeArea(
        child: Column(
          children: [
           
            Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(22, 24, 22, 30),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xFF7B2FD3),
                    Color(0xFF6A1B9A),
                  ],
                ),
                boxShadow: [
                  BoxShadow(
                    color: Color(0x4D6A1B9A),
                    blurRadius: 14,
                    offset: Offset(0, 6),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Clientes",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        "Gestão da carteira contábil",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white70,
                        ),
                      ),
                    ],
                  ),
                 GestureDetector(
  onTap: () async {
    final auth = Provider.of<AuthService>(
      context,
      listen: false,
    );

    await auth.logout();

    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (_) => LoginView(),
      ),
      (route) => false,
    );
  },

  child: Container(
    padding: const EdgeInsets.all(4),
    decoration: BoxDecoration(
      color: Colors.white24,
      shape: BoxShape.circle,
    ),
child: CircleAvatar(
  radius: 22,
  backgroundColor: Colors.white,

  child: Text(
    Provider.of<AuthService>(
      context,
      listen: false,
    ).currentUser?.name
            .substring(0, 2)
            .toUpperCase() ??
        "LM",

    style: const TextStyle(
      color: Color(0xFF6A1B9A),
      fontWeight: FontWeight.bold,
    ),
  ),
),
  ),
),
                ],
              ),
            ),

            Expanded(
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.all(16),
                itemCount: vm.clients.length,
                itemBuilder: (_, i) {
                  final c = vm.clients[i];

                  return Container(
                    margin: const EdgeInsets.only(bottom: 12),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.06),
                          blurRadius: 12,
                          offset: const Offset(0, 6),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        
                        Text(
                          c.name,
                          style: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                          ),
                        ),

                        const SizedBox(height: 12),

                        const Text(
                          "Dados pessoais",
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),

                        const SizedBox(height: 4),

                        Text(
                          c.email ?? "Sem e-mail",
                          style: const TextStyle(
                            fontSize: 13,
                            color: Colors.black,
                          ),
                        ),

                        const SizedBox(height: 4),

                        Text(
                          ClientFormatters.phone(c.phone),
                          style: const TextStyle(
                            fontSize: 13,
                            color: Colors.black,
                          ),
                        ),

                        const SizedBox(height: 10),

                        const Text(
                          "Dados da empresa",
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),

                        const SizedBox(height: 4),

                        Text(
                          ClientFormatters.cnpj(c.cnpj),
                          style: const TextStyle(
                            fontSize: 13,
                            color: Colors.black,
                          ),
                        ),

                        const SizedBox(height: 10),

                        Row(
                          children: [
                            const Text(
                              "Faturamento: ",
                              style: TextStyle(
                                fontSize: 13,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              ClientFormatters.money(c.faturamentoMensal),
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 6),

                        Row(
                          children: [
                            const Text(
                              "Funcionários: ",
                              style: TextStyle(
                                fontSize: 13,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              "${c.numeroFuncionarios ?? 0}",
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF6A1B9A),
        child: const Icon(Icons.add, color: Colors.white),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => const ClientFormView(),
            ),
          );
        },
      ),
    );
  }
}