import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import '../../viewmodels/dashboard_viewmodel.dart';
import '../../models/task_model.dart';

class CategoryPieChart extends StatelessWidget {
  final DashboardViewModel vm;

  const CategoryPieChart({super.key, required this.vm});

  Color _color(TaskCategory c) {
    switch (c) {
      case TaskCategory.tributos:
        return const Color.fromARGB(255, 145, 107, 234);
      case TaskCategory.honorarios:
        return const Color.fromARGB(255, 191, 233, 136);
      case TaskCategory.fiscal:
        return const Color.fromARGB(255, 148, 183, 238);
    }
  }

  String _label(TaskCategory c) {
    switch (c) {
      case TaskCategory.tributos:
        return "Tributos";
      case TaskCategory.honorarios:
        return "Honorários";
      case TaskCategory.fiscal:
        return "Fiscal";
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<TaskCategory, double>>(
      future: vm.categoryPercent,
      builder: (context, snapshot) {
        final data = snapshot.data ??
            {
              TaskCategory.tributos: 0,
              TaskCategory.honorarios: 0,
              TaskCategory.fiscal: 0,
            };

        return Container(
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
              const Text(
                "Resumo diário",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF2D2D2D),
                ),
              ),
              const SizedBox(height: 4),
              const Text(
                "Tipo de Tarefa",
                style: TextStyle(
                  fontSize: 13,
                  color: Color.fromARGB(255, 42, 41, 41),
                ),
              ),
              const SizedBox(height: 18),
              Row(
                children: [
                  SizedBox(
                    width: 140,
                    height: 140,
                    child: PieChart(
                      PieChartData(
                        sectionsSpace: 4,
                        centerSpaceRadius: 48,
                        sections: TaskCategory.values.map((c) {
                          final value = data[c] ?? 0;
                          return PieChartSectionData(
                            value: value == 0 ? 1 : value,
                            color: _color(c),
                            radius: 26,
                            title: value == 0
                                ? ""
                                : "${value.toStringAsFixed(0)}%",
                            titleStyle: const TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: TaskCategory.values.map((c) {
                        final percent = data[c] ?? 0;
                        return Padding(
                          padding:
                              const EdgeInsets.symmetric(vertical: 8),
                          child: Row(
                            children: [
                              Container(
                                width: 12,
                                height: 12,
                                decoration: BoxDecoration(
                                  color: _color(c),
                                  borderRadius: BorderRadius.circular(100),
                                ),
                              ),
                              const SizedBox(width: 10),
                              Text(
                                _label(c),
                                style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 13,
                                ),
                              ),
                              const Spacer(),
                              Text(
                                "${percent.toStringAsFixed(0)}%",
                                style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Color.fromARGB(255, 0, 0, 0),
                                ),
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
