/// Represents a single task with properties and methods
class Task {
  String id;
  String title;
  String description;
  DateTime createdAt;
  DateTime? dueDate;
  bool isCompleted;
  String priority; // 'low', 'medium', 'high'

  Task({
    required this.id,
    required this.title,
    this.description = '',
    required this.createdAt,
    this.dueDate,
    this.isCompleted = false,
    this.priority = 'medium',
  });

  /// Convert Task to JSON Map
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'createdAt': createdAt.toIso8601String(),
      'dueDate': dueDate?.toIso8601String(),
      'isCompleted': isCompleted,
      'priority': priority,
    };
  }

  /// Create Task from JSON Map
  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      id: json['id'],
      title: json['title'],
      description: json['description'] ?? '',
      createdAt: DateTime.parse(json['createdAt']),
      dueDate: json['dueDate'] != null ? DateTime.parse(json['dueDate']) : null,
      isCompleted: json['isCompleted'] ?? false,
      priority: json['priority'] ?? 'medium',
    );
  }

  /// Mark task as completed
  void complete() {
    isCompleted = true;
  }

  /// Mark task as incomplete
  void uncomplete() {
    isCompleted = false;
  }

  /// Get priority color for display
  String getPriorityColor() {
    switch (priority.toLowerCase()) {
      case 'high':
        return '\x1B[31m'; // Red
      case 'medium':
        return '\x1B[33m'; // Yellow
      case 'low':
        return '\x1B[32m'; // Green
      default:
        return '\x1B[37m'; // White
    }
  }

  /// Display task information
  @override
  String toString() {
    final status = isCompleted ? '✓' : '○';
    final colorCode = getPriorityColor();
    final resetCode = '\x1B[0m';
    final dueDateStr = dueDate != null ? ' | Due: ${dueDate!.toString().split(' ')[0]}' : '';
    
    return '$colorCode[$status] $title$resetCode\n'
           '   Priority: $priority | Created: ${createdAt.toString().split(' ')[0]}$dueDateStr\n'
           '   ${description.isEmpty ? 'No description' : description}';
  }
}
