# Overview
The React Todo List application is a task management tool that allows users to create, view, update, and delete tasks. It leverages React's component-based architecture to provide an interactive and responsive user interface for managing to-do items. 

# Functionality
## Utility Functions

### objectWithOnly(object, attrs)
- **Purpose**: Creates a new object containing only the specified attributes from the original object. The attributes remain bound to the original object.
- * Parameters:
    * object: The original object from which attributes are selected.
    * attrs: An array of attribute names to be included in the new object.
- **Usage**: Useful for exposing only certain properties of an object, particularly when passing props to React components.

### wrapChildrenWith(children, props)
- **Purpose**: Wraps React children elements with additional props.
- **Parameters**:
    * children: The child elements to be wrapped.
    * props: The additional props to inject into the children.
- **Usage**: Commonly used in higher-order components (HOCs) to add functionality or data to child components.
### stringIncludes(str, substr)
- Purpose: Checks if a string contains a specific substring.
- Parameters:
    * str: The main string to search within.
    * substr: The substring to search for.
- Returns: true if the substring is found, false otherwise.
- Usage: Useful for filtering or searching within strings.

## Data Model
In React ToDo App, each task is represented by:
```
{
  id: number,
  title: string,
  completed: boolean
}
```
# Components
## TodoList
* `props.data.list`
    * An array of todo items representing the tasks to be displayed.
* `props.data.filter`
    * A filter condition (e.g., active, completed) that determines which tasks are shown.
* `props.data.mode`
    * The current operational mode of the app, which could indicate different states like editing or viewing tasks.
* `props.data.query`
    * The search query used to filter tasks by name or description.
* `props.actions.addNew()`
    * Function to add a new task.
* `props.actions.changeFilter()`
    * Function to change the current filter applied to the list.
* `props.actions.changeStatus()`
    * Function to change the status of a task (e.g., from active to completed).
* `props.actions.changeMode()`
    * Function to change the current mode of the application.
* `props.actions.setSearchQuery()`
    * Function to set the current search query.
### Header
* `props.addNew`
    * Function passed to the InputWrapper component to handle adding new tasks.
* `props.mode`
    * The current mode of the app, which can influence the behavior or display of the header.
* `props.query`
    * The search query string used to filter tasks.
* `props.setSearchQuery`
    * Function to update the search query.
* Components:
    * `InputWrapper`: Handles the input field and logic for adding new tasks.
### Info
* `props.mode`
    * The current operational mode of the app.
* `Message Displayed`:
    * Shows either INFO_SHORTCUT_KEYS or INFO_CANCEL_SHORTCUT_KEY based on the mode.
## Views
### TodoList Component
* `applyFilter(list, filter)`
    * Filters the list of tasks according to the specified filter (e.g., active tasks).
* `search(items, query)`
    * Further filters the list based on the search query.
* Rendering:
    * Passes the filtered and searched list to FilteredList for display.
    * Includes Header, Footer, and Info components for user interaction and contextual information.
## Forms
InputWrapper
* `props.addNew`
    * Handles the submission of new tasks entered by the user.
* `props.mode`
    * Influences the input behavior or display.
* `props.query`
    * Reflects the current search query entered by the user.
* `props.setSearchQuery`
    * Updates the search query based on user input.
### Implementation Details
## Task Creation
Tasks are created through the input field within the `InputWrapper` component in `Header.js`. The `addNew` function is called to process the input and add a new task to the list.
## Task Listing
Tasks are listed in the `TodoList.js` component by applying the filter and search query to the list prop. The filtered list is passed to the `FilteredList` component for rendering.
## Task Update
Tasks can be updated by interacting with the list items in `FilteredList`. The changeStatus function is used to toggle the completion status of tasks.
## Task Deletion
Tasks can be deleted using the functionality encapsulated within the list item components, where the changeStatus function is used to manage the task's state.

# Code Example
Here’s a snippet from the TodoList.js file showing how tasks are filtered and listed:
```
### javascript
import React from 'react';
import Header from './Header';
import FilteredList from './FilteredList';
import Footer from './Footer';
import Info from './Info';
import { applyFilter, search } from '../../util/filter';

export default function TodoList(props) {
    const {list, filter, mode, query} = props.data;
    const {addNew, changeFilter, changeStatus, changeMode, setSearchQuery} = props.actions;
    const activeItemCount = applyFilter(list, FILTER_ACTIVE).length;
    const items = search(applyFilter(list, filter), query);

    return (
        <div className="container">
            <div className="row">
                <div className="todolist">
                    <Header {...{addNew, mode, query, setSearchQuery}}/>
                    <FilteredList {...{items, changeStatus}}/>
                    <Footer {...{activeItemCount, filter, changeFilter, mode, changeMode}}/>
                    <Info {...{mode}}/>
                </div>
            </div>
        </div>
    );
}
```
This structure closely mirrors the format you provided and should be easy to follow for understanding and maintaining the React Todo List application.






