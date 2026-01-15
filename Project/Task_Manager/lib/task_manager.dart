import 'dart:io';
import 'dart:convert';
import 'task.dart';

/// Manages a collection of tasks with CRUD operations
class TaskManager {
  List<Task> tasks = [];
  final String storageFile = 'tasks.json';

  TaskManager() {
    loadTasks();
  }

  /// Generate unique ID for new tasks
  String _generateId() {
    return DateTime.now().millisecondsSinceEpoch.toString();
  }

  /// Add a new task
  void addTask(String title, {String description = '', DateTime? dueDate, String priority = 'medium'}) {
    final task = Task(
      id: _generateId(),
      title: title,
      description: description,
      createdAt: DateTime.now(),
      dueDate: dueDate,
      priority: priority,
    );
    tasks.add(task);
    saveTasks();
    print('\n✓ Task added successfully!');
  }

  /// Remove a task by ID
  bool removeTask(String id) {
    final initialLength = tasks.length;
    tasks.removeWhere((task) => task.id == id);
    
    if (tasks.length < initialLength) {
      saveTasks();
      print('\n✓ Task removed successfully!');
      return true;
    }
    print('\n✗ Task not found!');
    return false;
  }

  /// Mark task as completed
  bool completeTask(String id) {
    try {
      final task = tasks.firstWhere((task) => task.id == id);
      task.complete();
      saveTasks();
      print('\n✓ Task marked as completed!');
      return true;
    } catch (e) {
      print('\n✗ Task not found!');
      return false;
    }
  }

  /// Get all tasks
  List<Task> getAllTasks() {
    return tasks;
  }

  /// Get pending tasks
  List<Task> getPendingTasks() {
    return tasks.where((task) => !task.isCompleted).toList();
  }

  /// Get completed tasks
  List<Task> getCompletedTasks() {
    return tasks.where((task) => task.isCompleted).toList();
  }

  /// Get tasks by priority
  List<Task> getTasksByPriority(String priority) {
    return tasks.where((task) => task.priority.toLowerCase() == priority.toLowerCase()).toList();
  }

  /// Save tasks to JSON file
  void saveTasks() {
    try {
      final file = File(storageFile);
      final jsonData = tasks.map((task) => task.toJson()).toList();
      file.writeAsStringSync(json.encode(jsonData));
    } catch (e) {
      print('Error saving tasks: $e');
    }
  }

  /// Load tasks from JSON file
  void loadTasks() {
    try {
      final file = File(storageFile);
      if (file.existsSync()) {
        final jsonString = file.readAsStringSync();
        final List<dynamic> jsonData = json.decode(jsonString);
        tasks = jsonData.map((json) => Task.fromJson(json)).toList();
      }
    } catch (e) {
      print('Error loading tasks: $e');
      tasks = [];
    }
  }

  /// Display all tasks
  void displayTasks({bool showCompleted = true}) {
    final tasksToShow = showCompleted ? tasks : getPendingTasks();
    
    if (tasksToShow.isEmpty) {
      print('\nNo tasks to display.');
      return;
    }

    print('\n${'=' * 60}');
    print('TASKS (${tasksToShow.length})');
    print('=' * 60);
    
    for (var task in tasksToShow) {
      print('\nID: ${task.id}');
      print(task);
      print('-' * 60);
    }
  }

  /// Get statistics
  void displayStats() {
    final total = tasks.length;
    final completed = getCompletedTasks().length;
    final pending = getPendingTasks().length;
    final highPriority = getTasksByPriority('high').length;

    print('\n${'=' * 60}');
    print('TASK STATISTICS');
    print('=' * 60);
    print('Total Tasks: $total');
    print('Completed: $completed');
    print('Pending: $pending');
    print('High Priority: $highPriority');
    print('=' * 60);
  }
}
