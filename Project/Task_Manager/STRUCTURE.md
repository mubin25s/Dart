# Task Manager - Project Structure

```
d:\Dart\Project\Task_Manager/
│
├── 📁 bin/
│   └── main.dart                    # CLI Application Entry Point
│                                    # - Interactive menu system
│                                    # - User input handling
│                                    # - Task operations
│
├── 📁 lib/
│   ├── task.dart                    # Task Model Class
│   │                                # - Task properties (id, title, description, etc.)
│   │                                # - JSON serialization (toJson/fromJson)
│   │                                # - Display methods with color coding
│   │
│   └── task_manager.dart            # Task Manager Class
│                                    # - CRUD operations (Create, Read, Update, Delete)
│                                    # - File I/O (save/load from JSON)
│                                    # - Filtering and statistics
│
├── 📁 web/
│   ├── index.html                   # Web Interface
│   │                                # - Statistics dashboard
│   │                                # - Task display cards
│   │                                # - Filter controls
│   │
│   ├── style.css                    # Styling
│   │                                # - Purple gradient background
│   │                                # - Glassmorphism effects
│   │                                # - Animations and transitions
│   │                                # - Responsive design
│   │
│   └── script.js                    # JavaScript Logic
│                                    # - Load tasks from JSON
│                                    # - Dynamic task rendering
│                                    # - Filter functionality
│                                    # - Auto-refresh (5 seconds)
│
├── 📄 pubspec.yaml                  # Dart Project Configuration
├── 📄 .gitignore                    # Git Ignore Rules
├── 📄 run.bat                       # Windows Quick Launch Script
│
├── 📖 README.md                     # Main Documentation
├── 📖 SETUP.md                      # Installation Guide
├── 📖 QUICKSTART.md                 # Quick Reference
└── 📖 STRUCTURE.md                  # This File
│
└── 📊 tasks.json                    # Auto-generated Task Storage
                                     # (Created after first task is added)
```

## File Relationships

```
┌─────────────────────────────────────────────────────────────┐
│                     USER INTERACTION                        │
└─────────────────────────────────────────────────────────────┘
                    │                    │
                    ▼                    ▼
        ┌──────────────────┐   ┌──────────────────┐
        │   CLI Interface  │   │  Web Interface   │
        │   (main.dart)    │   │  (index.html)    │
        └──────────────────┘   └──────────────────┘
                    │                    │
                    ▼                    ▼
        ┌──────────────────────────────────────┐
        │      TaskManager Class               │
        │      (task_manager.dart)             │
        │  - addTask()                         │
        │  - removeTask()                      │
        │  - completeTask()                    │
        │  - saveTasks()                       │
        │  - loadTasks()                       │
        └──────────────────────────────────────┘
                    │                    │
                    ▼                    ▼
        ┌──────────────────┐   ┌──────────────────┐
        │   Task Class     │   │   tasks.json     │
        │   (task.dart)    │   │   (Storage)      │
        │  - toJson()      │◄─►│                  │
        │  - fromJson()    │   │                  │
        └──────────────────┘   └──────────────────┘
```

## Data Flow

### Adding a Task (CLI)
```
User Input → main.dart → TaskManager.addTask() → Task.toJson() → tasks.json
```

### Viewing Tasks (Web)
```
tasks.json → script.js fetch() → Parse JSON → Render HTML → Display
```

### Complete Workflow
```
1. User runs: dart run bin/main.dart
2. TaskManager loads existing tasks from tasks.json
3. User selects "Add New Task"
4. User enters task details
5. TaskManager creates new Task object
6. Task is added to list and saved to tasks.json
7. User can view in CLI or web browser
8. Web interface auto-refreshes and displays updated tasks
```

## Key Components

### Backend (Dart)
- **Task Model**: Represents individual tasks with properties and methods
- **TaskManager**: Manages collection of tasks and file operations
- **Main CLI**: Interactive command-line interface

### Frontend (Web)
- **HTML**: Structure and layout
- **CSS**: Modern styling with animations
- **JavaScript**: Dynamic content loading and filtering

### Storage
- **JSON File**: Persistent storage for all tasks
- **Auto-save**: Tasks saved automatically after each operation

## Design Patterns Used

1. **Model-View Pattern**
   - Model: Task class
   - View: CLI (main.dart) and Web (HTML/CSS/JS)
   - Controller: TaskManager class

2. **Factory Pattern**
   - Task.fromJson() factory constructor

3. **Singleton-like Pattern**
   - TaskManager manages single tasks.json file

4. **Repository Pattern**
   - TaskManager acts as repository for Task objects

## Technologies

- **Dart**: Backend logic and CLI
- **HTML5**: Web structure
- **CSS3**: Styling with modern features
- **JavaScript (ES6+)**: Frontend interactivity
- **JSON**: Data persistence

## Features by File

| File | Features |
|------|----------|
| `task.dart` | Task model, JSON serialization, color coding |
| `task_manager.dart` | CRUD operations, file I/O, filtering |
| `main.dart` | Interactive menu, user input, task operations |
| `index.html` | Statistics, task cards, filter controls |
| `style.css` | Gradients, glassmorphism, animations |
| `script.js` | Dynamic rendering, auto-refresh, filtering |

---

**This structure provides a clean separation of concerns and makes the codebase easy to understand and maintain.**
