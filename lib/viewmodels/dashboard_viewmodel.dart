import 'package:flutter/material.dart';
import '../models/task_model.dart';
import '../repositories/task_repository.dart';
import '../services/ai_service.dart';
import '../services/auth_service.dart';

class DashboardViewModel extends ChangeNotifier {
  final TaskRepository repository;
  final AuthService authService;

  // Criamos uma conexão com o seu serviço de IA aqui dentro
  final AIService _aiService = AIService();

  DashboardViewModel({required this.repository, required this.authService});

  DateTime selectedDay = DateTime(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
  );

  // Aqui vamos guardar os textos (insights) que a IA criar para cada dia
  Map<DateTime, String> insightsByDay = {};
  Map<DateTime, bool> generatedByDay = {};

  // Essa caixinha avisa o aplicativo se a IA está "pensando" (carregando) no momento
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
      for (final e in counts.entries) e.key: (e.value / totalTasks) * 100,
    };
  }

  // Se a IA ainda não criou nada para o dia, devolvemos um texto padrão seguro em formato JSON
  String get insight =>
      insightsByDay[_normalize(selectedDay)] ??
      '{"recomendacoes":[], "prioridades":[]}';

  // Esta é a função principal que chama a Inteligência Artificial!
  Future<void> generateInsightForDay(DateTime day) async {
    final normalizedDay = _normalize(day);

    // Pegamos as tarefas daquele dia
    final tasks = await repository.getTasks(normalizedDay);

    if (tasks.isEmpty) {
      insightsByDay[normalizedDay] =
          '{"recomendacoes":["Nenhuma tarefa cadastrada para hoje."], "prioridades":[]}';
      notifyListeners();
      return;
    }

    // Juntamos o nome, a categoria e a prioridade das tarefas em um texto só para a IA ler
    final text = tasks
        .map(
          (e) =>
              "- [${e.category.name.toUpperCase()}] ${e.description} (Prioridade: ${e.priority.name})",
        )
        .join("\n");

    // Avisamos a tela que a IA começou a carregar (vai aparecer a rodinha de carregando)
    isLoadingInsight = true;
    notifyListeners();

    try {
      // Enviamos o texto para o Gemini e esperamos a resposta
      final result = await _aiService.generateInsight(text);

      // Guardamos o resultado
      insightsByDay[normalizedDay] = result;
      generatedByDay[normalizedDay] = true;
    } catch (e) {
      // Se der algum erro (ex: falta de internet), guardamos uma mensagem de erro estilizada
      insightsByDay[normalizedDay] =
          '{"recomendacoes":["Não foi possível carregar os insights agora."], "prioridades":[]}';
    }
    {
      // Por fim, avisamos que a IA terminou de carregar
      isLoadingInsight = false;
      notifyListeners();
    }
  }
}
