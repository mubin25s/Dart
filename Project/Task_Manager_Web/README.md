# Task Manager - Web Application

A beautiful, fully-functional task management web application built with pure HTML, CSS, and JavaScript.

## 🌟 Features

### Core Functionality
- ✅ **Add Tasks** - Create tasks with title, description, priority, and due date
- ✅ **Complete Tasks** - Mark tasks as done with a single click
- ✅ **Delete Tasks** - Remove tasks with confirmation
- ✅ **Edit Status** - Toggle between completed and pending

### Advanced Features
- 🔍 **Search** - Real-time search across task titles and descriptions
- 🎯 **Filter by Status** - View all, pending, or completed tasks
- 🎨 **Filter by Priority** - Filter by high, medium, or low priority
- 📊 **Live Statistics** - Real-time dashboard with task metrics
- 🌓 **Dark Mode** - Toggle between light and dark themes
- 💾 **Local Storage** - Tasks persist across browser sessions
- 📱 **Responsive Design** - Works perfectly on all devices
- ⚡ **Fast & Lightweight** - No dependencies, pure vanilla JavaScript

### UI/UX Features
- 🎨 **Modern Design** - Beautiful purple gradient theme
- ✨ **Smooth Animations** - Polished transitions and effects
- 🔔 **Toast Notifications** - User-friendly feedback messages
- 🎯 **Priority Color Coding** - Visual priority indicators
- ⏰ **Overdue Detection** - Highlights overdue tasks
- 📅 **Date Formatting** - Human-readable date displays

## 🚀 How to Use

### Quick Start
1. Open `index.html` in your web browser
2. Start adding tasks!

### Adding a Task
1. Fill in the task title (required)
2. Add a description (optional)
3. Select priority level (low, medium, high)
4. Set a due date (optional)
5. Click "Add Task"

### Managing Tasks
- **Complete**: Click the ⭕ icon or "✓ Complete" button
- **Undo**: Click the ✅ icon or "↩️ Undo" button
- **Delete**: Click "🗑️ Delete" button (with confirmation)

### Filtering & Search
- Use filter buttons to view: All Tasks, Pending, or Completed
- Use priority dropdown to filter by priority level
- Use search box to find specific tasks
- Filters can be combined for precise results

### Dark Mode
- Click the 🌙/☀️ icon in the header to toggle themes
- Theme preference is saved automatically

## 📁 Project Structure

```
Task_Manager_Web/
├── index.html          # Main HTML structure
├── style.css           # Complete styling with animations
├── script.js           # Full application logic
└── README.md           # This file
```

## 🎨 Design Features

### Color Scheme
- **Primary**: Purple gradient (#667eea → #764ba2)
- **High Priority**: Red (#ef4444)
- **Medium Priority**: Orange (#f59e0b)
- **Low Priority**: Green (#10b981)

### Responsive Breakpoints
- **Desktop**: 1200px+
- **Tablet**: 768px - 1199px
- **Mobile**: < 768px

## 💡 Technical Details

### Technologies Used
- **HTML5** - Semantic markup
- **CSS3** - Modern styling with CSS Grid, Flexbox, animations
- **JavaScript (ES6+)** - Class-based architecture, local storage

### Browser Compatibility
- ✅ Chrome (recommended)
- ✅ Firefox
- ✅ Safari
- ✅ Edge
- ✅ Opera

### Data Storage
- Uses browser's `localStorage` API
- Data persists across sessions
- No server required
- No database needed

## 🎯 Key Features Explained

### Statistics Dashboard
- **Total Tasks**: Count of all tasks
- **Completed**: Number of finished tasks
- **Pending**: Number of incomplete tasks
- **High Priority**: Count of urgent pending tasks

### Priority Levels
- **🔴 High**: Urgent and important tasks
- **🟡 Medium**: Normal priority tasks
- **🟢 Low**: Can wait, nice to have

### Task States
- **Pending**: Active tasks to be completed
- **Completed**: Finished tasks (shown with strikethrough)
- **Overdue**: Past due date and not completed (highlighted in red)

## 🔧 Customization

### Changing Colors
Edit the CSS variables in `style.css`:
```css
:root {
    --primary-color: #667eea;
    --secondary-color: #764ba2;
    /* ... more variables */
}
```

### Adding Features
The code is well-structured and commented. Key areas:
- **TaskManager class** in `script.js` - Main application logic
- **Event listeners** - User interaction handling
- **Render methods** - UI updates

## 📝 Demo Data

The app includes 3 demo tasks on first load:
1. Welcome message (high priority)
2. Project documentation (medium priority)
3. Review pull requests (low priority, completed)

You can delete these and add your own tasks!

## 🎓 Learning Resources

This project demonstrates:
- **DOM Manipulation** - Dynamic content creation
- **Event Handling** - User interactions
- **Local Storage** - Data persistence
- **CSS Grid & Flexbox** - Modern layouts
- **CSS Animations** - Smooth transitions
- **Responsive Design** - Mobile-first approach
- **ES6 Classes** - Object-oriented JavaScript
- **Array Methods** - filter, map, find, etc.

## 🚀 Future Enhancements

Potential features to add:
- Task categories/tags
- Task editing
- Drag and drop reordering
- Export to JSON/CSV
- Import tasks
- Recurring tasks
- Task reminders
- Subtasks
- Task notes
- File attachments

## 📄 License

Free to use for personal and commercial projects.

## 👨‍💻 Author

Created as a demonstration of modern web development with vanilla JavaScript.

---

**Enjoy managing your tasks! 🎉**
