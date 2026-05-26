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
                  colors: [Color(0xFF7B2FD3), Color(0xFF6A1B9A)],
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
                        style: TextStyle(fontSize: 14, color: Colors.white70),
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
                        MaterialPageRoute(builder: (_) => LoginView()),
                        (route) => false,
                      );
                    },

                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: Colors.white24,
                        shape: BoxShape.circle,
                      ),

                      child: const CircleAvatar(
                        radius: 24,
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.logout,
                          color: Color(0xFF6A1B9A),
                          size: 24,
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

                padding: const EdgeInsets.fromLTRB(16, 18, 16, 100),

                itemCount: vm.clients.length,

                itemBuilder: (_, i) {
                  final c = vm.clients[i];

                  return Container(
                    margin: const EdgeInsets.only(bottom: 16),

                    padding: const EdgeInsets.all(18),

                    decoration: BoxDecoration(
                      color: Colors.white,

                      borderRadius: BorderRadius.circular(24),

                      border: Border.all(color: const Color(0xFFF0F0F0)),

                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.04),
                          blurRadius: 18,
                          offset: const Offset(0, 10),
                        ),
                      ],
                    ),

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,

                          children: [
                            Container(
                              width: 52,
                              height: 52,

                              decoration: BoxDecoration(
                                color: const Color(
                                  0xFF6A1B9A,
                                ).withOpacity(0.12),

                                borderRadius: BorderRadius.circular(16),
                              ),

                              child: const Icon(
                                Icons.business_rounded,
                                color: Color(0xFF6A1B9A),
                                size: 26,
                              ),
                            ),

                            const SizedBox(width: 14),

                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,

                                children: [
                                  Text(
                                    c.name,

                                    style: const TextStyle(
                                      fontSize: 18,

                                      fontWeight: FontWeight.w700,

                                      color: Color(0xFF1F1F1F),
                                    ),
                                  ),

                                  const SizedBox(height: 3),

                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 10,
                                      vertical: 4,
                                    ),

                                    decoration: BoxDecoration(
                                      color: Colors.green.withOpacity(0.12),

                                      borderRadius: BorderRadius.circular(8),
                                    ),

                                    child: const Text(
                                      "Perfil empresarial",

                                      style: TextStyle(
                                        fontSize: 11,

                                        fontWeight: FontWeight.w600,

                                        color: Colors.green,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 18),

                        Row(
                          children: [
                            Icon(
                              Icons.email_outlined,
                              size: 18,
                              color: Colors.grey.shade600,
                            ),

                            const SizedBox(width: 8),

                            Expanded(
                              child: Text(
                                c.email ?? "Sem e-mail",

                                style: TextStyle(
                                  fontSize: 13,

                                  color: Colors.grey.shade800,
                                ),
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 10),

                        Row(
                          children: [
                            Icon(
                              Icons.phone_outlined,
                              size: 18,
                              color: Colors.grey.shade600,
                            ),

                            const SizedBox(width: 8),

                            Text(
                              ClientFormatters.phone(c.phone),

                              style: TextStyle(
                                fontSize: 13,

                                color: Colors.grey.shade800,
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 10),

                        Row(
                          children: [
                            Icon(
                              Icons.badge_outlined,
                              size: 18,
                              color: Colors.grey.shade600,
                            ),

                            const SizedBox(width: 8),

                            Text(
                              ClientFormatters.cnpj(c.cnpj),

                              style: TextStyle(
                                fontSize: 13,

                                color: Colors.grey.shade800,
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 18),

                        Container(height: 1, color: Colors.grey.shade200),

                        const SizedBox(height: 16),

                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                padding: const EdgeInsets.all(14),

                                decoration: BoxDecoration(
                                  color: const Color(
                                    0xFF6A1B9A,
                                  ).withOpacity(0.06),

                                  borderRadius: BorderRadius.circular(16),
                                ),

                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,

                                  children: [
                                    const Row(
                                      children: [
                                        Icon(
                                          Icons.attach_money,

                                          size: 18,

                                          color: Color(0xFF6A1B9A),
                                        ),

                                        SizedBox(width: 4),

                                        Text(
                                          "Faturamento",

                                          style: TextStyle(
                                            fontSize: 11,

                                            fontWeight: FontWeight.w600,

                                            color: Color(0xFF6A1B9A),
                                          ),
                                        ),
                                      ],
                                    ),

                                    SizedBox(height: 8),

                                    Text(
                                      ClientFormatters.money(
                                        c.faturamentoMensal,
                                      ),

                                      style: const TextStyle(
                                        fontSize: 15,

                                        fontWeight: FontWeight.bold,

                                        color: Color(0xFF1F1F1F),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            const SizedBox(width: 10),

                            Expanded(
                              child: Container(
                                padding: const EdgeInsets.all(14),

                                decoration: BoxDecoration(
                                  color: Colors.blue.withOpacity(0.08),

                                  borderRadius: BorderRadius.circular(16),
                                ),

                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,

                                  children: [
                                    const Row(
                                      children: [
                                        Icon(
                                          Icons.groups_rounded,

                                          size: 18,

                                          color: Colors.blue,
                                        ),

                                        SizedBox(width: 4),

                                        Text(
                                          "Funcionários",

                                          style: TextStyle(
                                            fontSize: 11,

                                            fontWeight: FontWeight.w600,

                                            color: Colors.blue,
                                          ),
                                        ),
                                      ],
                                    ),

                                    SizedBox(height: 8),

                                    Text(
                                      "${c.numeroFuncionarios ?? 0}",

                                      style: const TextStyle(
                                        fontSize: 18,

                                        fontWeight: FontWeight.bold,

                                        color: Color(0xFF1F1F1F),
                                      ),
                                    ),
                                  ],
                                ),
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

      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: const Color(0xFF6A1B9A),

        elevation: 6,

        icon: const Icon(Icons.add, color: Colors.white),

        label: const Text(
          "Novo Cliente",

          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        ),

        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const ClientFormView()),
          );
        },
      ),
    );
  }
}
