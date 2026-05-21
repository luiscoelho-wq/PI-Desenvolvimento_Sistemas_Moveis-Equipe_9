import 'package:flutter/material.dart';
import '../models/task_model.dart';
import '../repositories/task_repository.dart';
import '../services/ai_service.dart';
import '../services/auth_service.dart';

class DashboardViewModel extends ChangeNotifier {
  final TaskRepository repository;
  final AuthService authService;
  
  final AIService _aiService = AIService();

  DashboardViewModel({
    required this.repository,
    required this.authService,
  });

  DateTime selectedDay = DateTime(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
  );
  
  Map<DateTime, String> insightsByDay = {};
  Map<DateTime, bool> generatedByDay = {};
  
  bool isLoadingInsight = false;

  DateTime _normalize(DateTime date) =>
      DateTime(date.year, date.month, date.day);

  String get userId => authService.currentUser?.id ?? "guest";

  void setSelectedDay(DateTime day) {
    selectedDay = _normalize(day);
    notifyListeners();
  }

  Future<List<Task>> getTasks(DateTime date) async {
    return await repository.getTasks(date);
  }

  Future<void> addTask(
    String description,
    TaskPriority priority,
    TaskCategory category,
  ) async {
    final day = _normalize(selectedDay);

    final existingTasks = await repository.getTasks(day);

    if (existingTasks.length >= 5) return;

    final task = Task(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      date: day,
      description: description,
      priority: priority,
      category: category,
    );

    await repository.addTask(task);

    notifyListeners();

    final tasks = await repository.getTasks(day);

    if (tasks.length >= 5 && generatedByDay[day] != true) {
      await generateInsightForDay(day);
    }
  }

  Future<void> toggleTask(Task task) async {
    task.isDone = !task.isDone;
    await repository.updateTask(task);
    notifyListeners();
  }

  Future<int> get total async {
    final tasks = await getTasks(selectedDay);
    return tasks.length;
  }

  Future<int> get pendentes async {
    final tasks = await getTasks(selectedDay);
    return tasks.where((t) => !t.isDone).length;
  }

  Future<int> get concluidas async {
    final tasks = await getTasks(selectedDay);
    return tasks.where((t) => t.isDone).length;
  }

  Future<Map<TaskCategory, int>> get categoryCount async {
    final tasks = await getTasks(selectedDay);

    final map = {
      TaskCategory.tributos: 0,
      TaskCategory.honorarios: 0,
      TaskCategory.fiscal: 0,
    };

    for (final t in tasks) {
      map[t.category] = (map[t.category] ?? 0) + 1;
    }

    return map;
  }

  Future<Map<TaskCategory, double>> get categoryPercent async {
    final tasks = await getTasks(selectedDay);
    final totalTasks = tasks.length;
    final counts = await categoryCount;

    if (totalTasks == 0) {
      return {
        TaskCategory.tributos: 0,
        TaskCategory.honorarios: 0,
        TaskCategory.fiscal: 0,
      };
    }

    return {
      for (final e in counts.entries)
        e.key: (e.value / totalTasks) * 100,
    };
  }

  String get insight =>
      insightsByDay[_normalize(selectedDay)] ?? '{"recomendacoes":[], "prioridades":[]}';

  Future<void> generateInsightForDay(DateTime day) async {
    final normalizedDay = _normalize(day);
    
    final tasks = await repository.getTasks(normalizedDay);

    if (tasks.isEmpty) {
      insightsByDay[normalizedDay] = '{"recomendacoes":["Nenhuma tarefa cadastrada para hoje."], "prioridades":[]}';
      notifyListeners();
      return;
    }

    final text = tasks
        .map((e) => "- [${e.category.name.toUpperCase()}] ${e.description} (Prioridade: ${e.priority.name})")
        .join("\n");

    isLoadingInsight = true;
    notifyListeners();

    try {
      final result = await _aiService.generateInsight(text);
      
      insightsByDay[normalizedDay] = result;
      generatedByDay[normalizedDay] = true;
    } catch (e) {
      insightsByDay[normalizedDay] = '{"recomendacoes":["Não foi possível carregar os insights agora."], "prioridades":[]}';
    } {
      isLoadingInsight = false;
      notifyListeners();
    }
  }
}
