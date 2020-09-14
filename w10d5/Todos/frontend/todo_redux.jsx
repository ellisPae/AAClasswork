import React from 'react';
import ReactDOM from 'react-dom';
// import { Provider } from 'react-redux';

import configureStore from './store/store.js';
import { receiveTodo, receiveTodos } from './actions/todo_actions';
import Root from './components/root';




// React - Presentational Components:
document.addEventListener('DOMContentLoaded', () => {
    const root = document.getElementById('content')
    window.store = configureStore;
    window.receiveTodo = receiveTodo;
    window.receiveTodos = receiveTodos;

    ReactDOM.render(<Root store={store} />, root);
})


