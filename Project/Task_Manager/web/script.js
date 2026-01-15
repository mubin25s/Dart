let allTasks = [];

// Load tasks from the JSON file
async function loadTasks() {
    try {
        const response = await fetch('../tasks.json');
        if (!response.ok) {
            throw new Error('Tasks file not found');
        }
        allTasks = await response.json();
        updateStats();
        displayTasks(allTasks);
    } catch (error) {
        console.error('Error loading tasks:', error);
        displayEmptyState();
    }
}

// Update statistics
function updateStats() {
    const total = allTasks.length;
    const completed = allTasks.filter(task => task.isCompleted).length;
    const pending = total - completed;
    const highPriority = allTasks.filter(task => task.priority === 'high').length;

    document.getElementById('totalTasks').textContent = total;
    document.getElementById('completedTasks').textContent = completed;
    document.getElementById('pendingTasks').textContent = pending;
    document.getElementById('highPriorityTasks').textContent = highPriority;
}

// Display tasks
function displayTasks(tasks) {
    const container = document.getElementById('tasksContainer');
    
    if (tasks.length === 0) {
        displayEmptyState();
        return;
    }

    container.innerHTML = tasks.map(task => createTaskCard(task)).join('');
}

// Create task card HTML
function createTaskCard(task) {
    const statusIcon = task.isCompleted ? '✅' : '⭕';
    const completedClass = task.isCompleted ? 'completed' : '';
    const dueDate = task.dueDate ? new Date(task.dueDate).toLocaleDateString() : 'No due date';
    const createdDate = new Date(task.createdAt).toLocaleDateString();

    return `
        <div class="task-card priority-${task.priority} ${completedClass}">
            <div class="task-header">
                <div class="task-title">
                    <span class="task-status">${statusIcon}</span>
                    ${task.title}
                </div>
                <span class="task-priority priority-${task.priority}">${task.priority}</span>
            </div>
            <div class="task-description">
                ${task.description || 'No description provided'}
            </div>
            <div class="task-meta">
                <span>📅 Created: ${createdDate}</span>
                <span>⏰ Due: ${dueDate}</span>
                <span>🆔 ID: ${task.id}</span>
            </div>
        </div>
    `;
}

// Display empty state
function displayEmptyState() {
    const container = document.getElementById('tasksContainer');
    container.innerHTML = `
        <div class="empty-state">
            <p>📭 No tasks found</p>
            <p class="hint">Run the CLI application to add tasks, then click Refresh</p>
        </div>
    `;
}

// Filter tasks
function filterTasks() {
    const filterValue = document.getElementById('filterSelect').value;
    let filteredTasks = [];

    switch (filterValue) {
        case 'all':
            filteredTasks = allTasks;
            break;
        case 'pending':
            filteredTasks = allTasks.filter(task => !task.isCompleted);
            break;
        case 'completed':
            filteredTasks = allTasks.filter(task => task.isCompleted);
            break;
        case 'high':
        case 'medium':
        case 'low':
            filteredTasks = allTasks.filter(task => task.priority === filterValue);
            break;
    }

    displayTasks(filteredTasks);
}

// Load tasks on page load
window.addEventListener('load', loadTasks);

// Auto-refresh every 5 seconds
setInterval(loadTasks, 5000);
