// We're taking in some data from the store => Store needs to be in a specific format
// Selectors - "getter" methods for the app state
    // they receive the state as an argument
    // return a subset of the data formatted in a specific way


// Need a function to transform an obj of todos into an array
// for easy consumption by our components


export const allTodos = ({ todos }) => {
    Object.keys(todos).map(id => {
        todos[id];
    });
}

// Test selector:
// Put your selector on the window and pass it the default state.
// Does it format the data into an array of todos ? 
// If it's good, let 's put it to use on our TodoList!
