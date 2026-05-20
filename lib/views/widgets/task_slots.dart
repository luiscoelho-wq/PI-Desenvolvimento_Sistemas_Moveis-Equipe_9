import 'package:flutter/material.dart';
import '../../viewmodels/dashboard_viewmodel.dart';
import '../../models/task_model.dart';

class TaskSlots extends StatelessWidget {
  final DashboardViewModel vm;

  const TaskSlots({super.key, required this.vm});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Task>>(
      future: vm.getTasks(vm.selectedDay),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const SizedBox.shrink();
        }

        final tasks = snapshot.data!;
        final canAddMore = tasks.length < 5;

        return Column(
          children: [
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.fromLTRB(16, 6, 16, 4),
              itemCount: tasks.length,
              itemBuilder: (_, index) {
                final task = tasks[index];
                return TaskItem(task: task, vm: vm);
              },
            ),

            if (canAddMore)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: _TaskInputSlot(vm: vm),
              ),

            const SizedBox(height: 8),
          ],
        );
      },
    );
  }
}

class TaskItem extends StatelessWidget {
  final Task task;
  final DashboardViewModel vm;

  const TaskItem({
    super.key,
    required this.task,
    required this.vm,
  });

  // Cores de prioridade atualizadas para bater com a seleção
  Color _priorityColor(TaskPriority p) {
    switch (p) {
      case TaskPriority.high:
        return Colors.red;
      case TaskPriority.medium:
        return Colors.orange;
      case TaskPriority.low:
        return Colors.green;
    }
  }

  String _priorityLabel(TaskPriority p) {
    switch (p) {
      case TaskPriority.high:
        return "Alta";
      case TaskPriority.medium:
        return "Média";
      case TaskPriority.low:
        return "Baixa";
    }
  }

  // Cores de Categoria padronizadas (Tributos = Roxo, Honorários = Verde, Fiscal = Azul)
  Color _categoryColor(TaskCategory c) {
    switch (c) {
      case TaskCategory.tributos:
        return const Color(0xFF8253F0); // Roxo
      case TaskCategory.honorarios:
        return const Color(0xFF5DAB14); // Verde
      case TaskCategory.fiscal:
        return const Color(0xFF7EA6E7); // Azul
    }
  }

  String _categoryLabel(TaskCategory c) {
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
    final pColor = _priorityColor(task.priority);
    final pLabel = _priorityLabel(task.priority);
    final cColor = _categoryColor(task.category);
    final cLabel = _categoryLabel(task.category);

    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: const Color.fromARGB(255, 255, 255, 255),
          width: 0.8,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 16,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Row(
        children: [
          // Indicador lateral baseado na prioridade da tarefa
          Container(
            width: 5,
            height: 55,
            decoration: BoxDecoration(
              color: pColor,
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          const SizedBox(width: 12),

          Checkbox(
            value: task.isDone,
            activeColor: pColor,
            onChanged: (_) => vm.toggleTask(task),
          ),
          const SizedBox(width: 8),

          Expanded(
            child: Text(
              task.description,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                decoration: task.isDone ? TextDecoration.lineThrough : null,
                color: task.isDone ? Colors.grey : const Color(0xFF2D2D2D),
              ),
            ),
          ),

          const SizedBox(width: 4),

          // LISTA DE TAGS DA DIREITA (Categoria + Prioridade)
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              // Tag da Categoria (Ex: Tributos, Fiscal...)
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: cColor.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  cLabel,
                  style: TextStyle(
                    color: cColor,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 4),
              
              // Tag da Prioridade (Ex: Alta, Média, Baixa)
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: pColor.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  pLabel,
                  style: TextStyle(
                    color: pColor,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _TaskInputSlot extends StatefulWidget {
  final DashboardViewModel vm;

  const _TaskInputSlot({required this.vm});

  @override
  State<_TaskInputSlot> createState() => _TaskInputSlotState();
}

class _TaskInputSlotState extends State<_TaskInputSlot> {
  final controller = TextEditingController();

  TaskPriority priority = TaskPriority.medium;
  TaskCategory category = TaskCategory.tributos;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: const Color(0xFFE4E4E4),
          width: 1.2,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 16,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Card(
        color: Colors.white,
        elevation: 0,
        shadowColor: Colors.transparent,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Adicionar tarefa",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF2D2D2D),
                ),
              ),
              const SizedBox(height: 14),

              Container(
                padding: const EdgeInsets.symmetric(horizontal: 14),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: const Color(0xFFE9E9E9),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.03),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: TextField(
                  controller: controller,
                  decoration: const InputDecoration(
                    hintText: "Digite uma tarefa...",
                    hintStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ),
              const SizedBox(height: 16),

              const Text(
                "Selecione a Prioridade",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 13,
                ),
              ),
              const SizedBox(height: 8),

              Row(
                children: [
                  _PriorityOption(
                    label: "Alta",
                    color: Colors.red,
                    selected: priority == TaskPriority.high,
                    onTap: () => setState(() => priority = TaskPriority.high),
                  ),
                  const SizedBox(width: 6),
                  _PriorityOption(
                    label: "Média",
                    color: Colors.orange,
                    selected: priority == TaskPriority.medium,
                    onTap: () => setState(() => priority = TaskPriority.medium),
                  ),
                  const SizedBox(width: 6),
                  _PriorityOption(
                    label: "Baixa",
                    color: Colors.green,
                    selected: priority == TaskPriority.low,
                    onTap: () => setState(() => priority = TaskPriority.low),
                  ),
                ],
              ),
              const SizedBox(height: 14),

              const Text(
                "Selecione a Categoria",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 13,
                ),
              ),
              const SizedBox(height: 8),

              Row(
                children: [
                  _CategoryOption(
                    label: "Tributos",
                    selected: category == TaskCategory.tributos,
                    onTap: () => setState(() => category = TaskCategory.tributos),
                  ),
                  const SizedBox(width: 6),
                  _CategoryOption(
                    label: "Honorários",
                    selected: category == TaskCategory.honorarios,
                    onTap: () => setState(() => category = TaskCategory.honorarios),
                  ),
                  const SizedBox(width: 6),
                  _CategoryOption(
                    label: "Fiscal",
                    selected: category == TaskCategory.fiscal,
                    onTap: () => setState(() => category = TaskCategory.fiscal),
                  ),
                ],
              ),
              const SizedBox(height: 18),

              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () async {
                    if (controller.text.trim().isEmpty) return;

                    await widget.vm.addTask(
                      controller.text.trim(),
                      priority,
                      category,
                    );

                    controller.clear();
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                    decoration: BoxDecoration(
                      color: const Color(0xFF6A1B9A),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.add, color: Colors.white, size: 18),
                        SizedBox(width: 6),
                        Text(
                          "Adicionar",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
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
      ),
    );
  }
}

class _PriorityOption extends StatelessWidget {
  final String label;
  final Color color;
  final bool selected;
  final VoidCallback onTap;

  const _PriorityOption({
    required this.label,
    required this.color,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        decoration: BoxDecoration(
          color: selected ? color.withOpacity(0.2) : Colors.grey.shade100,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: selected ? color : Colors.grey.shade300,
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 12,
            fontWeight: selected ? FontWeight.bold : FontWeight.normal,
            color: selected ? color : Colors.black87,
          ),
        ),
      ),
    );
  }
}

class _CategoryOption extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const _CategoryOption({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  Color _getColor() {
    switch (label) {
      case "Tributos":
        return const Color(0xFF8253F0); // Roxo
      case "Honorários":
        return const Color(0xFF5DAB14); // Verde
      case "Fiscal":
        return const Color(0xFF7EA6E7); // Azul
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    final color = _getColor();

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        decoration: BoxDecoration(
          color: selected ? color.withOpacity(0.15) : Colors.grey.shade100,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: selected ? color : Colors.grey.shade300,
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: selected ? color : Colors.grey.shade700,
          ),
        ),
      ),
    );
  }
}