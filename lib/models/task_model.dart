enum TaskCategory { tributos, honorarios, fiscal }

enum TaskPriority { low, medium, high }

class Task {
  final String id;
  final DateTime date;
  final String description;
  final TaskPriority priority;
  final TaskCategory category;
  bool isDone;

  Task({
    required this.id,
    required this.date,
    required this.description,
    required this.priority,
    required this.category,
    this.isDone = false,
  });

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "date": date.toIso8601String(),
      "description": description,
      "priority": priority.name,
      "category": category.name,
      "isDone": isDone,
    };
  }

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      id: map["id"],
      date: DateTime.parse(map["date"]),
      description: map["description"],
      priority: TaskPriority.values.firstWhere(
        (e) => e.name == map["priority"],
      ),
      category: TaskCategory.values.firstWhere(
        (e) => e.name == map["category"],
      ),
      isDone: map["isDone"] ?? false,
    );
  }
}