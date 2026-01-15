import 'dart:io';
import '../lib/task_manager.dart';

void main() {
  final taskManager = TaskManager();
  
  print('\n╔════════════════════════════════════════════════════════════╗');
  print('║          WELCOME TO TASK MANAGER CLI v1.0                 ║');
  print('╚════════════════════════════════════════════════════════════╝');

  bool running = true;

  while (running) {
    displayMenu();
    final choice = stdin.readLineSync()?.trim() ?? '';

    switch (choice) {
      case '1':
        addNewTask(taskManager);
        break;
      case '2':
        taskManager.displayTasks();
        break;
      case '3':
        taskManager.displayTasks(showCompleted: false);
        break;
      case '4':
        completeTask(taskManager);
        break;
      case '5':
        removeTask(taskManager);
        break;
      case '6':
        taskManager.displayStats();
        break;
      case '7':
        filterByPriority(taskManager);
        break;
      case '8':
        print('\nThank you for using Task Manager! Goodbye! 👋');
        running = false;
        break;
      default:
        print('\n❌ Invalid choice. Please try again.');
    }

    if (running) {
      print('\nPress Enter to continue...');
      stdin.readLineSync();
    }
  }
}

void displayMenu() {
  print('\n┌────────────────────────────────────────────────────────────┐');
  print('│                      MAIN MENU                             │');
  print('├────────────────────────────────────────────────────────────┤');
  print('│  1. Add New Task                                           │');
  print('│  2. View All Tasks                                         │');
  print('│  3. View Pending Tasks                                     │');
  print('│  4. Mark Task as Completed                                 │');
  print('│  5. Remove Task                                            │');
  print('│  6. View Statistics                                        │');
  print('│  7. Filter by Priority                                     │');
  print('│  8. Exit                                                   │');
  print('└────────────────────────────────────────────────────────────┘');
  stdout.write('\nEnter your choice (1-8): ');
}

void addNewTask(TaskManager manager) {
  print('\n┌─── ADD NEW TASK ───────────────────────────────────────────┐');
  
  stdout.write('Enter task title: ');
  final title = stdin.readLineSync()?.trim() ?? '';
  
  if (title.isEmpty) {
    print('❌ Title cannot be empty!');
    return;
  }

  stdout.write('Enter description (optional): ');
  final description = stdin.readLineSync()?.trim() ?? '';

  stdout.write('Enter priority (low/medium/high) [default: medium]: ');
  var priority = stdin.readLineSync()?.trim().toLowerCase() ?? 'medium';
  if (!['low', 'medium', 'high'].contains(priority)) {
    priority = 'medium';
  }

  stdout.write('Add due date? (y/n): ');
  final addDueDate = stdin.readLineSync()?.trim().toLowerCase() == 'y';
  
  DateTime? dueDate;
  if (addDueDate) {
    stdout.write('Enter due date (YYYY-MM-DD): ');
    final dateStr = stdin.readLineSync()?.trim() ?? '';
    try {
      dueDate = DateTime.parse(dateStr);
    } catch (e) {
      print('⚠️  Invalid date format. Skipping due date.');
    }
  }

  manager.addTask(
    title,
    description: description,
    priority: priority,
    dueDate: dueDate,
  );
}

void completeTask(TaskManager manager) {
  print('\n┌─── COMPLETE TASK ──────────────────────────────────────────┐');
  manager.displayTasks(showCompleted: false);
  
  if (manager.getPendingTasks().isEmpty) {
    return;
  }

  stdout.write('\nEnter task ID to mark as completed: ');
  final id = stdin.readLineSync()?.trim() ?? '';
  manager.completeTask(id);
}

void removeTask(TaskManager manager) {
  print('\n┌─── REMOVE TASK ────────────────────────────────────────────┐');
  manager.displayTasks();
  
  if (manager.getAllTasks().isEmpty) {
    return;
  }

  stdout.write('\nEnter task ID to remove: ');
  final id = stdin.readLineSync()?.trim() ?? '';
  
  stdout.write('Are you sure? (y/n): ');
  final confirm = stdin.readLineSync()?.trim().toLowerCase() == 'y';
  
  if (confirm) {
    manager.removeTask(id);
  } else {
    print('❌ Removal cancelled.');
  }
}

void filterByPriority(TaskManager manager) {
  print('\n┌─── FILTER BY PRIORITY ─────────────────────────────────────┐');
  stdout.write('Enter priority (low/medium/high): ');
  final priority = stdin.readLineSync()?.trim().toLowerCase() ?? '';
  
  final filteredTasks = manager.getTasksByPriority(priority);
  
  if (filteredTasks.isEmpty) {
    print('\nNo tasks found with priority: $priority');
    return;
  }

  print('\n${'=' * 60}');
  print('TASKS WITH PRIORITY: ${priority.toUpperCase()} (${filteredTasks.length})');
  print('=' * 60);
  
  for (var task in filteredTasks) {
    print('\nID: ${task.id}');
    print(task);
    print('-' * 60);
  }
}
