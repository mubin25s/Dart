// Task Manager Application - JavaScript

class TaskManager {
    constructor() {
        this.tasks = this.loadTasks();
        this.currentFilter = 'all';
        this.currentPriorityFilter = 'all';
        this.searchQuery = '';
        this.init();
    }

    init() {
        this.setupEventListeners();
        this.renderTasks();
        this.updateStats();
        this.loadTheme();
    }

    setupEventListeners() {
        // Form submission
        document.getElementById('taskForm').addEventListener('submit', (e) => {
            e.preventDefault();
            this.addTask();
        });

        // Filter buttons
        document.querySelectorAll('.filter-btn').forEach(btn => {
            btn.addEventListener('click', (e) => {
                document.querySelectorAll('.filter-btn').forEach(b => b.classList.remove('active'));
                e.target.classList.add('active');
                this.currentFilter = e.target.dataset.filter;
                this.renderTasks();
            });
        });

        // Priority filter
        document.getElementById('priorityFilter').addEventListener('change', (e) => {
            this.currentPriorityFilter = e.target.value;
            this.renderTasks();
        });

        // Search
        document.getElementById('searchInput').addEventListener('input', (e) => {
            this.searchQuery = e.target.value.toLowerCase();
            this.renderTasks();
        });

        // Theme toggle
        document.getElementById('themeToggle').addEventListener('click', () => {
            this.toggleTheme();
        });

        // Set minimum date to today
        const today = new Date().toISOString().split('T')[0];
        document.getElementById('taskDueDate').setAttribute('min', today);
    }

    addTask() {
        const title = document.getElementById('taskTitle').value.trim();
        const description = document.getElementById('taskDescription').value.trim();
        const priority = document.getElementById('taskPriority').value;
        const dueDate = document.getElementById('taskDueDate').value;

        if (!title) {
            this.showToast('Please enter a task title!', 'error');
            return;
        }

        const task = {
            id: Date.now().toString(),
            title,
            description,
            priority,
            dueDate,
            createdAt: new Date().toISOString(),
            completed: false
        };

        this.tasks.unshift(task);
        this.saveTasks();
        this.renderTasks();
        this.updateStats();
        
        // Reset form
        document.getElementById('taskForm').reset();
        
        this.showToast('✅ Task added successfully!', 'success');
    }

    toggleTaskComplete(id) {
        const task = this.tasks.find(t => t.id === id);
        if (task) {
            task.completed = !task.completed;
            this.saveTasks();
            this.renderTasks();
            this.updateStats();
            
            const message = task.completed ? '✅ Task completed!' : '↩️ Task marked as pending';
            this.showToast(message, 'success');
        }
    }

    deleteTask(id) {
        if (confirm('Are you sure you want to delete this task?')) {
            this.tasks = this.tasks.filter(t => t.id !== id);
            this.saveTasks();
            this.renderTasks();
            this.updateStats();
            this.showToast('🗑️ Task deleted!', 'success');
        }
    }

    getFilteredTasks() {
        let filtered = [...this.tasks];

        // Filter by status
        if (this.currentFilter === 'pending') {
            filtered = filtered.filter(t => !t.completed);
        } else if (this.currentFilter === 'completed') {
            filtered = filtered.filter(t => t.completed);
        }

        // Filter by priority
        if (this.currentPriorityFilter !== 'all') {
            filtered = filtered.filter(t => t.priority === this.currentPriorityFilter);
        }

        // Filter by search
        if (this.searchQuery) {
            filtered = filtered.filter(t => 
                t.title.toLowerCase().includes(this.searchQuery) ||
                t.description.toLowerCase().includes(this.searchQuery)
            );
        }

        return filtered;
    }

    renderTasks() {
        const container = document.getElementById('tasksContainer');
        const emptyState = document.getElementById('emptyState');
        const filteredTasks = this.getFilteredTasks();

        if (filteredTasks.length === 0) {
            container.innerHTML = '';
            emptyState.classList.remove('hidden');
            
            if (this.tasks.length === 0) {
                emptyState.innerHTML = `
                    <div class="empty-icon">📭</div>
                    <h3>No tasks yet</h3>
                    <p>Create your first task to get started!</p>
                `;
            } else {
                emptyState.innerHTML = `
                    <div class="empty-icon">🔍</div>
                    <h3>No tasks found</h3>
                    <p>Try adjusting your filters or search query</p>
                `;
            }
            return;
        }

        emptyState.classList.add('hidden');
        container.innerHTML = filteredTasks.map(task => this.createTaskCard(task)).join('');

        // Add event listeners to task buttons
        filteredTasks.forEach(task => {
            const completeBtn = document.getElementById(`complete-${task.id}`);
            const deleteBtn = document.getElementById(`delete-${task.id}`);
            const statusIcon = document.getElementById(`status-${task.id}`);

            if (completeBtn) {
                completeBtn.addEventListener('click', () => this.toggleTaskComplete(task.id));
            }
            if (deleteBtn) {
                deleteBtn.addEventListener('click', () => this.deleteTask(task.id));
            }
            if (statusIcon) {
                statusIcon.addEventListener('click', () => this.toggleTaskComplete(task.id));
            }
        });
    }

    createTaskCard(task) {
        const createdDate = new Date(task.createdAt).toLocaleDateString('en-US', {
            year: 'numeric',
            month: 'short',
            day: 'numeric'
        });

        const dueDate = task.dueDate ? new Date(task.dueDate).toLocaleDateString('en-US', {
            year: 'numeric',
            month: 'short',
            day: 'numeric'
        }) : 'No due date';

        const isOverdue = task.dueDate && new Date(task.dueDate) < new Date() && !task.completed;
        const statusIcon = task.completed ? '✅' : '⭕';
        const completedClass = task.completed ? 'completed' : '';

        const priorityIcons = {
            high: '🔴',
            medium: '🟡',
            low: '🟢'
        };

        return `
            <div class="task-card priority-${task.priority} ${completedClass}">
                <div class="task-header">
                    <div class="task-title-section">
                        <div class="task-title">
                            <span class="task-status-icon" id="status-${task.id}">${statusIcon}</span>
                            ${this.escapeHtml(task.title)}
                        </div>
                    </div>
                    <span class="task-priority-badge priority-${task.priority}">
                        ${priorityIcons[task.priority]} ${task.priority}
                    </span>
                </div>
                
                ${task.description ? `
                    <div class="task-description">
                        ${this.escapeHtml(task.description)}
                    </div>
                ` : ''}
                
                <div class="task-meta">
                    <span>📅 Created: ${createdDate}</span>
                    <span ${isOverdue ? 'style="color: var(--danger); font-weight: 700;"' : ''}>
                        ⏰ Due: ${dueDate} ${isOverdue ? '(Overdue!)' : ''}
                    </span>
                </div>
                
                <div class="task-actions">
                    <button class="task-btn task-btn-complete" id="complete-${task.id}">
                        ${task.completed ? '↩️ Undo' : '✓ Complete'}
                    </button>
                    <button class="task-btn task-btn-delete" id="delete-${task.id}">
                        🗑️ Delete
                    </button>
                </div>
            </div>
        `;
    }

    updateStats() {
        const total = this.tasks.length;
        const completed = this.tasks.filter(t => t.completed).length;
        const pending = total - completed;
        const highPriority = this.tasks.filter(t => t.priority === 'high' && !t.completed).length;

        document.getElementById('totalTasks').textContent = total;
        document.getElementById('completedTasks').textContent = completed;
        document.getElementById('pendingTasks').textContent = pending;
        document.getElementById('highPriorityTasks').textContent = highPriority;
    }

    saveTasks() {
        localStorage.setItem('tasks', JSON.stringify(this.tasks));
    }

    loadTasks() {
        const tasks = localStorage.getItem('tasks');
        return tasks ? JSON.parse(tasks) : [];
    }

    toggleTheme() {
        const currentTheme = document.documentElement.getAttribute('data-theme');
        const newTheme = currentTheme === 'dark' ? 'light' : 'dark';
        
        document.documentElement.setAttribute('data-theme', newTheme);
        localStorage.setItem('theme', newTheme);
        
        const themeIcon = document.querySelector('.theme-icon');
        themeIcon.textContent = newTheme === 'dark' ? '☀️' : '🌙';
        
        this.showToast(`${newTheme === 'dark' ? '🌙' : '☀️'} ${newTheme === 'dark' ? 'Dark' : 'Light'} mode activated`, 'success');
    }

    loadTheme() {
        const savedTheme = localStorage.getItem('theme') || 'light';
        document.documentElement.setAttribute('data-theme', savedTheme);
        
        const themeIcon = document.querySelector('.theme-icon');
        themeIcon.textContent = savedTheme === 'dark' ? '☀️' : '🌙';
    }

    showToast(message, type = 'success') {
        const toast = document.getElementById('toast');
        const toastMessage = document.getElementById('toastMessage');
        
        toastMessage.textContent = message;
        toast.classList.add('show');
        
        setTimeout(() => {
            toast.classList.remove('show');
        }, 3000);
    }

    escapeHtml(text) {
        const div = document.createElement('div');
        div.textContent = text;
        return div.innerHTML;
    }
}

// Initialize the app when DOM is loaded
document.addEventListener('DOMContentLoaded', () => {
    window.taskManager = new TaskManager();
});

// Add some demo tasks on first load
if (!localStorage.getItem('tasks')) {
    const demoTasks = [
        {
            id: '1',
            title: 'Welcome to Task Manager! 🎉',
            description: 'This is a demo task. You can add, complete, or delete tasks. Try adding your own!',
            priority: 'high',
            dueDate: new Date(Date.now() + 86400000).toISOString().split('T')[0],
            createdAt: new Date().toISOString(),
            completed: false
        },
        {
            id: '2',
            title: 'Complete project documentation',
            description: 'Write comprehensive documentation for the new feature',
            priority: 'medium',
            dueDate: new Date(Date.now() + 172800000).toISOString().split('T')[0],
            createdAt: new Date().toISOString(),
            completed: false
        },
        {
            id: '3',
            title: 'Review pull requests',
            description: 'Check and approve pending pull requests from the team',
            priority: 'low',
            dueDate: '',
            createdAt: new Date().toISOString(),
            completed: true
        }
    ];
    
    localStorage.setItem('tasks', JSON.stringify(demoTasks));
}
