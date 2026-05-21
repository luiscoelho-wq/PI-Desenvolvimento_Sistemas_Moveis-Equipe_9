import 'package:flutter/material.dart';
import '../viewmodels/dashboard_viewmodel.dart';
import 'widgets/week_calendar.dart';
import 'widgets/category_pie_chart.dart';
import 'widgets/task_slots.dart';
import 'login_view.dart';

class DashboardView extends StatefulWidget {
  final DashboardViewModel vm;

  const DashboardView({
    super.key,
    required this.vm,
  });

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  @override
  Widget build(BuildContext context) {
    final vm = widget.vm;

    return Scaffold(
      backgroundColor: const Color(0xFFF6F6F6),

      body: AnimatedBuilder(
        animation: vm,

        builder: (_, __) {
          return SafeArea(
            child: Column(
              children: [

                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.fromLTRB(22, 24, 22, 30),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color(0xFF7B2FD3),
                        Color(0xFF6A1B9A),
                      ],
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFF6A1B9A).withOpacity(0.25),
                        blurRadius: 14,
                        offset: const Offset(0, 6),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Olá, ${vm.authService.currentUser?.name ?? ''}",
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 4),
                          const Text(
                            "Painel Inteligente",
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.white70,
                            ),
                          ),
                        ],
                      ),

                      GestureDetector(
                        onTap: () async {
                          await vm.authService.logout();
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
                          decoration: const BoxDecoration(
                            color: Colors.white24,
                            shape: BoxShape.circle,
                          ),
                          child: CircleAvatar(
                            radius: 24,
                            backgroundColor: Colors.white,
                            child: Text(
                              vm.authService.currentUser?.name
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
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const SizedBox(height: 12),

                        WeekCalendar(
                          selectedDay: vm.selectedDay,
                          onDaySelected: vm.setSelectedDay,
                        ),

                        const SizedBox(height: 18),

                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Row(
                            children: [
                              Expanded(
                                child: FutureBuilder<int>(
                                  future: vm.pendentes,
                                  builder: (context, snapshot) {
                                    if (snapshot.connectionState == ConnectionState.waiting) {
                                      return const Center(child: CircularProgressIndicator());
                                    }
                                    return _MetricCard(
                                      title: "Pendentes",
                                      value: snapshot.data ?? 0,
                                      color: Colors.redAccent,
                                    );
                                  },
                                ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: FutureBuilder<int>(
                                  future: vm.concluidas,
                                  builder: (context, snapshot) {
                                    if (snapshot.connectionState == ConnectionState.waiting) {
                                      return const Center(child: CircularProgressIndicator());
                                    }
                                    return _MetricCard(
                                      title: "Concluídas",
                                      value: snapshot.data ?? 0,
                                      color: Colors.green,
                                    );
                                  },
                                ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: FutureBuilder<int>(
                                  future: vm.total,
                                  builder: (context, snapshot) {
                                    if (snapshot.connectionState == ConnectionState.waiting) {
                                      return const Center(child: CircularProgressIndicator());
                                    }
                                    return _MetricCard(
                                      title: "Total",
                                      value: snapshot.data ?? 0,
                                      color: Colors.blue,
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 10),
                        TaskSlots(vm: vm),
                        const SizedBox(height: 10),
                        CategoryPieChart(vm: vm),
                        const SizedBox(height: 18),

                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 16),
                          padding: const EdgeInsets.all(18),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(18),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.03),
                                blurRadius: 10,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Row(
                                children: [
                                  Icon(
                                    Icons.auto_awesome,
                                    color: Color(0xFF6A1B9A),
                                    size: 18,
                                  ),
                                  SizedBox(width: 8),
                                  Text(
                                    "Insights Contábeis",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                      color: Color(0xFF2D2D2D),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 14),

                              if (vm.isLoadingInsight)
                                const Center(
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(vertical: 20),
                                    child: CircularProgressIndicator(color: Color(0xFF7B2FD3)),
                                  ),
                                )
                              else ...[
                                if (vm.insight.isEmpty || vm.insight.contains('{"recomendacoes":'))
                                  Text(
                                    "Nenhum insight gerado ainda. Cadastre tarefas para ativar a IA!",
                                    style: TextStyle(fontSize: 13, color: Colors.grey.shade600),
                                  )
                                else ...(() {
                                  final linhas = vm.insight.split('\n');
                                  List<Widget> widgets = [];
                                  
                                  bool emUrgente = false;
                                  bool adicionouTituloDicas = false;
                                  bool adicionouTituloUrgente = false;

                                  for (var linha in linhas) {
                                    String textoLimpo = linha
                                        .replaceAll('**', '')
                                        .replaceAll('###', '')
                                        .replaceAll('*', '')
                                        .replaceAll('•', '')
                                        .trim();

                                    if (textoLimpo.isEmpty) continue;

                                    if (textoLimpo.toLowerCase().startsWith('olá') || 
                                        textoLimpo.toLowerCase().contains('aqui estão algumas dicas') ||
                                        textoLimpo.toLowerCase() == 'dicas gerais' ||
                                        textoLimpo.toLowerCase() == 'o que é mais urgente') {
                                      
                                      if (textoLimpo.toLowerCase().contains('urgente')) {
                                        emUrgente = true;
                                      }
                                      continue;
                                    }

                                    if (textoLimpo.toLowerCase().contains('urgente') && !adicionouTituloUrgente) {
                                      emUrgente = true;
                                    }

                                    if (!emUrgente && !adicionouTituloDicas) {
                                      widgets.add(
                                        const Padding(
                                          padding: EdgeInsets.only(bottom: 10, top: 4),
                                          child: Text(
                                            "💡 DICAS E RECOMENDAÇÕES",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold, 
                                              color: Color(0xFF7B2FD3), 
                                              fontSize: 13, 
                                              letterSpacing: 0.5
                                            ),
                                          ),
                                        ),
                                      );
                                      adicionouTituloDicas = true;
                                    }

                                    if (emUrgente && !adicionouTituloUrgente) {
                                      widgets.add(
                                        const Padding(
                                          padding: EdgeInsets.only(top: 16, bottom: 10),
                                          child: Text(
                                            "⚠️ O QUE É MAIS URGENTE HOJE",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold, 
                                              color: Colors.redAccent, 
                                              fontSize: 13, 
                                              letterSpacing: 0.5
                                            ),
                                          ),
                                        ),
                                      );
                                      adicionouTituloUrgente = true;
                                    }

                                    widgets.add(
                                      Container(
                                        margin: const EdgeInsets.only(bottom: 8),
                                        padding: const EdgeInsets.all(12),
                                        decoration: BoxDecoration(
                                          color: emUrgente ? const Color(0xFFFFF5F5) : const Color(0xFFF9F5FF),
                                          borderRadius: BorderRadius.circular(10),
                                          border: Border.all(
                                            color: emUrgente ? Colors.redAccent.withOpacity(0.2) : const Color(0xFF7B2FD3).withOpacity(0.15),
                                          ),
                                        ),
                                        child: Row(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Icon(
                                              emUrgente ? Icons.error_outline : Icons.lightbulb_outline,
                                              color: emUrgente ? Colors.redAccent : const Color(0xFF7B2FD3),
                                              size: 18,
                                            ),
                                            const SizedBox(width: 10),
                                            Expanded(
                                              child: Text(
                                                textoLimpo,
                                                style: TextStyle(
                                                  fontSize: 13,
                                                  color: emUrgente ? const Color(0xFF7A1C1C) : const Color(0xFF3B1E54),
                                                  fontWeight: FontWeight.w500,
                                                  height: 1.4,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  }

                                  return widgets.isNotEmpty ? widgets : [Text(vm.insight, style: const TextStyle(fontSize: 13))];
                                })(),
                              ],

                              const SizedBox(height: 10),
                              
                              Align(
                                alignment: Alignment.centerRight,
                                child: TextButton.icon(
                                  onPressed: vm.isLoadingInsight 
                                      ? null 
                                      : () => vm.generateInsightForDay(vm.selectedDay),
                                  icon: const Icon(Icons.auto_awesome, size: 14, color: Color(0xFF6A1B9A)),
                                  label: const Text(
                                    "Atualizar Insights",
                                    style: TextStyle(color: Color(0xFF6A1B9A), fontSize: 12),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 30),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _MetricCard extends StatelessWidget {
  final String title;
  final int value;
  final Color color;

  const _MetricCard({
    required this.title,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            "$value",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}
