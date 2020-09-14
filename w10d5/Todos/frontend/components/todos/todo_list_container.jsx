import { connect } from 'react-redux';
import TodoList from './todo_list';

import { allTodos } from '../../reducers/selectors';
import { receiveTodo } from '../../actions/todo_actions';


const mapStateToProps = state => ({
    todos: allTodos(state)
    // "todos" is a prop
});

const mapDispatchToProps = dispatch => {
    receiveTodo: todo => dispatch(receiveTodo(todo))
    // receiveTodo prop takes in a todo as an arg
    // invokes call to dispatch w/ the action returned from receiveTodo action creator
};

export default connect(
    mapStateToProps,
    mapDispatchToProps
)(TodoList);


// Test code:
// Add TodoListContainer to your App component.
// Reload your app and see Todo List goes here!.
