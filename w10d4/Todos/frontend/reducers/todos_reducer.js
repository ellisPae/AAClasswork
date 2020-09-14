import { RECEIVE_TODOS, RECEIVE_TODO } from './todo_actions';


const todosReducer = (state = {}, action) => {
    Object.freeze(state);
    let newState;

    switch (action.type) {
        case RECEIVE_TODOS:
            newState = Object.assign({}, state)
            action.todos.forEach(todo => {
                newState[todo.id] = todo
            });
            return newState;
        case RECEIVE_TODO:
            let newTodo = {[action.todo.id]: action.todo}
            newState = Object.assign({}, state, newTodo)
        default:
            return state;o
    }
}

// {
//     1: {
//         id: 1,
//         title: 'wash car',
//         body: 'with soap',
//         done: false
//     },
//     2: {
//         id: 2,
//         title: 'wash dog',
//         body: 'with shampoo',
//         done: true
//     },
// }


export default todosReducer;
