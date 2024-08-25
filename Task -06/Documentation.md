# Overview
The React Todo App is a simple task management tool built with React.js that allows users to create, view, update and delete tasks. It uses React's component-based architechture and state management to provide a responsive and user-friendly interface for managing to-do items. 

## Functionality

## Data Model
In React ToDo App, each task is represented by:
```
{
  id: number,
  title: string,
  completed: boolean
}
```
## Components
### App
The root component that holds the state for the list of tasks and renders other components.
- State
  `tasks`: An array of task objects.
- Methods
  `addTask(title)`: Adds a new task to the list.
  `toggleTaskCompletion(id)`: Toggles the completion status of a task.
  `deleteTask(id)`: Removes a task from the list.
  `updateTask(id, newTitle)`: Updates the title of a task.
- TaskList
Displays the list of tasks.
   - Props
     `tasks`: Array of task objects.
     `onToggle`: Function to toggle task completion.
     `onDelete`: Function to delete a task.
     `onUpdate`: Function to update a task.
- TaskItem
Represents a single task item.
